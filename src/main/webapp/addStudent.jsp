<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Student</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <h1>Add New <span class="highlight">Student</span></h1>
        <p>Complete the form below to enroll a new student into the system.</p>

        <form action="addStudent" method="post" class="student-form">
            <div class="form-group">
                <label for="rollNumber">Roll Number</label>
                <input type="text" id="rollNumber" name="rollNumber" class="form-input" required>
            </div>

            <div class="form-group">
                <label for="name">Student Name</label>
                <input type="text" id="name" name="name" class="form-input" required>
            </div>

            <div class="form-group">
                <label for="studentClass">Class</label>
                <input type="text" id="studentClass" name="studentClass" class="form-input" required>
            </div>

            <button type="submit" class="btn" style="margin-top: 20px;">
                <i class="fa-solid fa-plus-circle"></i>
                Add Student Record
            </button>
        </form>
         <br>
        <a href="index.jsp" class="btn-secondary">
            <i class="fa-solid fa-times"></i>
            Cancel and Return
        </a>
    </div>
</body>
</html>