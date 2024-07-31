source ./.env
timestamp=$(date +%s)
mkdir -p ./bkp/$DB_NAME
mysqldump --ssl-verify-server-cert=0 -u $DB_USER -p$DB_PASS -P $PORT -h $DB_HOST $DB_NAME > ./bkp/$DB_NAME/$timestamp-$DB_NAME.sql
