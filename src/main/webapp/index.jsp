<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management Portal</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <h1>Student Management <span class="highlight">Portal</span></h1>
        <p>A high-performance interface for student data management. View the directory or add new student records instantly.</p>
        
        <div class="action-buttons">
           
            <form action="viewStudents" method="get">
                <button type="submit" class="btn">
                    <i class="fa-solid fa-users"></i>
                    View All Students
                </button>
            </form>

           
            <form action="addStudent.jsp" method="get">
                <button type="submit" class="btn">
                    <i class="fa-solid fa-user-plus"></i>
                    Add New Student
                </button>
            </form>
        </div>
    </div>
</body>
</html>