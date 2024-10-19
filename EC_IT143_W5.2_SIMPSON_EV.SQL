/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_simpsons_EV
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
-- Q1: How are the 5 highest paid that Marge did in 1990?
-- A1: Let's ask simpson database and find out

SELECT TOP(5) DEBIT
			,"DESCRIPTION"
			,"Date"
			,[Member_Name]
FROM [dbo].[FBS_Viza_Costmo]
WHERE [Date] LIKE '1990%' AND [Member_Name] LIKE 'MARGE%'
ORDER BY Debit DESC ;

/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_simpsons_EV
PURPOSE: Create answer for my database question
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/16/2024     Edwin Velasquez         1. Built this script for EC IT143-5.2 FINAL PROJECT
RUNTIME:
1s
NOTES:
This is the question and answer for the 5.2 assignment(The two card tables needs a Member_ID column)
***********************************************************************************
*******************************/
-- Q2: what are the 3 highest Homero spends by category?
-- A2: Let's ask simpson database and find out
SELECT TOP(3) Amount
			,[Description]
			,[Card_Member]
			,[Category]
FROM [Simpsons].[dbo].[Planet_Express]
WHERE [Card_Member] LIKE 'HOMER%'
ORDER BY [Simpsons].[dbo].[Planet_Express].Amount DESC ;

/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_simpsons_EV
PURPOSE: Create answer for my database question
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/16/2024     Edwin Velasquez         1. Built this script for EC IT143-5.2 FINAL PROJECT
RUNTIME:
1s
NOTES:
This is the question and answer for the 5.2 assignment(The two card tables needs a Member_ID column)
***********************************************************************************
*******************************/
-- Q3: How much Homero spent in krusty burguer ?
-- A3: Let's ask simpson database and find out
SELECT		SUM(Amount) AS TOTAL_SPEND
			,[Description]
			,[Card_Member]
			,[Category]
FROM [Simpsons].[dbo].[Planet_Express]
WHERE [Card_Member] LIKE 'HOMER%' AND [Description] LIKE 'KRUST%'
GROUP BY [Description], [Card_Member], [Category];


/***********************************************************************************
******************************
NAME: EC_IT143_W5.2_simpsons_EV
PURPOSE: Create answer for my database question
MODIFICATION LOG:
Ver    Date                Author              Description
----- ---------- -----------
-------------------------------------------------------------------------------
1.0     10/16/2024     Edwin Velasquez         1. Built this script for EC IT143-5.2 FINAL PROJECT
RUNTIME:
1s
NOTES:
This is the question and answer for the 5.2 assignment (The two card tables needs a Member_ID column)
***********************************************************************************
*******************************/
-- Q4: what is the job position of Homero and how much he earn in the 1991?
-- A4: Let's ask simpson database and find out
SELECT	SUM(credit) AS TOTAL_EARNED
		,[Member_Name]
		,[Job_Title]
FROM [dbo].[FBS_Viza_Costmo]
INNER JOIN [dbo].[Family_Data]
ON [dbo].[Family_Data].Member_ID = [dbo].[FBS_Viza_Costmo].Member_ID
WHERE [Date] LIKE '1991%' AND [Member_ID] = 1
GROUP BY [Member_Name], [Job_Title] ;
