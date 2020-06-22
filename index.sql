-- Management Development Institute Database Management System

-- create the initial database

CREATE DATABASE mdiProject;

-- use the database 

USE mdiProject;

-- Create  the first table - Depoartment Table

CREATE TABLE department (
    dept_code VARCHAR(5) NOT NULL,
    dept_name VARCHAR(75),
    dept_head VARCHAR(50),
    emp_id VARCHAR(5),
    PRIMARY KEY(dept_code)
);

-- Employee table

CREATE TABLE employee (
    emp_id VARCHAR(5) NOT NULL,
    emp_fname VARCHAR(25),
    emp_init VARCHAR(5),
    emp_lname VARCHAR(25),    
    emp_phone VARCHAR(25),
    emp_email VARCHAR(50),
    emp_address VARCHAR(50),
    emp_dob DATE,
    emp_gender CHAR (1),
    emp_status VARCHAR(10),
    emp_job VARCHAR(10),
    dept_code VARCHAR(5),
    FOREIGN KEY(dept_code) REFERENCES department(dept_code) ON DELETE SET NULL,
    PRIMARY KEY(emp_id)
);

-- ADD FOREIGN KEY emp_id to department TABLE, After creating the employee TABLE

ALTER TABLE department
ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

-- Student Table

CREATE TABLE student (
    stud_id INT NOT NULL,
    stud_fname VARCHAR(25) NOT NULL,
    stud_init VARCHAR(5),
    stud_lname VARCHAR(25) NOT NULL,    
    stud_phone VARCHAR(15) NOT NULL,
    stud_email VARCHAR(50) NOT NULL,
    stud_address VARCHAR(50),
    stud_dob DATE,
    stud_gender CHAR(1),
    stud_major VARCHAR(50) NOT NULL,
    stud_employment VARCHAR(3),
    stud_marriage VARCHAR(10),
    dept_code INT,
    FOREIGN KEY(dept_code) REFERENCES department(dept_code) ON DELETE SET NULL,
    PRIMARY KEY(stud_id)
);

-- Program Table

CREATE TABLE program (
    prog_id VARCHAR(5) NOT NULL,
    prog_name VARCHAR(75),
    prog_duration VARCHAR(15),
    prog_cost DECIMAL(10,0),
    dept_code INT,
    FOREIGN KEY(dept_code) REFERENCES department(dept_code) ON DELETE SET NULL,
    PRIMARY KEY(prog_id)
);

-- Course Table

CREATE TABLE course(
    course_code VARCHAR(5) NOT NULL,
    course_description VARCHAR(75),
    duration TIME,
    department_name VARCHAR(150),
    requirement VARCHAR(15),
    course_credit INT,
    prog_id VARCHAR(5) ,
    FOREIGN KEY(prog_id) REFERENCES program(prog_id) ON DELETE SET NULL,
    PRIMARY KEY(course_code)
);

--  Class Table

CREATE TABLE class(
    class_code VARCHAR(5) NOT NULL,
    class_start_time TIME,
    class_stop_time TIME,
    lec_id VARCHAR(5),
    semester_code VARCHAR(5),
    room_id VARCHAR(5),
    course_code VARCHAR(5),
    FOREIGN KEY(lec_id) REFERENCES employee(emp_id) ON DELETE SET NULL,
    FOREIGN KEY(course_code) REFERENCES course(course_code) ON DELETE SET NULL,
    PRIMARY KEY(class_code)
);

-- Semester Table

CREATE TABLE semester(
    semester_code VARCHAR(15) NOT NULL,    
    semester_start_date DATE,
    semester_end_date DATE,
    PRIMARY KEY(semester_code)
);

-- ADD FOREIGN KEY semester_code to class TABLE

ALTER TABLE class
ADD FOREIGN KEY(semester_code) REFERENCES semester(semester_code) ON DELETE SET NULL;

-- Room Table

CREATE TABLE room(
    room_id VARCHAR(5) NOT NULL,
    room_type VARCHAR(15),
    building_id VARCHAR(25),
    PRIMARY KEY(room_id)
);

-- ADD FOREIGN KEY room_id to class TABLE
ALTER TABLE class
ADD FOREIGN KEY(room_id) REFERENCES room(room_id) ON DELETE SET NULL;

-- Building Table

CREATE TABLE building(
    building_id VARCHAR(25) NOT NULL,
    building_name VARCHAR(75),
    PRIMARY KEY(building_id)
);

-- ADD FOREIGN KEY building_id to room TABLE

ALTER TABLE room 
ADD FOREIGN KEY(building_id) REFERENCES building(building_id) ON DELETE SET NULL;

-- Enrollment Table consist of composite PRIMARY KEYS

CREATE TABLE enrollment(
    class_code VARCHAR(5) NOT NULL,
    stud_id INT NOT NULL,
    FOREIGN KEY(class_code) REFERENCES class(class_code),
    FOREIGN KEY(stud_id) REFERENCES student(stud_id),
    PRIMARY KEY(class_code, stud_id)
);

-- INSERT INTO TABLES

INSERT INTO department 
VALUES (
    'ICT',
    'Imformation Com. Technology',
    'Malang M Jarju',
    NULL
);

INSERT INTO department
VALUES(
    'BNKFI',
    'Banking & Finance',
    'Bubcarr Jallow',
    NULL
);

INSERT INTO department
VALUES(
    'FMA',
    'Finance Mgt. & Accounting',
    'Fatima Jobe',
    NULL
);

INSERT INTO department
VALUES(
    'GND',
    'Gender & Development',
    'Fatou Kinteh',
    NULL
);

INSERT INTO department
VALUES(
    'BSS',
    'Business Studies',
    'Lamin Jammeh',
    NULL
);

INSERT INTO department
VALUES(
    'DIR',
    'Diplomacy & INTL. Relations',
    'Muhammed Cham',
    NULL
);

INSERT INTO department
VALUES(
    'MPA',
    'Management & Policy Analysis',
    'Jainaba Saidy',
    NULL
);

-- employee 

INSERT INTO employee
VALUES(
    'MMJ',
    'Mgngeh',
     'M',
    'Joof',   
    '3506701',
    'mjoof@mdi.edu.gm',
    'Kanifing',
    '1986-09-17',
    'F',
    'Single',
    'full-time',
    'ICT'
);

INSERT INTO employee
VALUES(
    'YKC',
    'Yankuba',
    '',
    'Camara',    
    '3506701',
    'ycamara@mdi.edu.gm',
    'Brufut',
    '1976-04-10',
    'M',
    'Married',
    'full-time',
    'MPA'
);

INSERT INTO employee
VALUES(
    'EBJ',
    'Ebou',
    '',
    'Badjie',    
    '9930876',
    'ebadjie@mdi.edu.gm',
    'Serekunda',
    '1982-11-20',
    'M',
    'Married',
    'full-time',
    'ICT'
);

INSERT INTO employee
VALUES(
    'MMB',
    'Matt',
    '',
    'Mbye',    
    '9930876',
    'mmybe@mdi.edu.gm',
    'Bijilo',
    '1970-12-10',
    'M',
    'Married',
    'full-time',
    'GND'
);

INSERT INTO employee
VALUES(
    'MLJ',
    'Malang',
    'M',
    'Jarju',    
    '3830523',
    'mjarju@mdi.edu.gm',
    'Costal Road',
    '1980-02-19',
    'M',
    'Married',
    'full-time',
    'ICT'
);

INSERT INTO employee
VALUES(
    'BBJ',
    'Bubacarr',
    '',
    'Jallow',    
    '7659088',
    'bjallow@mdi.edu.gm',
    'Brikama',
    '1964-05-09',
    'M',
    'Married',
    'full-time',
    'BNKFI'
);

INSERT INTO employee
VALUES(
    'FTJ',
    'Fatima',
    '',
    'Jobe',    
    '6549086',
    'fjobe@mdi.edu.gm',
    'Serekunda',
    '1976-09-07',
    'F',
    'Married',
    'full-time',
    'FMA'
);

INSERT INTO employee
VALUES(
    'JSY',
    'Jainaba',
    '',
    'Saidy',    
    '5670094',
    'jsaidy@mdi.edu.gm',
    'Bakua',
    '1986-02-22',
    'F',
    'Married',
    'full-time',
    'MPA'
);

INSERT INTO employee
VALUES(
    'LJM',
    'Lamin',
    '',
    'Jammeh',    
    '2344800',
    'ljammeh@mdi.edu.gm',
    'Sukuta',
    '1982-09-28',
    'M',
    'Single',
    'full-time',
    'BSS'
);

INSERT INTO employee
VALUES(
   'MHC',
    'Muhammed',
    '',
    'Cham',    
    '2344800',
    'mcham@mdi.edu.gm',
    'Banjul',
    '1972-04-29',
    'M',
    'Married',
    'full-time',
    'DIR'
);

INSERT INTO employee
VALUES(
    'FTK',
    'Fatou',
    '',
    'Kinteh',    
    '9007865',
    'fkinteh@mdi.edu.gm',
    'Pipeline',
    '1970-06-30',
    'F',
    'Married',
    'full-time',
    'GND'
);

INSERT INTO employee
VALUES(
    'ADC',
    'Adb Ala ',
    '',
    'Camara',    
    '2277552',
    'yiramang@gmail.com',
    'Burusibi',
    '1986-06-30',
    'M',
    'Married',
    'part-time',
    'ICT'
);

INSERT INTO employee
VALUES(
    'LOT',
    'Lamin',
    'O',
    'Touray',    
    '2277552',
    '2raymoori@gmail.com',
    'Lamin Village',
    '1983-02-22',
    'M',
    'Married',
    'part-time',
    'ICT'
);

INSERT INTO employee
VALUES(
    'LGM',
    'Lang',
    '',
    'Loum',
    '9100005',
    'lloum@utg.edu.gm',
    'Serekunda',
    '1973-09-29',
    'M',
    'Married',
    'part-time',
    'ICT'
);

INSERT INTO employee
VALUES(
    'ALB',
    'Alan',
    '',
    'Abass',
    '3113217',
    'alan@mdi.edu.gm',
    'Bakuteh',
    '1970-03-20',
    'M',
    'Married',
    'full-time',
    'ICT'
);


-- Add forriegn keys to the department table


UPDATE mdiproject.department 
SET emp_id = 'MLJ'
WHERE dept_code = 'ICT';

UPDATE mdiproject.department 
SET emp_id = 'BBJ'
WHERE dept_code = 'BNKFI';

UPDATE mdiproject.department 
SET emp_id = 'LJM'
WHERE dept_code = 'BSS';

UPDATE mdiproject.department 
SET emp_id = 'MHC'
WHERE dept_code = 'DIR';

UPDATE mdiproject.department 
SET emp_id = 'FTJ'
WHERE dept_code = 'FMA';

UPDATE mdiproject.department 
SET emp_id = 'FTK'
WHERE dept_code = "GND";

UPDATE mdiproject.department 
SET emp_id = 'JSY'
WHERE dept_code = 'MPA';


-- program table

INSERT INTO program
VALUES(
    'NDCS',
    'National Diploma Computer Science',
    '2 Years',
    25000,
    'ICT'
);

INSERT INTO program
VALUES(
    'CBS',
    'Cyber Security',
    '6 Months',
    25000,
    'ICT'
);

INSERT INTO program
VALUES(
    'NDGD',
    'National Dilpoma in Gender and Development',
    '2 Years',
    33900,
    'GND'
);

INSERT INTO program
VALUES(
    'PGDPA',
    'Post-Graduate Diploma in Public Administration',
    '1 Year',
    26000,
    'MPA'
);

INSERT INTO program
VALUES(
    'EDWLG',
    'Executive Diploma for Women in Leadership Gender and Comm Dev',
    '3 Months',
    14500,
    'GND'
);

INSERT INTO program
VALUES(
    'MSEPT',
    'Micro and Small Enterprice Promotion Trainig',
    '9 Months',
    14500,
    'FMA'
);

INSERT INTO program
VALUES(
    'NDBF',
    'National Diploma in Banking and Finance',
    '2 Years',
    29000,
    'BNKFI'
);


INSERT INTO program
VALUES(
    'ICMCS',
    'ICM Certificate in Commercial Studies',
    '6 Months',
    6300,
    'BSS'
);

INSERT INTO program
VALUES(
    'NDDI',
    'National Diploma in Diplomacy and International Relations',
    '2 Years',
    40000,
    'DIR'
);

INSERT INTO program
VALUES(
    'CSCNA',
    'Cisco Certificate Network Assiciate',
    '8 Months',
    8200,
    'ICT'
);

-- course table

INSERT INTO course
VALUES(
    'JV1',
    'Java Intro to Programming',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'WEB1',
    'Web Programming 1',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'GND1',
    'Intro to Gender and Development',
    '01:00:00',
    'Gender and Delopment',
    'General',
    45,
    NULL
);

INSERT INTO course
VALUES(
    'BST1',
    'Into to BStats',
    '01:00:00',
    'Management and Policy Analysis',
    'General',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'ENG1',
    'English 1 (Basis Grammar)',
    '01:00:00',
    'Management and Policy Analysis',
    'General',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'MGT1',
    'Intro to Management',
    '01:00:00',
    'Management and Policy Analysis',
    'General',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'NTW1',
    'Networking 1',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'CSC1',
    'Cisco',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'WEB2',
    'Web 102',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'ENG2',
    'English 2 (Academic Writing)',
    '03:00:00',
    'Management and Policy Analysis',
    'General',
    35,
    NULL
);

INSERT INTO course
VALUES(
    'DB1',
    'Database 1',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'PLD',
    'Programming Logic and Design',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

INSERT INTO course
VALUES(
    'IT',
    'Intro ICT',
    '03:00:00',
    'Information Com. Technology',
    'Department',
    50,
    NULL
);

UPDATE mdiproject.course
SET prog_id='MPA' 
WHERE  course_code='ENG2';

UPDATE mdiproject.course
SET prog_id='NDCS' 
WHERE  course_code='NTW1';

UPDATE mdiproject.course
SET prog_id='NDCS' 
WHERE  course_code='NTW1';

UPDATE mdiproject.course
SET prog_id='NDCS' 
WHERE  course_code='DB1';

UPDATE mdiproject.course
SET prog_id='NDCS' 
WHERE  course_code='WEB2';

UPDATE mdiproject.course
SET prog_id='NDCS' 
WHERE  course_code='WEB1';

UPDATE mdiproject.course
SET prog_id='NDCS' 
WHERE  course_code='PLD';

UPDATE mdiproject.course
SET prog_id='NDCS' 
WHERE  course_code='IT';


-- student table

INSERT INTO student
VALUES(
    0536,
    'Ebrima',
    '',
    'Touray',
    '3119658',
    'touraye07@gmail.com',
    'Jambanjelly',
    '1992-03-20',
    'M',
    'Computer Sci',
    'No',
    'No',
    'ICT'
);

INSERT INTO student
VALUES(
    526,
    'Ebrima',
    '',
    'Trawally',
    '3693790',
    'etrawally@gmail.com',
    'Lamin Village',
    '1990-10-10',
    'M',
    'Cisco',
    'Yes',
    'No',
    'ICT'
);

INSERT INTO student
VALUES(
    606,
    'Bakarry',
    '',
    'Manneh',
    '3915447',
    'bmanneh@gmail.com',
    'Jambanjelly',
    '1998-08-20',
    'M',
    'Management Studies',
    'No',
    'No',
    'MPA'
);

INSERT INTO student
VALUES(
    601,
    'Alasana',
    '',
    'Camara',
    '2135451',
    'alasana101@yahoo.com',
    'Bundung',
    '1989-08-20',
    'M',
    'Computr Sci',
    'Yes',
    'Yes',
    'ICT'
);

INSERT INTO student
VALUES(
    409,
    'Lamin',
    '',
    'Gibba',
    '3521529',
    'gibbal339@gmail.com',
    'Abuko',
    '1994-08-24',
    'M',
    'Computr Sci',
    'Yes',
    'Yes',
    'ICT'
);

INSERT INTO student
VALUES(
    509,
    'Essu',
    '',
    'Fonny',
    '2628280',
    'cookfonny@gmail.com',
    'Brikama',
    '1997-08-20',
    'M',
    'Computr Sci',
    'Yes',
    'No',
    'ICT'
);

INSERT INTO student
VALUES(
    551,
    'Fatou',
    '',
    'Jarju',
    '7319053',
    'jarjuf11@gmail.com',
    'Abuko',
    '2000-01-01',
    'F',
    'Banking and Finance',
    'No',
    'No',
    'BNKFI'
);

INSERT INTO student
VALUES(
    808,
    'Jankey',
    '',
    'Jammeh',
    '3451732',
    'jankeyjammeh534@gmail.com',
    'Bakou',
    '1999-12-31',
    'F',
    'Gender and Development',
    'No',
    'No',
    'GND'
);

INSERT INTO student
VALUES(
    809,
    'Aisha',
    '',
    'Drammeh',
    '2052619',
    'drammeha4@gmail.com',
    'Bakou',
    '1999-09-09',
    'F',
    'Business Studies',
    'No',
    'Yes',
    'BSS'
);

-- semester table

INSERT INTO semester
VALUES(   
   'Jan-Jun 2019',   
   '2019-01-14',
   '2019-06-02'
);

INSERT INTO semester
VALUES(   
   'Jul-Dec2019',   
   '2019-06-12',
   '2019-12-20'
);

INSERT INTO semester
VALUES(   
   'Jan-Jun2020',   
   '2020-01-14',
   '2019-06-12'
);

INSERT INTO semester
VALUES(   
   'Jul-Dec2020',   
   '2020-06-24',
   '2019-12-22'
);

-- class table

INSERT INTO class
VALUES(
    'WEB101',
    '10:00:00',
    '13:00:00',
    'ADC',
    'Jul-Dec2019',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'JAVA1',
    '09:30:00',
    '12:30:00',
    'LOT',
    'JAN-JUN2020',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'NET01',
    '10:30:00',
    '13:30:00',
    'ALB',
    'JUL-DEC2019',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'GND01',
    '08:45:00',
    '09:45:00',
    'FTK',
    'JAN-JUN2020',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'ENG01',
    '12:45:00',
    '13:45:00',
    'MMB',
    'JAN-JUL2020',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'BST01',
    '12:45:00',
    '13:45:00',
    '',
    'JAN-JUL2020',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'WED02',
    '10:00:00',
    '13:00:00',
    'ADC',
    'JAN-JUN2020',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'PLD01',
    '14:30:00',
    '17:30:00',
    'LGM',
    'JAN-JUN2020',
    NULL,
    ''
);

INSERT INTO class
VALUES(
    'DB01',
    '10:30:00',
    '13:30:00',
    'ADC',
    'JUL-DEC2019',
    NULL,
    ''
);

-- update class tble, add course code

UPDATE mdiproject.class
SET course_code = 'WEB1'
WHERE class_code = 'WEB01';

UPDATE mdiproject.class
SET course_code = 'JV1'
WHERE class_code = 'JAVA1';

UPDATE mdiproject.class
SET course_code = 'NTW1'
WHERE class_code = 'NTW01';

UPDATE mdiproject.class
SET course_code = 'GN1'
WHERE class_code = 'GND01';

UPDATE mdiproject.class
SET course_code = 'ENG1'
WHERE class_code = 'ENG01';

UPDATE mdiproject.class
SET course_code = 'BST1'
WHERE class_code = 'BST01';

UPDATE mdiproject.class
SET course_code = 'WEB2'
WHERE class_code = 'WEB02';

UPDATE mdiproject.class
SET course_code = 'PLD'
WHERE class_code = 'PLD01';

UPDATE mdiproject.class
SET course_code = 'DB1'
WHERE class_code = 'DB01';

-- update class table , add room idd

UPDATE mdiproject.class
SET room_id = 'ITLB2'
WHERE class_code = 'WEB01';

UPDATE mdiproject.class
SET room_id = 'ITLB'
WHERE class_code = 'JAVA1';

UPDATE mdiproject.class
SET room_id = 'ITLB2'
WHERE class_code = 'NET01';

UPDATE mdiproject.class
SET room_id = 'JK14'
WHERE class_code = 'GND01';

UPDATE mdiproject.class
SET room_id = 'JK14'
WHERE class_code = 'ENG01';

UPDATE mdiproject.class
SET room_id = 'JK14'
WHERE class_code = 'BST01';

UPDATE mdiproject.class
SET room_id = 'ITLB2'
WHERE class_code = 'WEB02';

UPDATE mdiproject.class
SET room_id = 'ITLB'
WHERE class_code = 'PLD01';

UPDATE mdiproject.class
SET room_id = 'ITLB'
WHERE class_code = 'DB01';

-- building table

INSERT INTO building
VALUES(
    'MBKL',
    'Main Block'
);

INSERT INTO building
VALUES(
    'LBKL',
    'Library Block'
);

INSERT INTO building
VALUES(
    'FBKL',
    'Financial Block'
);

INSERT INTO building
VALUES(
    'UTGBLK',
    'UGT Block'
);

-- room table

INSERT INTO room
VALUES(
    'ITLB',
    'Lab',
    'MBKL'
);

INSERT INTO room
VALUES(
    'ITLB2',
    'Lab',
    'MBKL'
);

INSERT INTO room
VALUES(
    'KJ14',
    'Class Room',
    'LBKL'
);

INSERT INTO room
VALUES(
    'KJ10',
    'IT LAB',
    'MBKL'
);

INSERT INTO room
VALUES(
    'MK12',
    'Class Room',
    'FBKL'
);


INSERT INTO room
VALUES(
    'MK15',
    'Class Room',
    'FBKL'
);

INSERT INTO room
VALUES(
    'JM10',
    'Class Room',
    'UGTBKL'
);