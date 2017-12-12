emp_details = LOAD '/home/acadgild/pig_input_assignment5/employee_details.txt' USING PigStorage (',') as (empid:Int,empname:chararray,salary:Int,rating
:Int);
emp_id_name_sal = FOREACH emp_details GENERATE $0,$1,$2,$0%2;
empid_odd = FILTER emp_id_name_sal BY $3==1;
emp_sal_desc = ORDER empid_odd BY $2 desc;
emp_top3_sal = LIMIT emp_sal_desc 3;
result = FOREACH emp_top3_sal GENERATE empid,empname,salary;
dump result;

