<p align="center">
<!--   <img src="https://media.giphy.com/media/zhJ55MqoYiVzi/giphy.gif" width="200"> -->
  <img src="https://media.giphy.com/media/RbDKaczqWovIugyJmW/giphy.gif" width="350">
</p>
             
<h1 align="center">Student Management System</h1>                                                
                                  
<p align="center">
  A full-featured, modern web application for managing student records, built with a robust Java backend and a stunning, respon sive user interface.
</p>      

<p align="center">
    <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java">
    <img src="https://img.shields.io/badge/Servlets-D02324?style=for-the-badge&logo=apache&logoColor=white" alt="Servlets">
    <img src="https://img.shields.io/badge/JSP-1B75BB?style=for-the-badge&logo=oracle&logoColor=white" alt="JSP">
    <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
    <img src="https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black" alt="Tomcat">
    <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS3">
    <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5">
</p>

## ✨ About The Project

This project is a dynamic and fully functional **Student Management System** developed using the **MVC (Model-View-Controller)** architecture. It provides administrators with the ability to perform complete CRUD (Create, Read, Update, Delete) operations on student records, all through a beautiful and intuitive web interface. The "Crimson Peak" UI theme ensures a professional and engaging user experience.

---

## 📸 Screenshots

Here's a glimpse of the application's stunning "Crimson Peak" user interface.

| Portal Page | Student Directory Page |
| :---: | :---: |
| ![Student Management Portal](https://github.com/user-attachments/assets/8a443e49-92ba-4aed-9a6c-645bb80709bb) | ![Student Directory](https://github.com/user-attachments/assets/305d4ab6-34e0-4acd-9ece-ceaaa956e0ef)
 

---


## 🚀 Features

This application comes with a complete set of features for effective student management:

*   **View All Students:** A clean, paginated view of all students in the database.
*   **Add New Students:** An intuitive form to add new student records.
*   **Edit Student Information:** Seamlessly update any student's details, including their Roll Number.
*   **Delete Students:** Remove student records with a confirmation step to prevent accidental deletions.
*   **Search Functionality:** A powerful search bar to instantly filter students by name.
*   **Secure Operations:** Utilizes `PreparedStatement` to protect against SQL injection attacks.
*   **Fully Responsive UI:** The user interface is designed to look great on all devices.

---

## 🛠️ Technology Stack

This project was built using a robust and industry-standard set of technologies:

*   **Backend:** Java, Servlets
*   **Frontend:** JSP, HTML, CSS (No frameworks, pure CSS for styling)
*   **Database:** MySQL
*   **Server:** Apache Tomcat
*   **Architecture:** MVC (Model-View-Controller)

---

## ⚙️ Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   **JDK** (Java Development Kit) 11 or higher
*   **Apache Tomcat** 9.0 or higher
*   **MySQL** Database Server
*   An IDE like **Eclipse** or IntelliJ IDEA

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/your-username/StudentManagementSystem.git
    ```

2.  **Import the project** into your favorite IDE (e.g., as a Maven project in Eclipse).

3.  **Database Setup:**
    *   Open your MySQL client (like HeidiSQL or MySQL Workbench).
    *   Run the following SQL script to create the database and table:
        ```sql
        CREATE DATABASE IF NOT EXISTS student_db;
        USE student_db;
        CREATE TABLE IF NOT EXISTS students (
            roll_number INT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            student_class VARCHAR(50) NOT NULL
        );
        ```

4.  **Configure the Database Connection:**
    *   Open the `src/main/java/com/example/controller/StudentController.java` file.
    *   Update the `PASSWORD` constant with your actual MySQL root password:
        ```java
        private static final String PASSWORD = "your_password_here";
        ```

5.  **Run the Application:**
    *   Configure your Apache Tomcat server in your IDE.
    *   Right-click the project and select **Run As > Run on Server**.
    *   The application will open in your browser at `http://localhost:8080/StudentManagementSystem/`.

---

## 🏛️ Project Structure

The project follows the MVC architecture to ensure a clean separation of concerns:

*   **Model:** `com.example.bean.Student.java` - The Java Bean that represents the student data structure.
*   **View:** All `.jsp` files (`index.jsp`, `viewStudents.jsp`, etc.) and the `style.css` file - Responsible for the user interface.
*   **Controller:** `com.example.controller.StudentController.java` - The Servlet that handles all user requests, interacts with the database, and controls the application flow.

---

<p align="center">
  Created with ❤️ by Kumar Yash
</p>
