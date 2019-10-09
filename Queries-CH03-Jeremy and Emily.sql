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



