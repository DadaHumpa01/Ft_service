# /etc/init.d/vsftpd start

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/vsftpd/vsftpd.crt -keyout /etc/vsftpd/vsftpd.key -subj "/C=IT/ST=Napoli/L=Napoli/O=42 School/OU=Napoleone/CN=42roma"

adduser -D ftptest
echo ftptest:ftptest | chpasswd
echo "ftptest" >> /etc/vsftpd/vsftpd.userlist
chown -R ftptest:ftptest /home/
chmod -R 777 /home/
# usermod -s /bin/bash robtest
#/etc/init.d/vsftpd restart
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

# rc-service vsftpd start