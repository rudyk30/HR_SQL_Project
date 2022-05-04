
# Overview of analysis

The purpose of this analysis was to create a table that shows the number of employees eligible for a mentorship program and identify the number of retiring employees per title. This analysis was completed through creating queries using SQL within PostgreSQL. 


## Results 

After completing both pieces of the analysis below are 4 major takeaways garnered from the analysis. 

* Below is a breakdown of all retiring employees Job titles

<img width="489" alt="Screen Shot 2022-05-03 at 10 33 53 PM" src="https://user-images.githubusercontent.com/101602688/166619861-0822c018-99bf-45ab-b763-25779a73eddb.png">

* Below is a brief breakdown of the employees eligible for the mentorship program

<img width="812" alt="Screen Shot 2022-05-03 at 10 44 02 PM" src="https://user-images.githubusercontent.com/101602688/166620457-9ef47fef-aff2-4284-a22f-8ee8bcdad8fb.png">


* From the data, we can see Senior Engineer's and Senior Staff are job titles seeing the largest amount of retirements. 

* The Manager job title has the least amount of retirements at 2. 

* There are 1,549 employees who are eligible to participate in a mentorship program. 

* Overall, from the retirement titles table, we can see a significant amount of the workforce is entering retirement. 

## Summary

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

  * 72,458 roles will need to be filled before the "silver tsumani" makes an impact. See below for calculation from the "retiring_titles.csv". 

<img width="164" alt="roles_filled" src="https://user-images.githubusercontent.com/101602688/166619817-ac9046c9-5a70-4377-9018-0bc191cd7879.png">


* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

  * No, as we only have 1,549 employees eligible for the mentorship program. 

Two additional queries that can be written to dig deeper into the "silver tsumani":

* A Total_Employees query will be helpful as we can then calculate the percentage of the overall workforce that is retiring. Using a LEFT JOIN as we are not looking for matching values between the titles and employees table. Below is what the query will look like: 

*  SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
  
   employees.first_name,
   
   employees.last_name,
    
   titles.title,
    
   titles.from_date,
    
   titles.to_date

  INTO Total_Employees

  FROM employees

  LEFT JOIN titles

  ON employees.emp_no = titles.emp_no

  ORDER BY employees.emp_no, titles.to_date DESC



* Another query that will be helpful is to understand the salaries of the employees eligible to retire. That way, we can analyze if our highest paid employees are leaving. The query will look like this:

* SELECT ri.emp_no, ri.first_name, ri.last_name, 

   sa.emp_no,

   sa.salary

   FROM retirement_titles as ri

  LEFT JOIN salaries as sa

  ON (ri.emp_no=sa.emp_no)
