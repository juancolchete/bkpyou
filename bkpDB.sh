i=0
total_files=$(find "./envs" -type f | wc -l)
for file in $PWD/envs/{*,.*}
do
    if [ -f "$file" ]; then
      ((i++))
      echo "($i/$total_files) start bkp $DB_NAME"
      source $file
      mkdir -p ./bkp/$DB_NAME
      timestamp=$(date +%s)
      mysqldump --ssl-verify-server-cert=0 -u $DB_USER -p$DB_PASS -P $PORT -h $DB_HOST $DB_NAME > ./bkp/$DB_NAME/$timestamp-$DB_NAME.sql
      echo "($i/$total_files) ended bkp $DB_NAME"
    fi
done
