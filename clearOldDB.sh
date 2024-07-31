for file in $PWD/envs/{*,.*}
do
    if [ -f "$file" ]; then
      echo "start clear old db $DB_NAME"
      source $file
      DIR="./bkp/$DB_NAME/"
      KEEP=72
      find "$DIR" -type f -printf "%T@ %p\n" | sort -n | head -n -"$KEEP" | cut -d' ' -f2- | xargs -d '\n' rm -f
      echo "ended clear old db $DB_NAME"
    fi
done


