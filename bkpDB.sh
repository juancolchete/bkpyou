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
      touch ./bkp/$DB_NAME/temp.sql
      if [[ $DB_KIND == "postgres" ]]; then
        PGPASSWORD=$DB_PASS pg_dump -U $DB_USER -h $DB_HOST -d $DB_NAME > ./bkp/$DB_NAME/temp.sql
      else
        mysqldump --ssl-verify-server-cert=0 -u $DB_USER -p$DB_PASS -P $PORT -h $DB_HOST $DB_NAME > ./bkp/$DB_NAME/temp.sql
      fi
      if [ -n "$(find "./bkp/$DB_NAME/temp.sql" -prune -size +100000c)" ]; then
        mv ./bkp/$DB_NAME/temp.sql ./bkp/$DB_NAME/$timestamp-$DB_NAME.sql
      else
        echo "trouble on bkp"
      fi
      echo "($i/$total_files) ended bkp $DB_NAME"
    fi
done
