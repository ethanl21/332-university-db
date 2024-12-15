<?php
// Get the variables from the form's input(s)
$cwid = (int)$_GET["student-cwid"];

// query the db
$mysqli = new mysqli("mariadb", "root", "O3YMMVEnGpR8kg2Iosq85", "temp_db"); // todo: change for campus server
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
	$start_time = new DateTime($row["BEGIN_TIME"]);
	$end_time = new DateTime($row["END_TIME"]);

	// generate the table rows
	echo "<tr>
			<th scope=\"row\">" . $row["TITLE"] . "</th>
			<td>" . $row["GRADE"] . "</td>
			</tr>";
}

$stmt->close();
$mysqli->close();
