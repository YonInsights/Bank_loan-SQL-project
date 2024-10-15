-- check if all data is imported 
SELECT *
FROM Bank_loan_data
-- Total loan application
SELECT COUNT(id) AS Total_loan_application
FROM Bank_loan_data
-- MTD_Total loan amount 
SELECT COUNT(id) AS MTD_Total_Loan_App1ications 
FROM Bank_loan_data
WHERE MONTH(issue_date) = 12 
AND YEAR(issue_date) = 2021
-- PMTD_Total loan amount 
SELECT COUNT(id) AS PMTD_Total_Loan_App1ications 
FROM Bank_loan_data
WHERE MONTH(issue_date) = 11 
AND YEAR(issue_date) = 2021
-- Total funded amount 
SELECT SUM(loan_amount) AS Total_loan_amount 
FROM Bank_loan_data
-- MTD Total funded amount 
SELECT SUM(loan_amount) AS MTD_Total_loan_amount 
FROM Bank_loan_data
where MONTH (issue_date) = 12
  And YEAR (issue_date) = 2021 
-- PMTD Total funded amount 
SELECT SUM(loan_amount) AS PMTD_Total_loan_amount 
FROM Bank_loan_data
where MONTH (issue_date) = 11
  And YEAR (issue_date) = 2021 
-- Total amount recived MTD
SELECT SUM(total_payment) AS MTD_Total_amount_recived
FROM Bank_loan_data
WHERE MONTH(issue_date) = 12
AND YEAR(issue_date) =2021
-- Total amount recived PMTD
SELECT SUM(total_payment) AS PMTD_Total_amount_recived
FROM Bank_loan_data
WHERE MONTH(issue_date) = 11
AND YEAR(issue_date) =2021
-- Average interst rate 
SELECT ROUND(AVG(int_rate)*100, 2) AS Average_interest
FROM Bank_loan_data;
-- MTD Average interst rate 
SELECT ROUND(AVG(int_rate)*100, 2) AS MTD_Average_interest
FROM Bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR (issue_date) =2021
-- PMTD Average interst rate 
SELECT ROUND(AVG(int_rate)*100, 2) AS PMTD_Average_interest
FROM Bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR (issue_date) =2021
-- Average Debt to income ratio
SELECT ROUND(AVG(dti)*100,2) AS Average_Debt_to_income_ratio
FROM Bank_loan_data
-- MTD Average Debt to income ratio
SELECT ROUND(AVG(dti)*100,2) AS MTD_Average_Debt_to_income_ratio
FROM Bank_loan_data
WHERE MONTH	(issue_date) =12 AND YEAR (issue_date)=2021
-- PMTD Average Debt to income ratio
SELECT ROUND(AVG(dti)*100,2) AS PMTD_Average_Debt_to_income_ratio
FROM Bank_loan_data
WHERE MONTH	(issue_date) =11 AND YEAR (issue_date)=2021
-------------------------------------------------------------------------------------------
--Good laon 
SELECT 
(COUNT(CASE WHEN loan_status ='Fully Paid' or loan_status ='Current'THEN id END) *100)/
COUNT(id) AS Good_laon_Percentage 
FROM Bank_loan_data
--Number of Good laon 
SELECT 
  COUNT(loan_status) AS Number_of_Good_laon
  FROM Bank_loan_data
  WHERE (loan_status)='Fully Paid' OR (loan_status) ='Current'
--Amount of Good laon 
SELECT 
  SUM(loan_amount) AS Amount_of_Good_laon
  FROM Bank_loan_data
  WHERE (loan_status)='Fully Paid' OR (loan_status) ='Current'
--Good laon recived amount 
SELECT 
  SUM(total_payment) AS Good_laon_recived_amount
  FROM Bank_loan_data
  WHERE (loan_status)='Fully Paid' OR (loan_status) ='Current'
  ----------------------------------------------------------------------
--Bad laon 
SELECT 
ROUND((COUNT(CASE WHEN loan_status ='Charged Off' THEN id END) *100.0)/
COUNT(id),2) AS Bad_laon_Percentage 
FROM Bank_loan_data
--Number of Bad laon 
SELECT 
  COUNT(loan_status) AS Number_of_Bad_laon
  FROM Bank_loan_data
  WHERE (loan_status)='Charged Off'
--Amount of Bad laon 
SELECT 
  SUM(loan_amount) AS Amount_of_Bad_laon
  FROM Bank_loan_data
  WHERE (loan_status)='Charged Off'
--Bad laon recived amount 
SELECT 
  SUM(total_payment) AS Bad_laon_recived_amount
  FROM Bank_loan_data
  WHERE (loan_status)='Charged Off'
-- Loan status 
  SELECT loan_status,
  COUNT(id)AS Numbera_of_loan,
  SUM (total_payment) AS Total_Amount_recived, 
  SUM(loan_amount) AS Total_Funded_Amount,
  AVG(int_rate*100) AS Interest_Rate,
  AVG(dti * 100) AS DTI
  FROM
   Bank_loan_data
   GROUP BY
   loan_status
-- MTD Loan status 
	 SELECT 
	loan_status AS MTD_Loan_status,
	 SUM(total_payment) AS MTD_Total_Amount_recived, 
	 SUM(loan_amount) AS MTD_Total_Funded_Amount		
	   FROM Bank_loan_data
	   WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021
	   GROUP BY loan_status
-- PMTD Loan status 
	 SELECT 
	      loan_status AS PMTD_Loan_status,
	 SUM(total_payment) AS PMTD_Total_Amount_recived, 
	 SUM(loan_amount) AS PMTD_Total_Funded_Amount		
	   FROM Bank_loan_data
	   WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021
	   GROUP BY loan_status
--Loan status with respect to month
	  SELECT 
	     MONTH(issue_date) AS Month_number,
		 DATENAME(MONTH ,issue_date) AS Months,
		 COUNT(id) AS Total_Application,
		 SUM(loan_amount) AS Total_Funded_Amount,
		 SUM(total_payment) AS Total_Amount_recived
	   FROM
           Bank_loan_data
	   GROUP BY  MONTH(issue_date),DATENAME(MONTH ,issue_date)
	   ORDER BY  MONTH(issue_date)
--Loan status with respect to Address State
       SELECT 
	     address_state, 
		 COUNT(id) AS Total_Application,
		 SUM(loan_amount) AS Total_Funded_Amount,
		 SUM(total_payment) AS Total_Amount_recived
	   FROM
           Bank_loan_data
	   GROUP BY  address_state
	   ORDER BY  SUM(loan_amount) Desc
--Loan status with respect to Term
       SELECT 
	     term,
		 COUNT(id) AS Total_Application,
		 SUM(loan_amount) AS Total_Funded_Amount,
		 SUM(total_payment) AS Total_Amount_recived
	   FROM
           Bank_loan_data
	   GROUP BY  term
	   ORDER BY  term
--Loan status with respect to Employe length
       SELECT 
	     emp_length,
		 COUNT(id) AS Total_Application,
		 SUM(loan_amount) AS Total_Funded_Amount,
		 SUM(total_payment) AS Total_Amount_recived
	   FROM
           Bank_loan_data
	   GROUP BY  emp_length
	   ORDER BY  emp_length
--Loan status with respect to Purpose
       SELECT 
	     purpose,
		 COUNT(id) AS Total_Application,
		 SUM(loan_amount) AS Total_Funded_Amount,
		 SUM(total_payment) AS Total_Amount_recived
	   FROM
           Bank_loan_data
	   GROUP BY  purpose
	   ORDER BY  COUNT(id) DESC
--Loan status with respect to home ownership
       SELECT 
	     home_ownership,
		 COUNT(id) AS Total_Application,
		 SUM(loan_amount) AS Total_Funded_Amount,
		 SUM(total_payment) AS Total_Amount_recived
	   FROM
           Bank_loan_data
	   GROUP BY  home_ownership
	   ORDER BY  COUNT(id) DESC

