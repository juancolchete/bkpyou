COMMAND="your_command"

# Iterate over each file in the directory
for file in $PWD/envs/{*,.*}
do
    if [ -f "$file" ]; then
      echo $file
      source $file
      mkdir -p ./bkp/$DB_NAME
      timestamp=$(date +%s)
      mysqldump --ssl-verify-server-cert=0 -u $DB_USER -p$DB_PASS -P $PORT -h $DB_HOST $DB_NAME > ./bkp/$DB_NAME/$timestamp-$DB_NAME.sql
    fi
done
