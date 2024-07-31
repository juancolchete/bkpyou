source ./.env

mkdir -p ./bkp/$DB_NAME
for i in $(seq 1 100)
  do sleep 1 && timestamp=$(date +%s) && mysqldump --ssl-verify-server-cert=0 -u $DB_USER -p$DB_PASS -P $PORT -h $DB_HOST $DB_NAME > ./bkp/$DB_NAME/$timestamp-$DB_NAME.sql
done
