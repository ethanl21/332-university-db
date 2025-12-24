<?php
// Get the variables from the form's input(s)
$cwid = (int)$_GET["student-cwid"];

// query the db
$config = require __DIR__ . '/../config/db.php';
$mysqli = new mysqli(
	$config['host'],
    $config['user'],
    $config['pass'],
    $config['name']);

$stmt = $mysqli->prepare(
	"
SELECT `Student`.`CWID`, `Enrollment`.`COURSE_NO`, `Enrollment`.`GRADE`, `Course`.`TITLE`
FROM `Student` 
	LEFT JOIN `Enrollment` ON `Enrollment`.`CWID` = `Student`.`CWID` 
	LEFT JOIN `Course` ON `Enrollment`.`COURSE_NO` = `Course`.`NUMBER`
WHERE `Student`.`CWID` = ?;
	"
);
$stmt->bind_param("i", $cwid);
$stmt->execute();

$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
	// generate the table rows
	echo "<tr>
			<th scope=\"row\">" . $row["TITLE"] . "</th>
			<td>" . $row["GRADE"] . "</td>
			</tr>";
}

$stmt->close();
$mysqli->close();
