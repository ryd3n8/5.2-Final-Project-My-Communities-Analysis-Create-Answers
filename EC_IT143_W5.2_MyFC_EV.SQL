/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_MyFC_EV
PURPOSE: Create answer for my database question
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/16/2024     Edwin Velasquez         1. Built this script for EC IT143-5.2 FINAL PROJECT
RUNTIME:
1s
NOTES:
This is the question and answer for the 5.2 assignment
***********************************************************************************
*******************************/
-- Q1: What are the numbers assigned to players in defender position?
-- A1: Let's ask MyFC database and find out

SELECT     PL_NUM
	, [dbo].[tblPlayerDim].P_ID
	, p_name
FROM [dbo].[tblPlayerDim]
FULL OUTER JOIN [dbo].[tblPositionDim]
ON [dbo].[tblPlayerDim].P_ID = [dbo].[tblPositionDim].p_id
WHERE [dbo].[tblPositionDim].P_ID = 2

/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_MyFC_EV
PURPOSE: Create answer for my database question
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/16/2024     Edwin Velasquez         1. Built this script for EC IT143-5.2 FINAL PROJECT
RUNTIME:
1s
NOTES:
This is the question and answer for the 5.2 assignment
***********************************************************************************
*******************************/
-- Q2: Who are the position with fewest players and the highest-paid players in that position?
-- A2: Let's ask MyFC database and find out

SELECT COUNT(DISTINCT [dbo].[tblPlayerDim].PL_ID) AS NUMBER_OF_PLAYERS
			, P_NAME
			, MAX([dbo].[tblPlayerFact].MTD_SALARY) AS MAX_SALARY
		FROM [dbo].[tblPlayerDim]
	INNER JOIN [dbo].[tblPlayerFact]
	ON [dbo].[tblPlayerFact].pl_id = [dbo].[tblPlayerDim].pl_id
	INNER JOIN [dbo].[tblPositionDim]
	ON [dbo].[tblPositionDim].p_id = [dbo].[tblPlayerDim].p_id
	GROUP BY p_name
	ORDER BY NUMBER_OF_PLAYERS 

/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_MyFC_EV
PURPOSE: Create answer for my database question
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/16/2024     Edwin Velasquez         1. Built this script for EC IT143-5.2 FINAL PROJECT
RUNTIME:
1s
NOTES:
This is the question and answer for the 5.2 assignment
***********************************************************************************
*******************************/
-- Q3: 	Who is the highest-paid forward player?
-- A3: Let's ask MyFC database and find out

SELECT TOP(1) [dbo].[tblPlayerDim].PL_NAME 
	, P_NAME
	,MAX(mtd_salary) as Highest_paid
FROM [dbo].[tblPlayerDim]
INNER JOIN [dbo].[tblPositionDim]
ON [dbo].[tblPlayerDim].p_id = [dbo].[tblPositionDim].p_id
INNER JOIN [dbo].[tblPlayerFact]
ON [dbo].[tblPlayerDim].pl_id = [dbo].[tblPlayerFact].pl_id
WHERE [dbo].[tblPlayerDim].P_ID = 4
GROUP BY pl_name, p_name
ORDER BY Highest_paid DESC

/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_MyFC_EV
PURPOSE: Create answer for my database question
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/16/2024     Edwin Velasquez         1. Built this script for EC IT143-5.2 FINAL PROJECT
RUNTIME:
1s
NOTES:
This is the question and answer for the 5.2 assignment
***********************************************************************************
*******************************/
-- Q4: What is the sum of the players'salaries by team?
-- A4: Let's ask MyFC database and find out

SELECT DISTINCT T_ID
,SUM(mtd_salary) AS TOTAL_SALARY
,as_of_date
FROM [dbo].[tblPlayerDim]
INNER JOIN [dbo].[tblPlayerFact]
ON [dbo].[tblPlayerDim].pl_id = [dbo].[tblPlayerFact].pl_id
GROUP BY as_of_date, T_ID
ORDER BY T_ID, as_of_date
