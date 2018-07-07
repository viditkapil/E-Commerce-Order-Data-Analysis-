#!/bash/bin

exec 2>&1  > /home/hadoop/Desktop/project_refine_data/logs/final_hive_dataset.log 

. /home/hadoop/Desktop/project_refine_data/config/refine.properties

echo "Creating sub set of logs data"
hive -e "CREATE VIEW if not exists $hive_database.$view_name AS 
SELECT
col_2 ts,
col_8 ip,
col_13 url,
col_14 swid,
col_50 city,
col_51 country,
col_53 state
from $hive_database.$logs_table; "

status=$?
echo "status code is : "$status 
if [ $status -eq 0 ]; then
echo "Creating final dataset" 
hive -e "create table if not exists $hive_database.$output_table as
select to_date(o.ts) logdate, o.url, o.ip, o.city, upper(o.state) state, o.country, p.category, CAST(datediff( from_unixtime( unix_timestamp() ),  from_unixtime( unix_timestamp(d.birth_dt, 'dd-MMM-yy'))) / 365  AS INT) age, d.gender_cd gender from  $hive_database.$view_name o  left outer join $hive_database.$product_table p on o.url = p.url  left outer join $hive_database.$user_table d on o.swid = concat('{', d.swid , '}');  "
status=$?
else 
echo "view not created"
fi 

echo "status code is : "$status 
if [ $status -eq 0 ]; then		
echo "Output dataset created successfully"
else
echo "Error in logic or syntax -----------Please check"
fi


