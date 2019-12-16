#!/bin/bash
yum install curl wget -y
curl -O https://raw.githubusercontent.com/phuongnamsoft/vestacp/master/vst-install-rhel.sh
curl -O https://raw.githubusercontent.com/phuongnamsoft/vestacp/master/vst-crack.sh

bash vst-install-rhel.sh --nginx yes --phpfpm yes --apache no --named yes --remi yes --vsftpd yes --proftpd no --iptables no --fail2ban no --quota no --exim yes --dovecot yes --spamassassin no --clamav no --softaculous no --mysql yes --postgresql no
bash vst-crack.sh

rm -rf ./vst-install-rhel.sh
rm -rf ./vst-crack.sh