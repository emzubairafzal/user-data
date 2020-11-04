#cloud-config

runcmd:
- yum install -y httpd
- yum install -y epel-release
- yum install -y s3fs-fuse
- echo <<your-access_key_id>>:<<your-secret_access_key>>  > /root/.passwd-s3fs
- chmod 600 /root/.passwd-s3fs
- mkdir /webinardata
- s3fs <<your-bucket-name>> /webinardata -o passwd_file=/root/.passwd-s3fs -o url=<<bucket endpoint - e.g.: https://s3.eu-gb.cloud-object-storage.appdomain.cloud>>
- cp -r /webinardata/it-next/* /var/www/html/
- chmod -R 755 /var/www/html
- httpd -k start
