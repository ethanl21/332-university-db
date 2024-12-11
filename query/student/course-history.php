<?php
// Get the variables from the form's input(s)
$cwid = $_GET["student-cwid"];

// query the db here (TODO)
$grades = [ // debug data
	["CPSC 332", "A+"]
];

// generate the table rows
foreach ($grades as $grade) {
	echo '<tr>';
	foreach ($grade as $cell) {
		echo "<td>$cell</td>"; // Each cell
	}
	echo '</tr>';
}
?>