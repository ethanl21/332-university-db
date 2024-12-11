<?php
// Get the variables from the form's input(s)
$course_no = $_GET["student-course-no"];

// query the db here (TODO)
$sections = [ // debug data
	[1, "CS 332", "MW 1:00-2:15PM", 99]
];

// generate the table rows
foreach ($sections as $section) {
	echo '<tr>';
	foreach ($section as $cell) {
		echo "<td>$cell</td>"; // Each cell
	}
	echo '</tr>';
}
?>
