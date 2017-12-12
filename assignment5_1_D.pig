emp_details = LOAD '/home/acadgild/pig_input_assignment5/employee_details.txt' USING PigStorage (',') as (empid:Int,empname:chararray,salary:Int,rating:Int);
emp_expenses = LOAD '/home/acadgild/pig_input_assignment5/employee_expenses.txt' USING PigStorage as (empid:Int,expenses:Int);
join_empdetails_expenses = JOIN emp_details by empid,emp_expenses by empid;
empid_names_output = FOREACH join_empdetails_expenses GENERATE emp_details::empid,emp_details::empname;
result = DISTINCT empid_names_output;
dump result;
