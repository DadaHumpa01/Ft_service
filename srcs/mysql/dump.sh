run=`mysql -u wpuser < wpdb.sql | grep MySQL` > /dev/null
while [[ `$run | grep MySQL` ]]
do
	run=`mysql -u wpuser < wpdb.sql | grep MySQL` > /dev/null
done
rm wpdb.sql init_file