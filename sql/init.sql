CREATE TABLE
	`Professor` (
		`SSN` INT NOT NULL,
		`F_NAME` VARCHAR(35) NOT NULL,
		`L_NAME` VARCHAR(35) NOT NULL,
		`STREET_ADDRESS` TEXT NOT NULL,
		`CITY` TEXT NOT NULL,
		`STATE` VARCHAR(25) NOT NULL,
		`ZIP` INT NOT NULL,
		`AREA_CODE` INT NOT NULL,
		`TELEPHONE` INT NOT NULL,
		`SEX` ENUM ('MALE', 'FEMALE', 'OTHER') NOT NULL,
		`TITLE` TEXT NOT NULL,
		`SALARY` INT NOT NULL,
		PRIMARY KEY (`SSN`)
	);

INSERT INTO
	`Professor`
VALUES
	(
		'123456789',
		'Sample',
		'Professor',
		'123 Placeholder Street',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'999',
		'0001111',
		'MALE',
		'Dean of Placeholder Studies',
		'123456'
	),
	(
		'222222222',
		'Sample',
		'Professor 2',
		'123 Placeholder Street',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'999',
		'2222222',
		'FEMALE',
		'Professor of Computer Science',
		'222222'
	),
	(
		'999999999',
		'Tuffy',
		'Titan',
		'800 N State College Blvd',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'657',
		'2782011',
		'MALE',
		'Computer Science Professor',
		'999999'
	);

CREATE TABLE
	`Department` (
		`NUMBER` INT NOT NULL,
		`NAME` TEXT NOT NULL,
		`AREA_CODE` INT NOT NULL,
		`TELEPHONE` INT NOT NULL,
		`OFFICE_LOCATION` TEXT NOT NULL,
		`CHAIR_SSN` INT NOT NULL,
		PRIMARY KEY (`NUMBER`),
		FOREIGN KEY (`CHAIR_SSN`) REFERENCES `Professor` (`SSN`)
	);

INSERT INTO
	`Department`
VALUES
	(
		'0',
		'Placeholder Studies',
		'987',
		'1112222',
		'PLC 123',
		'123456789'
	),
	(
		'1',
		'Computer Science',
		'657',
		'2782011',
		'CS 123',
		'999999999'
	);

CREATE TABLE
	`Student` (
		`CWID` INT NOT NULL,
		`F_NAME` VARCHAR(35) NOT NULL,
		`L_NAME` VARCHAR(35) NOT NULL,
		`STREET_ADDRESS` TEXT NOT NULL,
		`CITY` TEXT NOT NULL,
		`STATE` VARCHAR(25) NOT NULL,
		`ZIP` INT NOT NULL,
		`MAJOR_DEPT_NO` INT NOT NULL,
		PRIMARY KEY (`CWID`),
		FOREIGN KEY (`MAJOR_DEPT_NO`) REFERENCES `Department` (`NUMBER`)
	);

INSERT INTO
	`Student`
VALUES
	(
		'111111111',
		'Student',
		'1',
		'111 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	),
	(
		'222222222',
		'Student',
		'2',
		'222 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	),
	(
		'333333333',
		'Student',
		'3',
		'333 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	),
	(
		'444444444',
		'Student',
		'4',
		'444 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	),
	(
		'555555555',
		'Student',
		'5',
		'555 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	),
	(
		'666666666',
		'Student',
		'6',
		'666 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	),
	(
		'777777777',
		'Student',
		'7',
		'777 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	),
	(
		'888888888',
		'Student',
		'8',
		'888 Sample Dr',
		'Fullerton',
		'CALIFORNIA',
		'92831',
		'1'
	);

CREATE TABLE
	`Course` (
		`NUMBER` INT NOT NULL,
		`TITLE` TEXT NOT NULL,
		`UNITS` INT NOT NULL,
		`TEXTBOOK` TEXT NOT NULL,
		`DEPT_NO` INT NOT NULL,
		PRIMARY KEY (`NUMBER`),
		FOREIGN KEY (`DEPT_NO`) REFERENCES `Department` (`NUMBER`)
	);

INSERT INTO
	`Course`
VALUES
	(
		'0',
		'Intro to Computer Science',
		'3',
		'An introduction to computer science ',
		'1'
	),
	(
		'1',
		'Data Structures',
		'3',
		'Data and Structures',
		'1'
	),
	(
		'2',
		'Intro to Placeholder Studies',
		'3',
		'Placeholder practice vol x.',
		'0'
	),
	(
		'3',
		'History of Placeholder Studies',
		'3',
		'Brief lesson in PLC',
		'0'
	),
	(
		'4',
		'Beginner Placeholder Practice Lab',
		'1',
		'N/A',
		'0'
	);
CREATE TABLE
	`Prerequisite` (
		`COURSE_NO` INT NOT NULL,
		`PREREQ_NO` INT NOT NULL,
		PRIMARY KEY (`COURSE_NO`, `PREREQ_NO`),
		FOREIGN KEY (`COURSE_NO`) REFERENCES Course (`NUMBER`),
		FOREIGN KEY (`PREREQ_NO`) REFERENCES Course (`NUMBER`)
	);

INSERT INTO
	`Prerequisite`
VALUES
	('1', '0'),
	('111111111', '3', '1', 'B');


CREATE TABLE
	`Section` (
		`COURSE_NO` INT NOT NULL,
		`SECTION_NO` INT NOT NULL,
		`CLASSROOM` VARCHAR(10) NOT NULL,
		`SEATS` INT NOT NULL,
		`BEGIN_TIME` TIME NOT NULL,
		`END_TIME` TIME NOT NULL,
		`PROFESSOR_SSN` INT NOT NULL,
		`DAYS` TEXT NOT NULL,
		PRIMARY KEY (`COURSE_NO`, `SECTION_NO`),
		FOREIGN KEY (`PROFESSOR_SSN`) REFERENCES `Professor` (`SSN`),
		FOREIGN KEY (`COURSE_NO`) REFERENCES `Course` (`NUMBER`)
	);

ALTER TABLE `Section` ADD INDEX (`SECTION_NO`);

INSERT INTO
	`Section`
VALUES
	(
		'1',
		'1',
		'CS 111',
		'43',
		'13:30:00',
		'14:45:00',
		'999999999',
		'M/W'
	),
	(
		'1',
		'2',
		'CS 222',
		'21',
		'13:30:00',
		'14:45:00',
		'222222222',
		'T/Th'
	),
	(
		'0',
		'1',
		'CS 100',
		'53',
		'11:30:00',
		'12:45:00',
		'222222222',
		'M/W'
	),
	(
		'0',
		'2',
		'CS 100',
		'53',
		'13:30:00',
		'14:45:00',
		'222222222',
		'T/Th'
	),
	(
		'3',
		'1',
		'PLC 1',
		'32',
		'10:00:00',
		'11:30:00',
		'123456789',
		'M/W'
	),
	(
		'3',
		'2',
		'PLC 1',
		'32',
		'12:30:00',
		'13:45:00',
		'123456789',
		'T/TH'
	),
	(
		'4',
		'1',
		'PLC 200',
		'21',
		'10:00:00',
		'11:30:00',
		'123456789',
		'M/W'
	);

CREATE TABLE
	`Minor` (
		`CWID` INT NOT NULL,
		`DEPT_NO` INT NOT NULL,
		PRIMARY KEY (`CWID`, `DEPT_NO`),
		FOREIGN KEY (`CWID`) REFERENCES `Student` (`CWID`),
		FOREIGN KEY (`DEPT_NO`) REFERENCES `Department` (`NUMBER`)
	);

INSERT INTO
	`Minor`
VALUES
	('123123123', '0');

CREATE TABLE
	`Enrollment` (
		`CWID` INT NOT NULL,
		`COURSE_NO` INT NOT NULL,
		`SECTION_NO` INT NOT NULL,
		`GRADE` VARCHAR(2) NOT NULL,
		PRIMARY KEY (`CWID`, `COURSE_NO`, `SECTION_NO`),
		FOREIGN KEY (`CWID`) REFERENCES `Student` (`CWID`),
		FOREIGN KEY (`COURSE_NO`) REFERENCES `Course` (`NUMBER`),
		FOREIGN KEY (`SECTION_NO`) REFERENCES `Section` (`SECTION_NO`)
	);

INSERT INTO
	`Enrollment` (`CWID`, `COURSE_NO`, `SECTION_NO`, `GRADE`)
VALUES
	('111111111', '1', '1', 'B'),
	('111111111', '3', '1', 'A'),
	('222222222', '2', '1', 'C'),
	('222222222', '1', '1', 'B'),
	('222222222', '4', '1', 'B+'),
	('333333333', '1', '2', 'A+'),
	('333333333', '4', '1', 'B-'),
	('333333333', '0', '2', 'B'),
	('444444444', '0', '2', 'C+'),
	('444444444', '4', '1', 'A+'),
	('444444444', '3', '2', 'B-'),
	('555555555', '1', '2', 'B-'),
	('555555555', '4', '1', 'D+'),
	('666666666', '2', '2', 'C-'),
	('666666666', '1', '2', 'C'),
	('777777777', '4', '1', 'A'),
	('777777777', '2', '2', 'A+'),
	('888888888', '1', '2', 'F'),
	('888888888', '3', '2', 'C-'),
	('888888888', '4', '1', 'A+');

CREATE TABLE
	`Degree` (
		`PROFESSOR_SSN` INT NOT NULL,
		`DEGREE` VARCHAR(50) NOT NULL,
		PRIMARY KEY (`PROFESSOR_SSN`, `DEGREE`),
		FOREIGN KEY (`PROFESSOR_SSN`) REFERENCES `Professor` (`SSN`)
	);

INSERT INTO
	`Degree`
VALUES
	('999999999', 'B.S. Computer Science'),
	('222222222', 'B.A. Placeholder Studies');