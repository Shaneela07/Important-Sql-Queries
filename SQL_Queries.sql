-------------------------**********************************ASSIGNMENT 7(SQL Queries Assignment)**************************************-------------------

--Problem Statement:

Consider yourself to be Sam and you have been given the below tasks to
complete using the Table – STUDIES, SOFTWARE and PROGRAMMER

-- Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA ',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);
-- View
select * from Studies

-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 -- View
 select * from Software

 -- Programmer Table
 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);
-- View
select * from Programmer

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Tasks To Be Performed:

--1. Find out the selling cost average for packages developed in Pascal.
Solution-->
SELECT AVG(SCOST) AS AverageSellingCost
FROM Software
WHERE DEVELOPIN = 'PASCAL';

--2. Display the names and ages of all programmers.
Solution-->
SELECT PNAME, DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Programmer;

--3. Display the names of those who have done the DAP Course.
Solution-->
SELECT PNAME
FROM Studies
WHERE COURSE = 'DAP';

--4. Display the names and date of birth of all programmers born in January.
Solution-->
SELECT PNAME, DOB
FROM Programmer
WHERE MONTH(DOB) = 1;

--5. What is the highest number of copies sold by a package?
Solution-->
SELECT MAX(SOLD) AS HighestCopiesSold
FROM Software;

--6. Display lowest course fee.
Solution-->
SELECT MIN(COURSE_FEE) AS LowestCourseFee
FROM Studies;

--7. How many programmers have done the PGDCA Course?
Solution-->
SELECT COUNT(*) AS PGDCAProgrammers
FROM Studies
WHERE COURSE = 'PGDCA';


--8. How much revenue has been earned through sales of packages developed in C?
Solution-->
SELECT SUM(SCOST * SOLD) AS RevenueEarned
FROM Software
WHERE DEVELOPIN = 'C';

--9. Display the details of the software developed by Ramesh.
Solution-->
SELECT *
FROM Software
WHERE PNAME = 'RAMESH';
--10. How many programmers studied at Sabhari?
Solution-->
--SELECT COUNT(*) FROM STUDIES WHERE INSTITUTE='Sabhari'
SELECT COUNT(*) AS SabhariProgrammers
FROM Studies
WHERE INSTITUTE = 'SABHARI';

--11. Display details of packages whose sales crossed the 2000 mark.
Solution-->
SELECT * FROM Software WHERE SCOST > 2000;

--12. Display the details of packages for which development costs have been recovered.
Solution-->
SELECT * FROM Software WHERE SCOST >= DCOST;

--13. What is the cost of the costliest software development in Basic?
Solution-->
SELECT MAX(SCOST) AS CostliestBasicDevelopment
FROM Software
WHERE DEVELOPIN = 'BASIC';

--14. How many packages have been developed in dBase?
Solution-->
SELECT COUNT(*) AS dBasePackages
FROM Software
WHERE DEVELOPIN = 'DBASE';
--15. How many programmers studied in Pragathi?
Solution-->
SELECT COUNT(DISTINCT PNAME) AS PragathiProgrammers
FROM Studies
WHERE INSTITUTE = 'PRAGATHI';

--16. How many programmers paid 5000 to 10000 for their course?
Solution-->
SELECT COUNT(*) AS ProgrammersPaidBetween5KAnd10K
FROM Studies
WHERE COURSE_FEE BETWEEN 5000 AND 10000
--17. What is the average course fee?
Solution-->

SELECT AVG(COURSE_FEE) AS AverageCourseFee FROM Studies;

--18. Display the details of the programmers knowing C.
Solution-->

SELECT * FROM Programmer WHERE PROF1 = 'C' OR PROF2 = 'C';

--19. How many programmers know either COBOL or Pascal?
Solution-->

SELECT COUNT(*) AS COBOLOrPascalProgrammers
FROM Programmer
WHERE PROF1 = 'COBOL' OR PROF2 = 'COBOL' OR PROF1 = 'PASCAL' OR PROF2 = 'PASCAL';

--20. How many programmers don’t know Pascal and C?
Solution-->
SELECT COUNT(*) AS NoPascalOrCProgrammers
FROM Programmer
WHERE NOT (PROF1 = 'C' OR PROF2 = 'C' OR PROF1 = 'PASCAL' OR PROF2 = 'PASCAL');

--21. How old is the oldest male programmer?
Solution-->
SELECT MAX(DATEDIFF(YEAR, DOB, GETDATE())) AS OldestMaleProgrammerAge
FROM Programmer
WHERE GENDER = 'M';

--22. What is the average age of female programmers?
Solution-->
SELECT AVG(DATEDIFF(YEAR, DOB, GETDATE())) AS AverageFemaleProgrammerAge
FROM Programmer
WHERE GENDER = 'F';

--23. Calculate the experience in years for each programmer and display with their names in descending order.
Solution-->
SELECT PNAME, DATEDIFF(YEAR, DOJ, GETDATE()) AS Experience
FROM Programmer
ORDER BY Experience DESC;

--24. Who are the programmers who celebrate their birthdays during the current month?
Solution-->
SELECT PNAME, DOB
FROM Programmer
WHERE MONTH(DOB) = MONTH(GETDATE());

--25. How many female programmers are there?
Solution-->
SELECT COUNT(*) AS FemaleProgrammers
FROM Programmer
WHERE GENDER = 'F';

--26. What are the languages studied by male programmers?
Solution-->
SELECT DISTINCT PROF1, PROF2
FROM Programmer
WHERE GENDER = 'M';

--27. What is the average salary?
Solution-->
SELECT AVG(SALARY) AS AverageSalary
FROM Programmer;

--28. How many people draw a salary between 2000 to 4000?
Solution-->
SELECT COUNT(*) AS PeopleWithSalariesBetween2KAnd4K
FROM Programmer
WHERE SALARY BETWEEN 2000 AND 4000;

--29. Display the details of those who don’t know Clipper, COBOL or Pascal.
Solution-->
SELECT * FROM Programmer
WHERE PROF1 NOT IN ('CLIPPER', 'COBOL', 'PASCAL') AND PROF2 NOT IN ('CLIPPER', 'COBOL', 'PASCAL');

--30. Display the cost of packages developed by each programmer.
Solution-->
SELECT PNAME, SUM(SCOST) AS TotalDevelopmentCost
FROM Software
GROUP BY PNAME;

--31. Display the sales value of the packages developed by each programmer.
Solution-->
SELECT PNAME, SUM(SCOST) AS TotalDevelopmentCost
FROM Software
GROUP BY PNAME;

--32. Display the number of packages sold by each programmer.
Solution-->
SELECT PNAME, SUM(SCOST * SOLD) AS TotalSalesValue
FROM Software
GROUP BY PNAME;

--33. Display the sales cost of the packages developed by each programmer language wise.
Solution-->
SELECT PNAME,SUM(SOLD) AS TotalPackagesSold
FROM Software
GROUP BY PNAME;

--34. Display each language name with the average development cost,average selling cost and average price per copy.
Solution-->
SELECT DEVELOPIN, AVG(DCOST) AS AvgDevelopmentCost, AVG(SCOST) AS AvgSellingCost, AVG(DCOST/SCOST) AS AvgPricePerCopy
FROM Software
GROUP BY DEVELOPIN;
--35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.
Solution-->
SELECT PNAME, MAX(SCOST) AS CostliestPackage, MIN(SCOST) AS CheapestPackage
FROM Software
GROUP BY PNAME;

--36. Display each institute’s name with the number of courses and the average cost per course.
Solution-->
SELECT INSTITUTE, COUNT(COURSE) AS NumberOfCourses, AVG(COURSE_FEE) AS AverageCourseFee
FROM Studies
GROUP BY INSTITUTE;

--37. Display each institute’s name with the number of students.
Solution-->
SELECT INSTITUTE, COUNT(PNAME) AS NumberOfStudents
FROM Studies
GROUP BY INSTITUTE;

--38. Display names of male and female programmers along with their gender.
Solution-->
SELECT PNAME, GENDER
FROM Programmer;

--39. Display the name of programmers and their packages.
Solution-->
SELECT S.PNAME, S.TITLE
FROM Software S
INNER JOIN Programmer P ON S.PNAME = P.PNAME;

--40. Display the number of packages in each language except C and C++.
Solution-->
SELECT DEVELOPIN, COUNT(*) AS PackageCount
FROM Software
WHERE DEVELOPIN NOT IN ('C', 'C++')
GROUP BY DEVELOPIN;

--41. Display the number of packages in each language for which development cost is less than 1000.
Solution-->
SELECT DEVELOPIN, COUNT(*) AS PackageCount
FROM Software
WHERE DCOST < 1000
GROUP BY DEVELOPIN;

--42. Display the average difference between SCOST and DCOST for each package.
Solution-->
SELECT TITLE, AVG(SCOST - DCOST) AS AverageDifference
FROM Software
GROUP BY TITLE;

--43. Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.
Solution-->
SELECT P.PNAME, SUM(S.SCOST) AS TotalSCOST, SUM(S.DCOST) AS TotalDCOST, SUM(S.DCOST-(SOLD*S.SCOST)) AS AmountToBeRecovered
FROM Programmer P
LEFT JOIN Software S ON P.PNAME = S.PNAME
GROUP BY P.PNAME;

--44. Display the highest, lowest and average salaries for those earning more than 2000.
Solution-->
SELECT MAX(SALARY) AS HighestSalary, MIN(SALARY) AS LowestSalary, AVG(SALARY) AS AverageSalary
FROM Programmer
WHERE SALARY > 2000;

--45. Who is the highest paid C programmer?
Solution-->
SELECT MAX(Programmer.PNAME) AS PNAME, MAX(SALARY) AS HighestSalary
FROM Programmer
WHERE PROF1 = 'C' OR PROF2 = 'C';

SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C')

--46. Who is the highest paid female COBOL programmer?
Solution-->
SELECT MAX(Programmer.PNAME) AS PNAME,MAX(SALARY) AS HighestSalary, COUNT(*) AS NumberOfPrograms
FROM Programmer
WHERE GENDER = 'F' AND (PROF1 = 'COBOL' OR PROF2 = 'COBOL');

SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1='COBOL' OR PROF2='COBOL')) AND GENDER ='F'
--47. Display the names of the highest paid programmers for each language.
Solution-->
SELECT DISTINCT PNAME, SALARY, PROF1
FROM PROGRAMMER 
WHERE (SALARY,PROF1) IN (SELECT MAX(SALARY),PROF1FROM PROGRAMMER GROUP BY PROF1)

--48. Who is the least experienced programmer?
Solution-->
SELECT PNAME, DATEDIFF(YEAR, DOJ, GETDATE()) AS Experience
FROM Programmer 
ORDER BY Experience ASC;

--49. Who is the most experienced male programmer knowing PASCAL?
Solution-->
SELECT PNAME, DATEDIFF(YEAR, DOJ, GETDATE()) AS Experience
FROM Programmer
WHERE GENDER = 'M' AND (PROF1 = 'PASCAL' OR PROF2 = 'PASCAL')
ORDER BY Experience DESC;

--50. Which language is known by only one programmer?
Solution-->
SELECT DEVELOPIN
FROM Software
GROUP BY DEVELOPIN
HAVING COUNT(*) = 1

--51. Who is the above programmer referred in 50?
Solution-->
SELECT PNAME,DEVELOPIN FROM Software WHERE DEVELOPIN IN (SELECT DEVELOPIN FROM Software GROUP BY DEVELOPIN HAVING COUNT(*) = 1);

--52. Who is the youngest programmer knowing dBase?
Solution-->
SELECT PNAME, DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Programmer
WHERE PROF1 = 'dBase' OR PROF2 = 'dBase'
ORDER BY Age ASC

SELECT DATEDIFF(YEAR, DOB, GETDATE()) AS Age, PNAME, PROF1, PROF2 FROM PROGRAMMER WHERE DATEDIFF(YEAR, DOB, GETDATE()) = (SELECT MIN(DATEDIFF(YEAR, DOB, GETDATE())) 
FROM PROGRAMMER WHERE PROF1='DBASE' OR PROF2='DBASE');

--53. Which female programmer earning more than 3000 does not know C,C++, Oracle or dBase?
Solution-->
SELECT * FROM Programmer
WHERE GENDER = 'F'AND SALARY > 3000
AND (PROF1 NOT IN ('C', 'C++', 'Oracle', 'dBase') AND PROF2 NOT IN ('C', 'C++', 'Oracle', 'dBase'));

--54. Which institute has the most number of students?
Solution-->
SELECT INSTITUTE, COUNT(PNAME) AS NumberOfStudents FROM Studies
GROUP BY INSTITUTE
ORDER BY NumberOfStudents DESC;

--55. What is the costliest course?
Solution-->
SELECT COURSE,COURSE_FEE
FROM Studies
WHERE course_fee = (SELECT MAX(course_fee) FROM STUDIES)

--56. Which course has been done by the most number of students?
Solution-->
select course,count(pname) as MostDoneCourse from studies
group by course 
order by MostDoneCourse desc

--57. Which institute conducts the costliest course?
Solution-->
SELECT  Institute,COURSE, COURSE_FEE
FROM Studies
WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM Studies);

--58. Display the name of the institute and the course which has below average course fee.
Solution-->
select institute, course,course_fee
from studies 
where course_fee  < (SELECT AVG(course_fee) FROM STUDIES);

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.
Solution-->
select course,course_fee
from studies 
where course_fee < (SELECT AVG(course_fee)+1000 FROM STUDIES) AND course_fee >(SELECT AVG(course_fee)-1000 FROM STUDIES);

--60. Which package has the highest development cost?
Solution-->
SELECT TITLE,DCOST FROM SOFTWARE
WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

--61. Which course has below average number of students?
Solution-->
SELECT COURSE FROM STUDIES 
GROUP BY COURSE 
HAVING COUNT(PNAME)<(SELECT AVG(COUNT(PNAME)) FROM STUDIES GROUP BY COURSE)

SELECT COURSE, COUNT(PNAME) AS NumberOfStudents
FROM Studies
GROUP BY COURSE
HAVING NumberOfStudents < (SELECT AVG(NumberOfStudents) FROM (SELECT COUNT(PNAME) AS NumberOfStudents FROM Studies GROUP BY COURSE) AS AvgStudents);

--62. Which package has the lowest selling cost?
Solution-->
SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

--63. Who developed the package that has sold the least number of copies?
Solution-->
SELECT PNAME,SOLD 
FROM SOFTWARE 
WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE);

--64. Which language has been used to develop the package which has the highest sales amount?
Solution-->
SELECT DEVELOPIN,SCOST 
FROM SOFTWARE 
WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE);

--65. How many copies of the package that has the least difference between development and selling cost were sold?
Solution-->
SELECT SOLD,TITLE FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));

--66. Which is the costliest package developed in Pascal?
Solution-->
SELECT TITLE,DCOST FROM SOFTWARE 
WHERE DCOST = (SELECT MAX(DCOST)FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL');

--67. Which language was used to develop the most number of packages?
Solution-->
SELECT DEVELOPIN FROM SOFTWARE 
GROUP BY DEVELOPIN  
HAVING DEVELOPIN = (SELECT MAX(DEVELOPIN) FROM SOFTWARE);

--68. Which programmer has developed the highest number of packages?
Solution-->
SELECT PNAME FROM SOFTWARE 
GROUP BY PNAME 
HAVING PNAME = (SELECT MAX(PNAME) FROM SOFTWARE);

--69. Who is the author of the costliest package?
Solution-->
SELECT PNAME, TITLE, SCOST
FROM Software
ORDER BY SCOST DESC;

--70. Display the names of the packages which have sold less than the average number of copies.
Solution-->
SELECT TITLE,SOLD FROM SOFTWARE 
WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);
--71. Who are the authors of the packages which have recovered more than double the development cost?
Solution-->
SELECT  distinct PNAME,TITLE FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST;

--72. Display the programmer names and the cheapest packages developed by them in each language.
Solution-->
SELECT PNAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN);

--73. Display the language used by each programmer to develop the highest selling and lowest selling package.
Solution-->
SELECT PNAME, DEVELOPIN,SOLD FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN,SOLD FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);

--74. Who is the youngest male programmer born in 1965?
Solution-->
SELECT PNAME, DOB as Age
FROM Programmer
WHERE GENDER = 'M' AND YEAR(DOB) = 1965
ORDER BY DOB DESC;

--75. Who is the oldest female programmer who joined in 1992?
Solution-->
select pname,dob as age
from programmer 
where year(doj)='1992' and Gender='F'
order by age desc
--76. In which year was the most number of programmers born?
Solution-->
select year(dob) ,count(year(dob)) as count
from programmer 
group by year(dob) 
order by count(*) desc;

--77. In which month did the most number of programmers join?
Solution-->
select month(doj) as month,count(month(doj)) as count 
from programmer 
group by month(doj) 
order by count(*) desc;

--78. In which language are most of the programmer’s proficient?
Solution-->
select prof1,prof2,count(pname) as count 
from programmer 
group by prof1,prof2 
order by count desc ;

--79. Who are the male programmers earning below the average salary of female programmers?
Solution-->
SELECT PNAME,SALARY FROM PROGRAMMER WHERE Gender LIKE 'M'
AND SALARY < (SELECT(AVG(SALARY)) FROM PROGRAMMER WHERE Gender LIKE 'F');

--80. Who are the female programmers earning more than the highest paid?
Solution-->
SELECT PNAME,SALARY FROM PROGRAMMER WHERE Gender = 'F' 
AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER WHERE GENDER = 'M');

--81. Which language has been stated as the proficiency by most of the programmers?
Solution-->
SELECT PROF1 AS Language, COUNT(*) AS NumberOfProgrammers FROM Programmer GROUP BY PROF1
UNION ALL
SELECT PROF2 AS Language, COUNT(*) AS NumberOfProgrammers FROM Programmer GROUP BY PROF2
ORDER BY NumberOfProgrammers DESC

--82. Display the details of those who are drawing the same salary.
Solution-->
SELECT * FROM PROGRAMMER WHERE Salary IN
(SELECT SALARY FROM PROGRAMMER GROUP BY SALARY HAVING Count(SALARY) > 1)
order by Salary Desc;

--83. Display the details of the software developed by the male programmers earning more than 3000.
Solution-->
SELECT * FROM PROGRAMMER P,SOFTWARE S
where P.pname=S.pname and SALARY>3000 and GENDER='M';

--84. Display the details of the packages developed in Pascal by the female programmers.
Solution-->
SELECT * FROM PROGRAMMER P,SOFTWARE S
WHERE p.pname=s.pname AND GENDER='F' and DEVELOPIN ='pascal';

--85. Display the details of the programmers who joined before 1990.
Solution-->
select * from PROGRAMMER where year(doj)< 1990;

--86. Display the details of the software developed in C by the female programmers at Pragathi.
Solution-->
select s.* from SOFTWARE s,STUDIES st,PROGRAMMER p 
where s.pname=st.pname and p.pname=s.pname and GENDER='f' and INSTITUTE='pragathi';

--87. Display the number of packages, number of copies sold and sales value of each programmer institute wise.
Solution-->
Select studies.institute, count(software.developin) AS developin, count(software.sold) As Sold, sum(software.sold*software.scost) AS sales
from software,studies
where software.pname =studies.pname 
group by studies.institute;

--88. Display the details of the software developed in dBase by male programmers who belong to the institute in which the most number of programmers studied.
Solution-->
CREATE TABLE INST (INS VARCHAR(20), CNT INT);

INSERT INTO INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE;

SELECT distinct SW.* FROM software AS SW, programmer AS PG, studies AS ST, INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM INST);

--89. Display the details of the software developed by the male programmers born after 1965 and female programmers born before 1975.
Solution-->
SELECT S.*, YEAR(DOB),GENDER FROM Programmer p,Software s 
WHERE s.PNAME=p.PNAME AND 
((GENDER='M' AND YEAR(DOB)>1965)OR(GENDER='F' AND YEAR(DOB)<1975));

--90. Display the details of the software that has been developed in the language which is neither the first nor the second proficiency of the programmers.
Solution-->
select s.* from programmer p,software s
where s.pname=p.pname and (developin <> prof1 and developin <> prof2);

--91. Display the details of the software developed by the male students at Sabhari.
Solution-->
select s.* from software s,studies st,programmer p 
where s.pname=st.pname and p.pname=s.pname and GENDER='m' and institute='Sabhari';

--92. Display the names of the programmers who have not developed any packages.
Solution-->
select pname from programmer
where pname not in(select pname from software);

--93. What is the total cost of the software developed by the programmers of Apple?
Solution-->
select sum(scost)as cost_of_softDev from software s,studies st
where s.pname=st.pname and institute='apple';

--94. Who are the programmers who joined on the same day?
Solution-->
SELECT DOJ, STRING_AGG(PNAME, ', ') AS ProgrammersJoinedOnTheSameDay
FROM Programmer
GROUP BY DOJ
HAVING COUNT(*) > 1;

select * from Programmer
--95. Who are the programmers who have the same Prof2?
Solution-->
SELECT Prof2, STRING_AGG(PNAME, ', ') AS ProgrammersWithSameProf2
FROM Programmer
GROUP BY Prof2
HAVING COUNT(*) > 1;

--96. Display the total sales value of the software institute wise.
Solution-->
select studies.institute,sum(software.sold*software.scost)as Tot_salVal_softInst from software,studies
where studies.pname=software.pname 
group by studies.institute;

--97. In which institute does the person who developed the costliest package study?
Solution-->
select INSTITUTE,DCOST from software st,studies s
where s.pname=st.pname 
group by institute,dcost 
having dcost=(select max(dcost) from software);

--98. Which language listed in Prof1, Prof2 has not been used to develop any package?
Solution-->
select prof1 from programmer where prof1 not in(select developin from software) 
union
select prof2 from programmer where prof2 not in(select developin from software);

--99. How much does the person who developed the highest selling package earn and what course did he/she undergo?
Solution-->
select p1.salary,s2.course,p1.pname from programmer p1,software s1,studies s2
where p1.pname=s1.pname and s1.pname=s2.pname and scost=(select max(scost) from software);

--100. What is the average salary for those whose software sales is more than 50,000?
Solution-->
select avg(salary) from programmer p,software s
where p .pname=s.pname and (sold*scost)>50000;

--101. How many packages were developed by students who studied in institutes that charge the lowest course fee?
Solution-->
WITH LowestFeeInstitutes AS 
    (SELECT MIN(COURSE_FEE) AS MinCourseFee
    FROM Studies)

SELECT COUNT(S.PNAME) AS NumberOfPackages
FROM Studies S
INNER JOIN LowestFeeInstitutes LFI ON S.COURSE_FEE = LFI.MinCourseFee
INNER JOIN Software SW ON S.PNAME = SW.PNAME;

--102. How many packages were developed by the person who developed the cheapest package? Where did he/she study?
Solution-->
WITH CheapestPackage AS 
    (SELECT TOP 1 PNAME
    FROM Software
    ORDER BY SCOST ASC)
	
SELECT CP.PNAME,S.COURSE,S.INSTITUTE, COUNT(SW.PNAME) AS NumberOfPackagesDeveloped
FROM CheapestPackage CP
JOIN Studies S ON CP.PNAME = S.PNAME
JOIN Software SW ON CP.PNAME = SW.PNAME
GROUP BY CP.PNAME, S.INSTITUTE,S.COURSE;

--103. How many packages were developed by female programmers earning more than the highest paid male programmer?
Solution-->
select count(developin) from programmer p,software s
where s.pname=p.pname and Gender='f' and salary>(select max(salary) from programmer p,software s
where s.pname=p.pname and Gender='m');

--104. How many packages are developed by the most experienced programmers from BDPS?
Solution-->
select count(*) from software s,programmer p 
where p.pname=s.pname group by doj having min(doj)=(select min(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

--105. List the programmers (from the software table) and the institutes they studied at.
Solution-->
SELECT S.PNAME AS ProgrammerName, I.INSTITUTE AS InstituteName
FROM Software S
LEFT JOIN Studies I ON S.PNAME = I.PNAME
GROUP BY S.PNAME, I.INSTITUTE
ORDER BY S.PNAME;

--106. List each PROF with the number of programmers having that PROF and the number of the packages in that PROF.
Solution-->
SELECT PROF1 AS ProgrammingProficiency1,
    COUNT(DISTINCT P.PNAME) AS NumberOfProgrammers,
    COUNT(S.TITLE) AS NumberOfPackages
FROM Programmer P
LEFT JOIN Software S ON P.PNAME = S.PNAME
GROUP BY PROF1, PROF2
ORDER BY ProgrammingProficiency1;

SELECT PROF2 AS ProgrammingProficiency2,
COUNT(DISTINCT P.PNAME) AS NumberOfProgrammers,
    COUNT(S.TITLE) AS NumberOfPackages
FROM Programmer P
LEFT JOIN Software S ON P.PNAME = S.PNAME
GROUP BY PROF1, PROF2 ORDER BY ProgrammingProficiency2;


--107. List the programmer names (from the programmer table) and the number of packages each has developed.
Solution-->
select s.pname,count(developin)as #packdev from programmer p1,software s
where p1.pname=s.pname group by s.pname;

/////////////////////////******************************************THANK YOU***************************************************///////////////////////////////////
