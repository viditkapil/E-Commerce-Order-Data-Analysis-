#!/bash/bin

exec 2>&1 > /home/hadoop/Desktop/project_refine_data/logs/sqoop_export.log

. /home/hadoop/Desktop/project_refine_data/config/refine.properties

echo "Exporting the data to mysql using sqoop" 
sqoop export -connect $sqoop_conn_string"/"$mysql_db_name --table $mysql_table_name --export-dir "/user/hadoop/hive/warehouse/"$hive_database".db/"$output_table --username $mysql_user_name --password $mysql_pass -m 1 --input-fields-terminated-by '\001' 

status=$?
echo "status code is : "$status 

if [ $status -eq 0 ]; then 
echo "Data exported to mysql successfully" 
echo "Checking mysql exported records"
count=$(mysql -u $mysql_user_name -p$mysql_pass -e "select count(*) from $mysql_db_name.$mysql_table_name")
echo "Number of records exported are: "$count  

else 
echo "Data export to mysql failed"
fi
