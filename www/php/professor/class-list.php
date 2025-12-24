<?php
// Get the variables from the form's input(s)
$ssn = $_GET["professor-ssn"];

// query the db
$config = require __DIR__ . '/../config/db.php';
$mysqli = new mysqli(
	$config['host'],
    $config['user'],
    $config['pass'],
    $config['name']);

$stmt = $mysqli->prepare(
	"
	SELECT `Professor`.`SSN`, `Section`.`CLASSROOM`, `Course`.`TITLE`, `Section`.`DAYS`, `Section`.`BEGIN_TIME`, `Section`.`END_TIME`
	FROM `Professor` 
		LEFT JOIN `Section` ON `Section`.`PROFESSOR_SSN` = `Professor`.`SSN` 
		LEFT JOIN `Course` ON `Section`.`COURSE_NO` = `Course`.`NUMBER`
	WHERE `Professor`.`SSN` = ?;
	"
);
$stmt->bind_param("s", $ssn);
$stmt->execute();

$result = $stmt->get_result();


while ($row = $result->fetch_assoc()) {
	$start_time = new DateTime($row["BEGIN_TIME"]);
	$end_time = new DateTime($row["END_TIME"]);

	// generate the table rows
	echo "<tr>
			<td>" . $row["TITLE"] . "</td>
			<td>" . $row["CLASSROOM"] . "</td>
			<td>" . $row["DAYS"] . " " .  $start_time->format("h:i") . "-" . $end_time->format("h:i A") . "</td>
			</tr>";
}

$stmt->close();
$mysqli->close();
