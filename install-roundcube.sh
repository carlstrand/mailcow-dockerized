#!/bin/bash

add-apt-repository ppa:linuxuprising/java
apt update
apt install oracle-java11-installer git php php-pear php-mbstring unzip file -y

git clone https://github.com/roundcube/roundcubemail
curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp/

roundcubemail/bin/install-jsdeps.sh
roundcubemail/bin/jsshrink.sh

lessc -x roundcubemail/skins/elastic/styles/styles.less > roundcubemail/skins/elastic/styles/styles.css
lessc -x roundcubemail/skins/elastic/styles/print.less > roundcubemail/skins/elastic/styles/print.css
lessc -x roundcubemail/skins/elastic/styles/embed.less > roundcubemail/skins/elastic/styles/embed.css

roundcubemail/bin/updatecss.sh
roundcubemail/bin/cssshrink.sh

rm roundcubemail/bin/transifexpull.sh roundcubemail/bin/package2composer.sh roundcubemail/bin/importgettext.sh roundcubemail/bin/exportgettext.sh roundcubemail/README.md roundcubemail/INSTALL roundcubemail/UPGRADING, roundcubemail/LICENSE, roundcubemail/CHANGELOG
rm -rf roundcubemail/tests/ roundcubemail/public_html/ roundcubemail/installer/ roundcubemail/.git* .tx*

cp roundcubemail/composer.json-dist roundcubemail/composer.json

php /tmp/composer.phar install --prefer-dist --no-dev

mkdir /opt/mailcow-dockerized/data/web/rc
mv roundcubemail /opt/mailcow-dockerized/data/web/rc
chown -R root: /opt/mailcow-dockerized/data/web/rc/
