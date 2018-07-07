# E-Commerce-Order-Data-Analysis-
Environment:  Hadoop 2.x, HDFS, HIVE, SQOOP 

Fetched the data from an E-Commerce Portal, which is stored in data folder it contain 4 files 2 files named 4 and 5.tsv which contains data about the product url, customer id, sate, country, pincode and many more details like this and the other file named regusers.tsv has data about user id, user name, user dob and gender and last file named url map has category of product and product url.

Moved these tsv files into three different HDFS directories, then created hive external tables and performed hive queries on that data sets then exported the final tabular data from HDFS to MySQL using SQOOP.

The shell scripting files for this whole process is stored in script folder.
