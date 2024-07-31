i=0
total_files=$(find "./envs" -type f | wc -l)
for file in $PWD/envs/{*,.*}
do
    if [ -f "$file" ]; then
      ((i++))
      source $file
      echo "($i/$total_files) start clear old db $DB_NAME"
      DIR="./bkp/$DB_NAME/"
      KEEP=72
      find "$DIR" -type f -printf "%T@ %p\n" | sort -n | head -n -"$KEEP" | cut -d' ' -f2- | xargs -d '\n' rm -f
      echo "($i/$total_files) ended clear old db $DB_NAME"
    fi
done


