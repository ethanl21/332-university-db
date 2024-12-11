<?php
// Get the variables from the form's input(s)
$course_no = $_GET["professor-course-no"];
$section_no = $_GET["professor-section-no"];

// query the db here (TODO)
$grades = [ // debug data
	["A+", 1],
	["A", 2],
	["A-", 3]
];

// generate the table rows
$total_grades = 0;
foreach ($grades as $grade) {
	echo '<tr>';

	// Grade letter label
	echo '<th scope="row">';
	echo $grade[0];
	echo '</th>';

	// Grade count
	echo '<td>';
	echo $grade[1];
	echo '</td>';

	echo '</tr>';
}
