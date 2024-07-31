source ./.env
timestamp=$(date +%s)
mkdir ./bkp/$DB_NAME
mysqldump -u $DB_USER -p $DB_PASS -P $PORT -h $DB_HOST  $DB_NAME > ./bkp/$DB_NAME/$timestamp-$DB_NAME.sql
