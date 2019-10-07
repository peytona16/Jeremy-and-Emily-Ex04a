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
