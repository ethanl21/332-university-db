<?php
// Get the variables from the form's input(s)
$ssn = $_GET["professor-ssn"];

// query the db here (TODO)
$sections = [ // debug data
	["CPSC 332", "CS 110A", "MW 1:00-2:15PM"]
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