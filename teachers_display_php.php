<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
?>

<?php
// Database connection settings
$servername = "localhost";
$username = "root"; // Replace with your MySQL username
$password = "root"; // Replace with your MySQL password
$dbname = "teachers_database"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle filtering
$filter = "";
if (isset($_GET['position']) && !empty($_GET['position'])) {
    $position = $conn->real_escape_string($_GET['position']);
    $filter = "WHERE Position = '$position'";
}

// Fetch teachers
$sql = "SELECT * FROM Teachers $filter ORDER BY LastName ASC";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Teacher List</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Teacher List</h1>

    <!-- Filter Form -->
    <form method="get" action="">
        <label for="position">Filter by Position:</label>
        <select name="position" id="position">
            <option value="">-- All Positions --</option>
            <option value="Teacher" <?php echo (isset($_GET['position']) && $_GET['position'] == 'Teacher') ? 'selected' : ''; ?>>Teacher</option>
            <option value="Director" <?php echo (isset($_GET['position']) && $_GET['position'] == 'Director') ? 'selected' : ''; ?>>Director</option>
            <option value="Deputy" <?php echo (isset($_GET['position']) && $_GET['position'] == 'Deputy') ? 'selected' : ''; ?>>Deputy</option>
        </select>
        <button type="submit">Apply Filter</button>
    </form>

    <!-- Teacher Table -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Last Name</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Date of Birth</th>
                <th>Position</th>
                <th>Subject</th>
                <th>Phone</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($row['TeacherID']); ?></td>
                        <td><?php echo htmlspecialchars($row['LastName']); ?></td>
                        <td><?php echo htmlspecialchars($row['FirstName']); ?></td>
                        <td><?php echo isset($row['MiddleName']) ? htmlspecialchars($row['MiddleName']) : ''; ?></td>
                        <td><?php echo htmlspecialchars($row['DateOfBirth']); ?></td>
                        <td><?php echo htmlspecialchars($row['Position']); ?></td>
                        <td><?php echo htmlspecialchars($row['Subject']); ?></td>
                        <td><?php echo htmlspecialchars($row['Phone']); ?></td>
                        <td><?php echo htmlspecialchars($row['Salary']); ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="9">No records found</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <nav>
        <a href="teachers_form_php.php">Add New Teacher</a>
    </nav>
</body>
</html>

<?php
// Close the connection
$conn->close();
?>
