for file in $PWD/envs/{*,.*}
do
    if [ -f "$file" ]; then
      source $file
      DIR="./bkp/$DB_NAME/"
      KEEP=72
      find "$DIR" -type f -printf "%T@ %p\n" | sort -n | head -n -"$KEEP" | cut -d' ' -f2- | xargs -d '\n' rm -f
    fi
done


