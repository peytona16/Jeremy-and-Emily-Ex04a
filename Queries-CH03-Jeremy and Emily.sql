USE wp;


CREATE  TABLE DEPARTMENT(
	DepartmentName		Char(35)		NOT NULL,
	BudgetCode			Char(30)		NOT NULL,
	OfficeNumber		Char(15)		NOT NULL,
	DepartmentPhone		Char(12)		NOT NULL,
	CONSTRAINT 			DEPARTMENT_PK 	PRIMARY KEY(DepartmentName)
	);

CREATE  TABLE EMPLOYEE(
	EmployeeNumber		Int 			NOT NULL auto_increment,
	FirstName			Char(25) 		NOT NULL,
	LastName			Char(25) 		NOT NULL,
	Department			Char(35)		NOT NULL DEFAULT 'Human Resources',
	Position			Char(35)		NULL,
	Supervisor			Int				NULL,
	OfficePhone			Char(12)		NULL,
	EmailAddress		VarChar(100)	NOT NULL UNIQUE,
	CONSTRAINT 			EMPLOYEE_PK 	PRIMARY KEY(EmployeeNumber),
	CONSTRAINT 			EMP_DEPART_FK	FOREIGN KEY(Department)
							REFERENCES DEPARTMENT(DepartmentName)
							ON UPDATE CASCADE,
	CONSTRAINT			EMP_SUPER_FK	FOREIGN KEY (Supervisor)
							REFERENCES EMPLOYEE (EmployeeNumber)						
	);

/* mysql does not support incrementing by other than 1, but does allow 
user to specify a starting point by using an alter table statement as shown below 
thus we cannot support identity(1000,100) like mssql
we will have to insert values 1000, 1100, 1200 etc manually  */
CREATE  TABLE PROJECT (
	ProjectID			Int				NOT NULL auto_increment,
	ProjectName			Char(50) 		NOT NULL,
	Department			Char(35)		NOT NULL,
	MaxHours			Numeric(8,2)	NOT NULL DEFAULT 100,
    StartDate			Date			NULL,
    EndDate				Date			NULL,
    CONSTRAINT 			PROJECT_PK 		PRIMARY KEY (ProjectID),
	CONSTRAINT 			PROJ_DEPART_FK	FOREIGN KEY(Department)
							REFERENCES DEPARTMENT(DepartmentName)
								ON UPDATE CASCADE
    	);
ALTER table PROJECT auto_increment = 1000;

CREATE  TABLE ASSIGNMENT (
   	ProjectID			Int	 			NOT NULL,
	EmployeeNumber		Int	 			NOT NULL,
    HoursWorked			Numeric(6,2)	NULL,
   	CONSTRAINT 			ASSIGNMENT_PK 	PRIMARY KEY (ProjectID, EmployeeNumber),
   	CONSTRAINT 			ASSIGN_PROJ_FK  FOREIGN KEY (ProjectID)
							REFERENCES PROJECT (ProjectID)
								ON UPDATE NO ACTION
								ON DELETE CASCADE,
    CONSTRAINT 			ASSIGN_EMP_FK   FOREIGN KEY (EmployeeNumber)
							REFERENCES EMPLOYEE (EmployeeNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
 	);
  
  INSERT INTO DEPARTMENT VALUES('Administration', 'BC-100-10', 'BLDG01-210', '360-285-8100');
INSERT INTO DEPARTMENT VALUES('Legal', 'BC-200-10', 'BLDG01-220', '360-285-8200');
INSERT INTO DEPARTMENT VALUES('Human Resources', 'BC-300-10', 'BLDG01-230', '360-285-8300');
INSERT INTO DEPARTMENT VALUES('Finance', 'BC-400-10', 'BLDG01-110', '360-285-8400');
INSERT INTO DEPARTMENT VALUES('Accounting', 'BC-500-10', 'BLDG01-120', '360-285-8405');
INSERT INTO DEPARTMENT VALUES('Sales and Marketing', 'BC-600-10', 'BLDG01-250', '360-287-8500');
INSERT INTO DEPARTMENT VALUES('InfoSystems', 'BC-700-10', 'BLDG02-210', '360-287-8600');
INSERT INTO DEPARTMENT VALUES('Research and Development', 'BC-800-10', 'BLDG02-250', '360-287-8700');
INSERT INTO DEPARTMENT VALUES('Production', 'BC-900-10', 'BLDG02-110', '360-287-8800');



/*****   EMPLOYEE DATA   ********************************************************/
/* note that MySQL allows null in the auto_increment field to generate the next value */

INSERT INTO EMPLOYEE(FirstName, LastName, Department, Position, OfficePhone, EmailAddress) 
	VALUES(
	'Mary', 'Jacobs', 'Administration', 'CEO', '360-285-8110', 'Mary.Jacobs@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Rosalie', 'Jackson', 'Administration', 'Admin Assistant', 1,
	'360-285-8120', 'Rosalie.Jackson@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Richard', 'Bandalone', 'Legal', 'Attorney', 1,
	'360-285-8210', 'Richard.Bandalone@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'George', 'Smith', 'Human Resources', 'HR3', 1,
	'360-285-8310', 'George.Smith@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Alan', 'Adams', 'Human Resources', 'HR1', 4,
	'360-285-8320', 'Alan.Adams@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Ken', 'Evans', 'Finance', 'CFO', 1,
	'360-285-8410', 'Ken.Evans@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Mary', 'Abernathy', 'Finance', 'FA3', 6,
    '360-285-8420', 'Mary.Abernathy@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Tom', 'Caruthers', 'Accounting', 'FA2', 6,
	'360-285-8430', 'Tom.Caruthers@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Heather', 'Jones', 'Accounting', 'FA2', 6,
	'360-285-8440', 'Heather.Jones@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Ken', 'Numoto', 'Sales and Marketing', 'SM3', 1,
	 '360-287-8510', 'Ken.Numoto@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Linda', 'Granger', 'Sales and Marketing', 'SM2', 10,
	 '360-287-8520', 'Linda.Granger@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'James', 'Nestor', 'InfoSystems', 'CIO', 1,
	'360-287-8610', 'James.Nestor@WP.com');
INSERT INTO EMPLOYEE(FirstName, LastName, Department, Position, Supervisor, EmailAddress)
	VALUES(
	'Rick', 'Brown', 'InfoSystems', 'IS2', 12, 'Rick.Brown@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Mike', 'Nguyen', 'Research and Development', 'CTO', 1,
	'360-287-8710', 'Mike.Nguyen@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Jason', 'Sleeman', 'Research and Development', 'RD3', 14,
	'360-287-8720', 'Jason.Sleeman@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Mary', 'Smith', 'Production', 'OPS3', 1,
	'360-287-8810', 'Mary.Smith@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'Tom', 'Jackson', 'Production', 'OPS2', 14,
	'360-287-8820', 'Tom.Jackson@WP.com');
INSERT INTO EMPLOYEE VALUES(
	null,'George', 'Jones', 'Production', 'OPS2', 15,
	'360-287-8830', 'George.Jones@WP.com');
INSERT INTO EMPLOYEE(FirstName, LastName, Department, Position, Supervisor, EmailAddress)
	 VALUES(
	'Julia', 'Hayakawa', 'Production', 'OPS1', 15, 'Julia.Hayakawa@WP.com');
INSERT INTO EMPLOYEE(FirstName, LastName, Department, Position, Supervisor, EmailAddress)
	 VALUES(
	'Sam', 'Stewart', 'Production', 'OPS1', 15, 'Sam.Stewart@WP.com');

/*****   PROJECT DATA   *********************************************************/


INSERT INTO PROJECT VALUES(
	1000,'2017 Q3 Production Plan', 'Production', 100.00, '2017-05-10', '2017-06-15');
INSERT INTO PROJECT VALUES(
	1100,'2017 Q3 Marketing Plan', 'Sales and Marketing', 135.00, '2017-05-10', '2017-06-15');
INSERT INTO PROJECT VALUES(
	1200,'2017 Q3 Portfolio Analysis', 'Finance', 120.00, '2017-07-05', '2017-07-25' );
INSERT INTO PROJECT VALUES(
	1300,'2017 Q3 Tax Preparation', 'Accounting', 145.00, '2017-08-10', '2017-10-15');
INSERT INTO PROJECT VALUES(
	1400,'2017 Q4 Production Plan', 'Production', 100.00, '2017-08-10', '2017-09-15');
INSERT INTO PROJECT VALUES(
	1500,'2017 Q4 Marketing Plan', 'Sales and Marketing', 135.00, '2017-08-10', '2017-09-15');
INSERT INTO PROJECT (ProjectID, ProjectName, Department, MaxHours, StartDate)				
	VALUES(										
	1600,'2017 Q4 Portfolio Analysis', 'Finance', 140.00, '2017-10-05');			


/*****   ASSIGNMENT DATA   ******************************************************/

INSERT INTO ASSIGNMENT VALUES(1000, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1000, 6, 50.0);
INSERT INTO ASSIGNMENT VALUES(1000, 10, 50.0);
INSERT INTO ASSIGNMENT VALUES(1000, 16, 75.0);
INSERT INTO ASSIGNMENT VALUES(1000, 17, 75.0);
INSERT INTO ASSIGNMENT VALUES(1100, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1100, 6, 75.0);
INSERT INTO ASSIGNMENT VALUES(1100, 10, 55.0);
INSERT INTO ASSIGNMENT VALUES(1100, 11, 55.0);
INSERT INTO ASSIGNMENT VALUES(1200, 3, 20.0);
INSERT INTO ASSIGNMENT VALUES(1200, 6, 40.0);
INSERT INTO ASSIGNMENT VALUES(1200, 7, 45.0);
INSERT INTO ASSIGNMENT VALUES(1200, 8, 45.0);
INSERT INTO ASSIGNMENT VALUES(1300, 3, 25.0);
INSERT INTO ASSIGNMENT VALUES(1300, 6, 40.0);
INSERT INTO ASSIGNMENT VALUES(1300, 8, 50.0);
INSERT INTO ASSIGNMENT VALUES(1300, 9, 50.0);
INSERT INTO ASSIGNMENT VALUES(1400, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1400, 6, 50.0);
INSERT INTO ASSIGNMENT VALUES(1400, 10, 50.0);
INSERT INTO ASSIGNMENT VALUES(1400, 16, 75.0);
INSERT INTO ASSIGNMENT VALUES(1400, 17, 75.0);
INSERT INTO ASSIGNMENT VALUES(1500, 1, 30.0);
INSERT INTO ASSIGNMENT VALUES(1500, 6, 75.0);
INSERT INTO ASSIGNMENT VALUES(1500, 10, 55.0);
INSERT INTO ASSIGNMENT VALUES(1500, 11, 55.0);
INSERT INTO ASSIGNMENT VALUES(1600, 3, 20.0);
INSERT INTO ASSIGNMENT VALUES(1600, 6, 40.0);
INSERT INTO ASSIGNMENT VALUES(1600, 7, 45.0);
INSERT INTO ASSIGNMENT VALUES(1600, 8, 45.0);







>>Queries<<


/* *** SQL-Query-CH03-01 *** */
SELECT  ProjectID, ProjectName, Department, MaxHours, StartDate, EndDate 
FROM PROJECT;

/* *** SQL-Query-CH03-02 *** */
SELECT *
FROM PROJECT;

/* *** SQL-Query-CH03-03 *** */
SELECT ProjectName, Department, MaxHours
FROM PROJECT;

/* *** SQL-Query-CH03-04 *** */
SELECT ProjectName, MaxHours, Department
FROM PROJECT;

/* *** SQL-Query-CH03-05 *** */
SELECT Department
FROM PROJECT;

/* *** SQL-Query-CH03-06 *** */
SELECT DISTINCT Department
FROM PROJECT;

/* *** SQL-Query-CH03-07 *** */
SELECT *
FROM PROJECT
WHERE Department = 'Finance';

/* *** SQL-Query-CH03-08 *** */
>> Returned empty result<<

/* *** SQL-Query-CH03-09 *** */ 
SELECT * FROM  PROJECT
WHERE MaxHours > 135;

/* *** SQL-Query-CH03-10 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM  EMPLOYEE
WHERE Department = 'Accounting';

/* *** SQL-Query-CH03-11 *** */
SELECT  FirstName, LastName, Department, OfficePhone
FROM   EMPLOYEE
ORDER BY  Department;
/* *** SQL-Query-CH03-12 *** */
SELECT  FirstName, LastName, Department, OfficePhone
FROM   EMPLOYEE
ORDER BY  Department DESC;

/* *** SQL-Query-CH03-13 *** */
SELECT  FirstName, LastName, Department, OfficePhone
FROM   EMPLOYEE ORDER BY 
Department DESC, LastName ASC;

/* *** SQL-Query-CH03-14 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM  EMPLOYEE
WHERE  Department = 'Accounting'
  AND OfficePhone = '360-285-8430';

/* *** SQL-Query-CH03-15 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM  EMPLOYEE
WHERE  Department = 'Accounting'
   OR  OfficePhone = '360-285-8410';

/* *** SQL-Query-CH03-16 *** */
SELECT  FirstName, LastName, Department, OfficePhone
FROM   EMPLOYEE
WHERE   Department = 'Accounting' 
  AND NOT  OfficePhone = '360-285-8430';

/* *** SQL-Query-CH03-17 *** */
SELECT FirstName, LastName, Department, OfficePhone 
FROM  EMPLOYEE 
WHERE  Department IN ('Administration', 'Finance', 'Accounting');

/* *** SQL-Query-CH03-18 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM  EMPLOYEE 
WHERE  Department NOT IN ('Administration', 'Finance', 'Accounting');

/* *** SQL-Query-CH03-19 *** */
SELECT FirstName, LastName, Department, OfficePhone 
FROM  EMPLOYEE
WHERE  EmployeeNumber >= 2    
  AND EmployeeNumber <= 5;

/* *** SQL-Query-CH03-20 *** */
SELECT FirstName, LastName, Department, OfficePhone 
FROM  EMPLOYEE
WHERE EmployeeNumber BETWEEN 2 AND 5;

/* *** SQL-Query-CH03-21 *** */
SELECT * 
FROM  PROJECT 
WHERE ProjectName LIKE '2017 Q_ Portfolio Analysis'; 

/* *** SQL-Query-CH03-22 *** */
>>Returned Empty Result<<

/* *** SQL-Query-CH03-23 *** */
SELECT * 
FROM  EMPLOYEE 
WHERE OfficePhone LIKE '360-287-88%';

/* *** SQL-Query-CH03-24 *** */
SELECT * 
FROM  EMPLOYEE 
WHERE Department LIKE '%ing';

/* *** SQL-Query-CH03-25 *** */
SELECT *
FROM  EMPLOYEE 
WHERE Department NOT LIKE '%ing';

/* *** SQL-Query-CH03-26 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM  EMPLOYEE
WHERE OfficePhone IS NULL;

/* *** SQL-Query-CH03-27 *** */
SELECT FirstName, LastName, Department, OfficePhone 
FROM  EMPLOYEE 
WHERE OfficePhone IS NOT NULL;

/* *** SQL-Query-CH03-28 *** */
SELECT COUNT(*) 
FROM PROJECT;

/* *** SQL-Query-CH03-29 *** */
SELECT COUNT(*) AS NumberOfProjects
FROM PROJECT;

/* *** SQL-Query-CH03-30 *** */
SELECT COUNT(Department) AS NumberOfDepartments 
FROM PROJECT;

/* *** SQL-Query-CH03-31 *** */
SELECT COUNT(DISTINCT Department) AS NumberOfDepartments
FROM PROJECT;

/* *** SQL-Query-CH03-32 *** */
SELECT SUM(MaxHours) AS TotalMaxHours, AVG(MaxHours) AS AverageMaxHours, MIN(MaxHours) AS MinimumMaxHours, MAX(MaxHours) AS MaximumMaxHours 
FROM  PROJECT 
WHERE ProjectID <= 1200;

/* *** SQL-Query-CH03-33 *** */
SELECT ProjectName, COUNT(*) 
FROM PROJECT;

/* *** SQL-Query-CH03-34 *** */
>>Invalid use if group function<<

/* *** SQL-Query-CH03-35 *** */
SELECT ProjectID, ProjectName, MaxHours, (24.50 * MaxHours) AS MaxProjectCost
FROM PROJECT;

/* *** SQL-Query-CH03-36 *** */
SELECT  Department, Count(*) AS NumberOfEmployees
FROM   EMPLOYEE
GROUP BY  Department;

/* *** SQL-Query-CH03-37 *** */
SELECT  Department, Count(*) AS NumberOfEmployees
FROM   EMPLOYEE 
GROUP BY  Department 
HAVING  COUNT(*) > 1;

/* *** SQL-Query-CH03-38 *** */
SELECT  Department, Count(*) AS NumberOfEmployees 
FROM   EMPLOYEE 
WHERE   EmployeeNumber <= 10 
GROUP BY  Department 
HAVING  COUNT(*) > 1;

/* *** SQL-Query-CH03-39 *** */
SELECT FirstName, LastName 
FROM  EMPLOYEE 
WHERE EmployeeNumber IN (6, 10, 11, 16, 17);

/* *** SQL-Query-CH03-40 *** */
SELECT DISTINCT EmployeeNumber 
FROM  ASSIGNMENT 
WHERE HoursWorked > 50;

/* *** SQL-Query-CH03-41 *** */
SELECT FirstName, LastName 
FROM  EMPLOYEE 
WHERE  EmployeeNumber IN 
        (SELECT DISTINCT EmployeeNumber 
         FROM ASSIGNMENT 
         WHERE HoursWorked > 50);

/* *** SQL-Query-CH03-42 *** */
SELECT DISTINCT ProjectID 
FROM  PROJECT 
WHERE Department = 'Accounting';

/* *** SQL-Query-CH03-43 *** */
SELECT DISTINCT EmployeeNumber 
FROM  ASSIGNMENT 
WHERE  HoursWorked > 40
  AND  ProjectID IN
       (SELECT ProjectID
       FROM PROJECT
       WHERE Department = 'Accounting'); 
       
/* *** SQL-Query-CH03-44 *** */
SELECT FirstName, LastName
FROM  EMPLOYEE
WHERE  EmployeeNumber IN 
       (SELECT DISTINCT EmployeeNumber
        FROM     ASSIGNMENT
        WHERE    HoursWorked > 40 
           AND   ProjectID IN 
           (SELECT ProjectID   
            FROM PROJECT   
            WHERE Department = 'Accounting'));

/* *** SQL-Query-CH03-45 *** */
SELECT FirstName, LastName, ProjectID, HoursWorked
            FROM EMPLOYEE, ASSIGNMENT;
            
/* *** SQL-Query-CH03-46 *** */
SELECT FirstName, LastName, ProjectID, HoursWorked 
FROM EMPLOYEE, ASSIGNMENT 
WHERE  EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber;

/* *** SQL-Query-CH03-47 *** */
SELECT  FirstName, LastName, ProjectID, HoursWorked
FROM   EMPLOYEE, ASSIGNMENT 
WHERE    EMPLOYEE.EmployeeNumber = ASSIGNMENT.  
            EmployeeNumber
ORDER BY  EMPLOYEE.EmployeeNumber, ProjectID;
            
/* *** SQL-Query-CH03-48 *** */
SELECT  FirstName, LastName, ProjectID, HoursWorked
FROM   EMPLOYEE JOIN ASSIGNMENT   
      ON   EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber 
ORDER BY  EMPLOYEE.EmployeeNumber, ProjectID;

/* *** SQL-Query-CH03-49 *** */
SELECT  FirstName, LastName,
        SUM(HoursWorked) AS TotalHoursWorked 
 FROM   EMPLOYEE AS E JOIN ASSIGNMENT AS A 
      ON  E.EmployeeNumber = A.EmployeeNumber 
GROUP BY  LastName, FirstName 
ORDER BY  LastName, FirstName;

/* *** SQL-Query-CH03-50 *** */
SELECT  FirstName, LastName, ProjectID, HoursWorked 
FROM   EMPLOYEE AS E JOIN ASSIGNMENT AS A 
     ON  E.EmployeeNumber = A.EmployeeNumber
WHERE   HoursWorked > 50 
ORDER BY  LastName, FirstName, ProjectID;

/* *** SQL-Query-CH03-51 *** */
SELECT   ProjectName, FirstName, LastName, 
            HoursWorked 
FROM   (EMPLOYEE AS E INNER JOIN ASSIGNMENT AS A 
     ON  E.EmployeeNumber = A.EmployeeNumber)
         INNER JOIN PROJECT AS P  
              ON A.ProjectID = P.ProjectID 
ORDER BY  P.ProjectID, A.EmployeeNumber;

/* *** SQL-Query-CH03-52 *** */
SELECT * 
FROM PROJECT;

/* *** SQL-Query-CH03-53 *** */
SELECT  ProjectName, FirstName, LastName, HoursWorked 
FROM    EMPLOYEE AS E JOIN ASSIGNMENT AS A 
     ON  E.EmployeeNumber = A.EmployeeNumber    
            JOIN  PROJECT AS P
            ON A.ProjectID = P.ProjectID
ORDER BY  P.ProjectID, A.EmployeeNumber;



