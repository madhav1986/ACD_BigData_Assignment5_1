emp_details = LOAD '/home/acadgild/pig_input_assignment5/employee_details.txt' USING PigStorage (',') as (empid:Int,empname:chararray,salary:Int,rating
:Int);
emp_expenses = LOAD '/home/acadgild/pig_input_assignment5/employee_expenses.txt' using PigStorage as(empid:int,expenses:int);
emp_join = JOIN emp_details by empid,emp_expenses by empid;
emp_order = ORDER emp_join by emp_expenses::expenses DESC,emp_details::empname;
emp_top_expenses = LIMIT emp_order 1;
result = FOREACH emp_top_expenses GENERATE emp_details::empid as empid,emp_details::empname as empname,emp_expenses::expenses as expenses;
dump result;
