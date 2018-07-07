#!/bash/bin

exec 2>&1 > /home/hadoop/Desktop/project_refine_data/logs/process.log

echo "Starting creating source dataset"
sh /home/hadoop/Desktop/project_refine_data/script/create_hive_dataset.sh
status=$?
if [ $status -eq "0" ]; then

echo "Starting creating final dataset"
sh /home/hadoop/Desktop/project_refine_data/script/final_dataset.sh
status=$?
else 
echo "Error in creating source dataset"
fi 

if [ $status -eq "0" ]; then
echo "Starting sqoop export"
sh /home/hadoop/Desktop/project_refine_data/script/sqoop_export.sh
status=$?
else 
echo "Error in creating final dataset"
fi 

if [ $status -eq "0" ]; then
echo "Export sucessfull to sqoop "
else 
echo "Export failed to sqoop"
fi

