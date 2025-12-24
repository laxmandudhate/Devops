====================================================
LINUX COMMANDS CHEAT SHEET (TEXT FORMAT)
====================================================

-------------------------------
FILE & DIRECTORY MANAGEMENT
-------------------------------

pwd
# Show current working directory

ls
ls -l
ls -a
ls -lh
ls -ltr
# List files and directories

cd /path
cd ..
cd ~
cd -
# Change directory

mkdir dir_name
mkdir -p app/logs/nginx
# Create directories

rmdir dir_name
# Remove empty directory

rm file.txt
rm -r folder
rm -rf folder
# Delete files/directories (use carefully)

cp file1 file2
cp -r dir1 dir2
# Copy files/directories

mv oldname newname
mv file /opt/
# Move or rename

touch file.txt
# Create empty file

stat file.txt
# File details

-------------------------------
FILE VIEWING & EDITING
-------------------------------

cat file.txt
# View file content

less file.txt
more file.txt
# View large files

head file.txt
head -n 20 file.txt
# First lines

tail file.txt
tail -n 50 file.txt
tail -f app.log
# Last lines / live logs

nano file.txt
vi file.txt
vim file.txt
# Text editors

-------------------------------
PERMISSIONS & OWNERSHIP
-------------------------------

ls -l
# View permissions

chmod 755 script.sh
chmod +x deploy.sh
chmod 644 file.txt
# Change permissions

chown user file.txt
chown user:group file.txt
chown -R appuser:appgroup /app
# Change ownership

chgrp devops file.txt
# Change group

umask
# Default permissions

-------------------------------
SEARCH & TEXT PROCESSING
-------------------------------

grep error app.log
grep -i error app.log
grep -R error /var/log
# Search text

awk '{print $1}' file.txt
# Column processing

sed 's/old/new/g' file.txt
# Replace text

find / -name file.txt
find . -type f
find . -size +100M
# Find files

wc file.txt
wc -l file.txt
# Count lines/words

-------------------------------
PROCESS MANAGEMENT
-------------------------------

ps -ef
ps aux
# Process list

top
htop
# Resource usage

kill PID
kill -9 PID
# Kill process

nice -n 10 command
renice -5 PID
# Process priority

-------------------------------
DISK & MEMORY
-------------------------------

df -h
# Disk usage

du -sh folder
# Directory size

free -m
free -h
# Memory usage

lsblk
# Disk layout

mount
umount /mnt
# Mount/unmount

-------------------------------
NETWORKING
-------------------------------

ip a
ip r
# Network info

ping google.com
# Connectivity test

ss -tulnp
netstat -tulnp
# Open ports

curl http://example.com
curl -I http://example.com
# API / URL test

wget http://example.com/file.zip
# Download file

-------------------------------
SYSTEM & SERVICES
-------------------------------

systemctl status nginx
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable nginx
# Service management

journalctl
journalctl -u nginx
journalctl -f
# Logs

uptime
hostname
hostnamectl
uname -a
# System info

-------------------------------
ARCHIVE & COMPRESSION
-------------------------------

tar -cvf backup.tar folder
tar -xvf backup.tar
tar -czvf backup.tar.gz folder
tar -xzvf backup.tar.gz
# Tar commands

zip file.zip file.txt
unzip file.zip
# Zip/unzip

-------------------------------
USER & GROUP MANAGEMENT
-------------------------------

useradd devops
passwd devops
userdel devops
# User management

groupadd dev
groupdel dev
# Group management

id
whoami
who
# User info

-------------------------------
IMPORTANT DEVOPS COMMANDS
-------------------------------

sudo command
crontab -e
crontab -l
watch df -h
history
clear

====================================================
END OF FILE
====================================================
