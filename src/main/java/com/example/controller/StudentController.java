package com.example.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.bean.Student;

@WebServlet({"/viewStudents", "/addStudent", "/editStudent", "/updateStudent", "/deleteStudent"})
public class StudentController extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/student_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "2t@!"; // Ensure this is your correct MySQL password
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    private Connection conn;

    public void init() throws ServletException {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Database connection failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/editStudent":
                    showEditForm(request, response);
                    break;
                case "/deleteStudent":
                    deleteStudent(request, response);
                    break;
                default: 
                    listStudents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/addStudent":
                    insertStudent(request, response);
                    break;
                case "/updateStudent":
                    updateStudent(request, response);
                    break;
                default: // Handle search form submission (if method="post")
                    listStudents(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    //  Action Methods 

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        
        String searchTerm = request.getParameter("searchTerm");
        
        List<Student> students;
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            
            students = searchStudentsInDB(searchTerm);
        } else {
           
            students = getStudentsFromDB();
        }
        
        request.setAttribute("students", students);
        
        request.setAttribute("searchTerm", searchTerm);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewStudents.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
        Student existingStudent = getStudentByRollNumber(rollNumber);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editStudent.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);
    }

    private void insertStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
        String name = request.getParameter("name");
        String studentClass = request.getParameter("studentClass");
        
        addStudentToDB(rollNumber, name, studentClass);
        response.sendRedirect("success.jsp?action=added");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int newRollNumber = Integer.parseInt(request.getParameter("rollNumber"));
        String name = request.getParameter("name");
        String studentClass = request.getParameter("studentClass");
        int originalRollNumber = Integer.parseInt(request.getParameter("originalRollNumber"));

        updateStudentInDB(newRollNumber, name, studentClass, originalRollNumber);
        response.sendRedirect("success.jsp?action=updated");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
        deleteStudentFromDB(rollNumber);
        response.sendRedirect("success.jsp?action=deleted");
    }

    // --- Database Methods ---

    private List<Student> getStudentsFromDB() throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students ORDER BY roll_number ASC";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                students.add(new Student(rs.getInt("roll_number"), rs.getString("name"), rs.getString("student_class")));
            }
        }
        return students;
    }
    
    // **NEW DATABASE METHOD FOR SEARCHING**
    private List<Student> searchStudentsInDB(String searchTerm) throws SQLException {
        List<Student> students = new ArrayList<>();
        // Use a PreparedStatement for security and to handle the LIKE clause
        String sql = "SELECT * FROM students WHERE name LIKE ? ORDER BY roll_number ASC";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // The '%' are wildcards, meaning "match any characters before or after the search term"
            pstmt.setString(1, "%" + searchTerm + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                students.add(new Student(rs.getInt("roll_number"), rs.getString("name"), rs.getString("student_class")));
            }
        }
        return students;
    }

    private Student getStudentByRollNumber(int rollNumber) throws SQLException {
        Student student = null;
        String sql = "SELECT * FROM students WHERE roll_number = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, rollNumber);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                student = new Student(rs.getInt("roll_number"), rs.getString("name"), rs.getString("student_class"));
            }
        }
        return student;
    }

    private void addStudentToDB(int rollNumber, String name, String studentClass) throws SQLException {
        String sql = "INSERT INTO students (roll_number, name, student_class) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, rollNumber);
            pstmt.setString(2, name);
            pstmt.setString(3, studentClass);
            pstmt.executeUpdate();
        }
    }

    private void updateStudentInDB(int newRollNumber, String name, String studentClass, int originalRollNumber) throws SQLException {
        String sql = "UPDATE students SET roll_number = ?, name = ?, student_class = ? WHERE roll_number = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, newRollNumber);
            pstmt.setString(2, name);
            pstmt.setString(3, studentClass);
            pstmt.setInt(4, originalRollNumber);
            pstmt.executeUpdate();
        }
    }

    private void deleteStudentFromDB(int rollNumber) throws SQLException {
        String sql = "DELETE FROM students WHERE roll_number = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, rollNumber);
            pstmt.executeUpdate();
        }
    }
    
    @Override
    public void destroy() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}