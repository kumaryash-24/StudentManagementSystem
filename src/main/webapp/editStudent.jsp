<%@ page import="com.example.bean.Student" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <h1>Edit <span class="highlight">Student</span></h1>
        <p>Update the student's details below and click save.</p>

        <% Student student = (Student) request.getAttribute("student"); %>

        <form action="updateStudent" method="post" class="student-form">
            
            <!-- **STEP 1: ADD A HIDDEN FIELD** -->
            <!-- This field is invisible to the user but sends the ORIGINAL roll number to the controller. -->
            <input type="hidden" name="originalRollNumber" value="<%= student.getRollNumber() %>">

            <!-- **STEP 2: MAKE THE VISIBLE ROLL NUMBER EDITABLE** -->
            <div class="form-group">
                <label for="rollNumber">Roll Number</label>
                <input type="text" id="rollNumber" name="rollNumber" class="form-input" value="<%= student.getRollNumber() %>" required>
            </div>

            <div class="form-group">
                <label for="name">Student Name</label>
                <input type="text" id="name" name="name" class="form-input" value="<%= student.getName() %>" required>
            </div>

            <div class="form-group">
                <label for="studentClass">Class</label>
                <input type="text" id="studentClass" name="studentClass" class="form-input" value="<%= student.getStudentClass() %>" required>
            </div>

            <button type="submit" class="btn" style="margin-top: 20px;">
                <i class="fa-solid fa-save"></i>
                Save Changes
            </button>
        </form>
         <br>
        <a href="viewStudents" class="btn-secondary">
            <i class="fa-solid fa-times"></i>
            Cancel and Return
        </a>
    </div>
</body>
</html>