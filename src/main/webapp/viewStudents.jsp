<%@ page import="java.util.List" %>
<%@ page import="com.example.bean.Student" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Directory</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <h1>Student <span class="highlight">Directory</span></h1>
        
       
        <div class="search-container">
            <form action="viewStudents" method="post" class="search-form">
                <input type="text" name="searchTerm" class="search-input" placeholder="Search by student name..." value="${searchTerm != null ? searchTerm : ''}">
                <button type="submit" class="search-btn">
                    <i class="fa-solid fa-search"></i>
                </button>
            </form>
        </div>
        
        <table class="student-table">
            <thead>
                <tr>
                    <th>Roll Number</th>
                    <th>Name</th>
                    <th>Class</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                  List<Student> students = (List<Student>) request.getAttribute("students");
                  if (students != null && !students.isEmpty()) {
                      for (Student student : students) {
                %>
                        <tr>
                            <td><%= student.getRollNumber() %></td>
                            <td><%= student.getName() %></td>
                            <td><%= student.getStudentClass() %></td>
                            <td class="actions-cell">
                                <a href="editStudent?rollNumber=<%= student.getRollNumber() %>" class="action-btn edit">
                                    <i class="fa-solid fa-pencil"></i> Edit
                                </a>
                                <a href="deleteStudent?rollNumber=<%= student.getRollNumber() %>" class="action-btn delete" onclick="return confirm('Are you sure you want to delete this student?');">
                                    <i class="fa-solid fa-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                <%
                      }
                  } else {
                %>
                    <tr>
                        <td colspan="4" style="text-align:center;">No students found for your search.</td>
                    </tr>
                <%
                  }
                %>
            </tbody>
        </table>
        
        <br>
        <a href="index.jsp" class="btn" style="margin-top: 20px;">
            <i class="fa-solid fa-arrow-left"></i>
            Return to Portal
        </a>
    </div>
</body>
</html>