i=0
total_files=$(find "./envs" -type f | wc -l)
echo "Total files $total_files"
for file in $PWD/envs/{*,.*}
do
    echo "Start $file"
    if [ -f "$file" ]; then
      ((i++))
      source $file
      echo "($i/$total_files) start bkp $DB_NAME"
      mkdir -p ./bkp/$DB_NAME
      timestamp=$(date +%s)
      mysqldump --ssl-verify-server-cert=0 -u $DB_USER -p$DB_PASS -P $PORT -h $DB_HOST $DB_NAME > ./bkp/$DB_NAME/$timestamp-temp.sql
      if [ -n "$(find "./bkp/$DB_NAME/$timestamp-temp.sql" -prune -size +1000000c)" ]; then
        printf '%s is strictly larger than 1 MB\n' "$filepath"
        mv ./bkp/$DB_NAME/$timestamp-temp.sql ./bkp/$DB_NAME/$timestamp-$DB_NAME.sql
      else
        print 'trouble on bkp'
      fi
      echo "($i/$total_files) ended bkp $DB_NAME"
    fi
done
