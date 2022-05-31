# script-postgresDB-backup

 - 1.สร้าง path เพื่อเก็บ file backup 
 - 2.แก้ chown to postgres ของไฟล์ postgresql_backup.sh
     |__ sudo chown -R postgres:postgres postgresql_backup.sh    
        |
        |__ #!/bin/sh
            backuplogs=/data_stores/BackupDB/logs
            backup=/data_stores/BackupDB
            cd $backup

            find $backup -type f - mtime +5 -delete  <delete file ที่มีอายุวัน +5วัน>

            pg_dump scgdb | gzip > scgdb_`date +%d-%m-%Y_%H%M%S`.gz  <command postgres สั่ง zip ไฟล์ที่ิ backup แล้วตั้งชื่อ date +%d-%m-%Y_%H%M%S >



Crontab คือคำสั่งที่จะทำงานตามเวลาที่กำหนด ซึ่งจะช่วยทำให้เราสะดวกขึ้นมากในการที่จะต้องสั่งงานบางอย่างซ้ำๆ กันหลายๆ ครั้ง อาจจะเป็นทุกๆ ชั่วโมง ทุกๆ วัน
หรือ ทุกๆ เดือน เช่นการสั่งให้ Server ทำ Backup ทุกๆวัน
--allow user : https://docs.oracle.com/cd/E19253-01/817-0403/sysrescron-23/index.html
https://kb.hostatom.com/content/2226/

    create crontab file
        - 1. su - <user> ที่ต้องการเข้าไปสร้าง crontab
        - 2. crontab -l เพื่อเช็คว่ามี crontab ?
        - 3. crontab -e เพื่อเข้าไปสร้าง หรือ แก้ไข crontab
             |__ 00 22 * * * /etc/scripts/postgresql_backup.sh <ตั้งเวลารัน postgresql_backup.sh เวลา 22.00 pm ทุกวัน> 


-- help --
crontab -l เพื่อเช็คว่ามี crontab ?
crontab -e เพื่อเข้าไปสร้าง หรือ แก้ไข crontab
crontab -r ลบ crontab


at จะเป็นการทำงานแค่ครั้งเดียว ต่างจาก crontab

systemctl start , stop , restart