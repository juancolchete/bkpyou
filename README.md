# bkpyou
Solution to do BKP in MySQL and postgres databases.

To use create a folder called envs
```bash
mkdir envs
```
Copy env sample to this folder
```bash
cp env.sample envs/.env
```
Fill all the values and run `bash bkpDB.sh` to do a backup of your database and `bash clearOldDB` to remove some old files
