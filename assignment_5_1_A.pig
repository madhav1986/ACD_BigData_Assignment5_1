emp_details = LOAD '/home/acadgild/pig_input_assignment5/employee_details.txt' USING PigStorage (',') as (empid:Int,empname:chararray,salary:Int,rating:Int);
emp_sorted = ORDER emp_details by rating desc,empname asc;
emp_top5_rating = LIMIT emp_sorted 5;
dump emp_top5_rating;
