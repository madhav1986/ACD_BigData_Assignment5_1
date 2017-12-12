emp_details = LOAD '/home/acadgild/pig_input_assignment5/employee_details.txt' USING PigStorage (',') as (empid:Int,empname:chararray,salary:Int,rating
:Int);
emp_expenses = LOAD '/home/acadgild/pig_input_assignment5/employee_expenses.txt' using PigStorage as(empid:int,expenses:int);
join_emp_det_expenses = JOIN emp_details by empid LEFT OUTER,emp_expenses by empid;
result = FILTER join_emp_det_expenses by emp_expenses::empid is null;
final_result = FOREACH result GENERATE emp_details::empid,emp_details::empname;
dump final_result;

