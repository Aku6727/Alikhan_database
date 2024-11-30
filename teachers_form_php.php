<!DOCTYPE html>
<html>
<head>
    <title>Teacher Form</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Add New Teacher</h1>
    <form method="post" action="process_teacher.php">
        <label for="LastName">Last Name:</label>
        <input type="text" name="LastName" id="LastName" required><br><br>
        
        <label for="FirstName">First Name:</label>
        <input type="text" name="FirstName" id="FirstName" required><br><br>
        
        <label for="MiddleName">Middle Name:</label>
        <input type="text" name="MiddleName" id="MiddleName"><br><br>
        
        <label for="DateOfBirth">Date of Birth:</label>
        <input type="date" name="DateOfBirth" id="DateOfBirth" required><br><br>
        
        <label for="Position">Position:</label>
        <select name="Position" id="Position">
            <option value="Teacher">Teacher</option>
            <option value="Director">Director</option>
            <option value="Deputy">Deputy</option>
        </select><br><br>
        
        <label for="Subject">Subject:</label>
        <input type="text" name="Subject" id="Subject"><br><br>
        
        <label for="Phone">Phone:</label>
        <input type="text" name="Phone" id="Phone" maxlength="9"><br><br>
        
        <label for="Salary">Salary:</label>
        <input type="number" step="0.01" name="Salary" id="Salary"><br><br>
        
        <button type="submit">Submit</button>
    </form>

    <nav>
        <a href="teachers_display_php.php">View Teachers</a>
    </nav>
</body>
</html>
