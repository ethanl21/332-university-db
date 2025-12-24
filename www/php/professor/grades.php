<?php
// Get the variables from the form's input(s)
$course_no = (int)$_GET["professor-course-no"];
$section_no = (int)$_GET["professor-section-no"];

// query the db
$config = require __DIR__ . '/../config/db.php';
$mysqli = new mysqli(
	$config['host'],
    $config['user'],
    $config['pass'],
    $config['name']);

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
			<th scope=\'row\' >" . $row["GRADE"] . "</th>
			<td>" . $row["GRADE_COUNT"] . "</td>
		</tr>";
}

$stmt->close();
$mysqli->close();
