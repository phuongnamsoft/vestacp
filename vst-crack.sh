#!/bin/bash

VESTA='/usr/local/vesta'

fileCrack="$VESTA/conf/vesta.conf"
echo "FILEMANAGER_KEY='ILOVEREO'" >> $fileCrack
echo "SFTPJAIL_KEY='ILOVEREO'" >> $fileCrack

fileCrack="$VESTA/bin/v-activate-vesta-license"
echo "#!/bin/bash" > $fileCrack
echo "exit" >> $fileCrack

fileCrack="$VESTA/bin/v-add-vesta-softaculous"
echo "#!/bin/bash" > $fileCrack
echo "exit" >> $fileCrack

fileCrack="$VESTA/bin/v-check-vesta-license"
echo "#!/bin/bash" > $fileCrack
echo "exit" >> $fileCrack

fileCrack="$VESTA/bin/v-deactivate-vesta-license"
echo "#!/bin/bash" > $fileCrack
echo "exit" >> $fileCrack

fileCrack="$VESTA/bin/v-list-sys-vesta-updates"
echo "#!/bin/bash" > $fileCrack
echo "exit" >> $fileCrack
