#!/bin/sh
backuplogs=/data_stores/BackupDB/logs
backup=/data_stores/BackupDB
cd $backup

find $backup -type f -mtime +5 -delete

pg_dump scgdb | gzip > scgdb_`date +%d-%m-%Y_%H%M%S`.tar.gz

