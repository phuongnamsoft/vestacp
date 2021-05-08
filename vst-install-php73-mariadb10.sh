#!/bin/bash

echo "Pre-Install: "

yum install curl wget -y

PHP_VERSION="73"

echo "[mariadb]" > '/etc/yum.repos.d/MariaDB.repo'
echo "name = MariaDB" >> '/etc/yum.repos.d/MariaDB.repo'
echo "baseurl = http://yum.mariadb.org/10.4/centos7-amd64" >> '/etc/yum.repos.d/MariaDB.repo'
echo "gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB" >> '/etc/yum.repos.d/MariaDB.repo'
echo "gpgcheck=1" >> '/etc/yum.repos.d/MariaDB.repo'

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm

yum install yum-utils -y
yum-config-manager --enable remi-php$PHP_VERSION

echo "Install VestaCP: "

curl -O http://vestacp.com/pub/vst-install.sh
bash vst-install.sh --nginx yes --phpfpm yes --apache no --named no --remi no --vsftpd yes --proftpd no --iptables no --fail2ban no --quota no --exim no --dovecot no --spamassassin no --clamav no --softaculous no --mysql yes --postgresql no

bash vst-crack.sh

echo "Install Opcache, Memcached, Redis: "
yum install php-opcache php-memcached php-memcache php-redis redis memcached php-imagick -y

/bin/systemctl restart memcached.service
/bin/systemctl enable memcached.service

/bin/systemctl restart redis.service
/bin/systemctl enable redis.service

/bin/systemctl restart nginx.service
/bin/systemctl enable nginx.service

/bin/systemctl restart php-fpm.service
/bin/systemctl enable php-fpm.service

/bin/systemctl restart mysql.service
/bin/systemctl enable mysql.service

