i=0
total_files=$(find "./envs" -type f | wc -l)
for file in $PWD/envs/{*,.*}
do
    if [ -f "$file" ]; then
      ((i++))
      echo "($i/$total_files) start clear old db $DB_NAME"
      source $file
      DIR="./bkp/$DB_NAME/"
      KEEP=72
      find "$DIR" -type f -printf "%T@ %p\n" | sort -n | head -n -"$KEEP" | cut -d' ' -f2- | xargs -d '\n' rm -f
      echo "($i/$total_files) ended clear old db $DB_NAME"
    fi
done


