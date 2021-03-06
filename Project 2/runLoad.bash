#!/bin/bash
#!/bin/sh

# Change permissions of script
chmod a+x runLoad.sh

# Run the drop.sql batch file to drop existing tables
# Inside the drop.sql, you sould check whether the table exists. Drop them ONLY if they exists.
mysql CS144 < drop.sql

# Run the create.sql batch file to create the database and tables
mysql CS144 < create.sql

# Compile and run the parser to generate the appropriate load files
ant
ant run-all

# If the Java code does not handle duplicate removal, do this now
sort -u item.dat > Itemsort.dat
sort -u seller.dat > Sellersort.dat
sort -u buyer.dat > Buyersort.dat
sort -u bids.dat  > Bidssort.dat
sort -u category.dat  > Categorysort.dat
# Run the load.sql batch file to load the data
mysql CS144 < load.sql

mysql CS144 < queries.sql

#remove dat files
rm item.dat
rm Itemsort.dat
rm seller.dat
rm Sellersort.dat
rm buyer.dat
rm Buyersort.dat
rm bids.dat
rm Bidssort.dat
rm category.dat
rm Categorysort.dat