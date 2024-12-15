<?php
// Get the variables from the form's input(s)
$course_no = (int)$_GET["professor-course-no"];
$section_no = (int)$_GET["professor-section-no"];

$mysqli = new mysqli("mariadb", "root", "O3YMMVEnGpR8kg2Iosq85", "temp_db"); // todo: change for campus server
$stmt = $mysqli->prepare(
	"
SELECT `Course`.`NUMBER`, `Section`.`SECTION_NO`, `Enrollment`.`GRADE`, COUNT(*) as `GRADE_COUNT`
FROM `Course` 
	LEFT JOIN `Section` ON `Section`.`COURSE_NO` = `Course`.`NUMBER` 
	LEFT JOIN `Enrollment` ON `Enrollment`.`COURSE_NO` = `Course`.`NUMBER`
WHERE `Course`.`NUMBER` = ? AND `Section`.`SECTION_NO` = ?
GROUP BY `GRADE`;
"
);

$stmt->bind_param("ii", $course_no, $section_no);
$stmt->execute();

$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {

	// generate the table rows
	echo "<tr>
			<td scope=\'row\' >" . $row["GRADE"] . "</td>
			<td>" . $row["GRADE_COUNT"] . "</td>
			</tr>";
}

$stmt->close();
$mysqli->close();
