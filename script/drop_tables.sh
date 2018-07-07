#!/bash/bin

. /home/hadoop/Desktop/project_refine_data/config/refine.properties

echo "Starting deleting the tables"
hive -e "use $hive_database; drop table $user_table; drop table $product_table; drop table $logs_table; drop view $view_name; drop table $output_table; drop database $hive_database;"

echo "Truncating mysql table"
mysql -u $mysql_user_name -p$mysql_pass -e "truncate $mysql_db_name.$mysql_table_name"


