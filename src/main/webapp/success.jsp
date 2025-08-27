<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="success-icon">
            <i class="fa-solid fa-check-circle"></i>
        </div>

        <%
            String action = request.getParameter("action");
            String message = "Operation was successful!";
            if ("added".equals(action)) {
                message = "The new student has been successfully added to the database.";
            } else if ("updated".equals(action)) {
                message = "The student record has been successfully updated.";
            } else if ("deleted".equals(action)) {
                message = "The student record has been successfully deleted.";
            }
        %>

        <h1>Record <span class="highlight">Successful</span></h1>
        <p><%= message %></p>

        <div class="action-buttons">
            <a href="index.jsp" class="btn">
                <i class="fa-solid fa-home"></i>
                Go to Portal
            </a>
            <a href="viewStudents" class="btn">
                <i class="fa-solid fa-users"></i>
                View All Students
            </a>
        </div>
    </div>
</body>
</html>