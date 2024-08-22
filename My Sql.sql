CREATE DATABASE BANK_LOAN_ANALYSIS;
use  bank_loan_analysis;

select * from finance_1;

select * from finance_2;

ALTER TABLE finance_1 CHANGE ï»¿id id int;
ALTER TABLE finance_2 CHANGE ï»¿id id int;


/* KPI 1- Year wise loan amount Stats */

select sum(loan_amnt) as Total_loan_amount,year(issue_d) as Year_of_issue_d
from finance_1
group by Year_of_issue_d;


/*KPI 2-Grade and sub grade wise revol_bal */

select grade,sub_grade, sum(revol_bal) as Total_revol_bal
from finance_1 inner join finance_2
on finance_1.id=finance_2.id
group by grade,sub_grade
order by grade,sub_grade;

/*KPI 3- Total Payment for Verified Status Vs Total Payment for Non Verified Status */

select verification_status , round(sum(total_pymnt),2) as Total_Payment
from finance_1 inner join finance_2
on finance_1.id = finance_2.id
group by verification_status;

/* KPI 4- State wise and last_credit_pull_d wise loan status */

select addr_state as State , last_credit_pull_d , loan_status
from finance_1 inner join finance_2
on finance_1.id = finance_2.id
group by addr_state, last_credit_pull_d , loan_status;

/* KPI 5-Home ownership Vs last payment date stats */

select * from finance_1;
select * from finance_2;

select Home_ownership,last_pymnt_d
from finance_1 inner join finance_2
on finance_1.id = finance_2.id
group by Home_ownership,last_pymnt_d
order by Home_ownership,last_pymnt_d;








