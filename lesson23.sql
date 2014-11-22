/*
 * Restaurant database initialisation file - Created by Stretch Projects 
 * Used in Learn SQL Youtube series: 
 * Feel free to do whatever you like with this file - there are no restrictions!
 * For use with MySQL 5.6.21 onwards (compatibility with previous versions is untested)
 */

/*
 * Ensure that there are no exising instances of this database and initialise a clean version
 */ 

DROP DATABASE IF EXISTS `restaurant`;
CREATE DATABASE  IF NOT EXISTS `restaurant`;
USE `restaurant`;

/*
 * Create table structure for table `department`
 */

CREATE TABLE `department` (
  `department_number` int(2),
  `department_name` varchar(14) NOT NULL,
  `department_location` varchar(13),
  PRIMARY KEY (`department_number`),
  UNIQUE KEY `department_number_UNIQUE` (`department_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
 * Dumping data for table `department`
 */

INSERT INTO `department` VALUES 
  (10,'Corporate','London'),
  (20,'Kitchen','London'),
  (30,'Service','London'),
  (40,'Cleaning','Manchester');

/*
 * Table structure for table `staff`
 */

CREATE TABLE `staff` (
  `staff_number` int(4),
  `staff_surname` varchar(10) NOT NULL,
  `staff_job_title` varchar(9) NOT NULL,
  `manager_number` int(4),
  `hire_date` date,
  `salary` numeric(7,2) NOT NULL,
  `commission` numeric(7,2),
  `department_number` int(2),
  PRIMARY KEY (`staff_number`),
  CONSTRAINT `staff_department_fk` FOREIGN KEY (`department_number`) REFERENCES department (`department_number`),
  UNIQUE KEY `staff_number_UNIQUE` (`staff_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
 * Dumping data for table `staff`
 *
 * Management structure is as follows:-
 *  level staff_surname    staff_job_title
 *  =========================================
 *
 *  1     Jones            President
 *  2       King           Head Chef
 *  3         Adams        Chef
 *  4           Scott      Cook
 *  3        Smith         Chef
 *  4          Ford        Cook
 *  2       Allen          Manager
 *  3         Blake        Greeter
 *  3         Martin       Server
 *  3         Ward         Server
 *  3         James        Server
 *  3         Turner       Server
 *  2       Miller         HR
 *  3         Clark        Messenger
 */

INSERT INTO `staff` VALUES 
  (6839,'Jones','President',NULL,'1980-11-17',5000,NULL,10),
  (6566,'King','Head Chef',6839,'1991-04-02',2975,NULL,20),
  (6788,'Adams','Chef',6566,DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 85 DAY), '%Y-%m-%d'),3000,NULL,20),
  (6876,'Scott','Cook',6788,DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 51 DAY), '%Y-%m-%d'),1100,NULL,20),
  (6902,'Smith','Chef',6566,'1991-12-03',3000,NULL,20),
  (6369,'Ford','Cook',6902,'1990-12-17',800,NULL,10),
  (6698,'Allen','Manager',6839,'1981-05-01',2850,NULL,30),
  (6499,'Blake','Greeter',6698,'1995-02-20',1600,300,30),
  (6521,'Martin','Server',6698,'1994-02-22',1250,500,30),
  (6654,'Ward','Server',6698,'1993-09-28',1250,1400,30),
  (6844,'James','Server',6698,'1981-09-08',1500,0,30),
  (6900,'Turner','Server',6698,'1981-12-03',950,NULL,30),
  (6782,'Miller','HR',6839,'1989-06-09',2450,NULL,10),
  (6934,'Clark','Messenger',6782,'1985-01-23',1300,NULL,10),
  (6945, 'King', 'Cleaner',6698,'1999-04-07',1000, NULL, 30);

/*
 * Table structure for table `salary_range`
 */

CREATE TABLE `salary_range` (
  `grade` int(11),
  `low_salary` int(11) NOT NULL,
  `high_salary` int(11) NOT NULL,
  PRIMARY KEY (`grade`),
  UNIQUE KEY `Grade_UNIQUE` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
 * Dumping data for table `salary_range`
 */

INSERT INTO `salary_range` VALUES 
  (1,700,1200),
  (2,1201,1400),
  (3,1401,2000),
  (4,2001,3000),
  (5,3001,9999);

/*
 * Table structure for table `customer`
 */

CREATE TABLE `customer` (
  `customer_number` int(4),
  `order_date` date,
  `customer_name` varchar(15),
  `city` varchar(15),
  `country` varchar(15),
  `menu_item_number` int(4),
  `menu_item_name` varchar(20),
  `order_quantity` int(4)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
 * Dumping data for table `customer`
 */

INSERT INTO `customer` VALUES 
  (0001,'1997-01-01','J Bond','Stockport','England',1,'Steak',2),
  (0001,'1997-06-11','J Bond','Stockport','England',2,'Burger',3),
  (0001,'1998-04-21','J Bond','Stockport','England',1,'Steak',4),
  (0001,'1998-08-15','J Bond','Stockport','England',3,'Bacon sandwich',4),
  (0002,'1996-04-22','B Turpin','Manchester','England',2,'Burger',1),
  (0002,'1997-06-11','B Turpin','Manchester','England',1,'Steak',1),
  (0003,'1996-02-06','I Perry','London','England',5,'Full breakfast',2),
  (0003,'1997-11-17','I Parry','London','England',3,'Bacon sandwich',2),
  (0004,'1997-07-14','P Fowler','Birmingham','England',6,'Toast',1),
  (0004,'1999-05-30','P Fowler','Birmingham','England',7,'Chicken',2),
  (0004,'2000-08-28','P Fowler','Birmingham','England',11,'Potato',6);

/*
 * Table structure for table `training`
 */

create table training (
  course_id int unique auto_increment primary key comment 'This is the course ID number',
  course_name varchar(100) not null
);

/*
 * Table structure for table `staff_training`
 */

create table staff_training (
  staff_number int,
  course_id int,
  date_taken date
);


/*
 * Create view `stafftable`
 */

create view stafftable as 
    select staff_number, staff_surname, staff_job_title, hire_date, department_number 
    from staff 
    where manager_number = 6839;