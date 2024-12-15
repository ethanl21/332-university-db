<?php
// Get the variables from the form's input(s)
$course_no = (int)$_GET["student-course-no"];

// query the db
$mysqli = new mysqli("mariadb", "root", "O3YMMVEnGpR8kg2Iosq85", "temp_db"); // todo: change for campus server
$stmt = $mysqli->prepare(
	"
SELECT `Course`.`NUMBER`, `Section`.`SECTION_NO`, `Section`.`CLASSROOM`, `Section`.`DAYS`, `Section`.`BEGIN_TIME`, `Section`.`END_TIME`, `Enrollment`.`CWID`, COUNT(*) as `ENROLLED`
FROM `Course` 
	LEFT JOIN `Section` ON `Section`.`COURSE_NO` = `Course`.`NUMBER` 
	LEFT JOIN `Enrollment` ON `Enrollment`.`COURSE_NO` = `Course`.`NUMBER`
WHERE `Course`.`NUMBER` = ?
GROUP BY `NUMBER`, `SECTION_NO`;
	"
);
$stmt->bind_param("i", $course_no);
$stmt->execute();

$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
	$start_time = new DateTime($row["BEGIN_TIME"]);
	$end_time = new DateTime($row["END_TIME"]);

	// generate the table rows
	echo "<tr>
			<td>" . $row["SECTION_NO"] . "</td>
			<td>" . $row["CLASSROOM"] . "</td>
			<td>" . $row["DAYS"] . " " .  $start_time->format("h:i") . "-" . $end_time->format("h:i A") . "</td>
			<td>" . $row["ENROLLED"] . "</td>
			</tr>";
}

$stmt->close();
$mysqli->close();
