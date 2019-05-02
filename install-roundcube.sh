#!/bin/bash

apt install git

git clone https://github.com/roundcube/roundcubemail && cd roundcubemail
curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp/

bin/install-jsdeps.sh
bin/jsshrink.sh

cd skins/elastic

lessc -x styles/styles.less > styles/styles.css
lessc -x styles/print.less > styles/print.css
lessc -x styles/embed.less > styles/embed.css

cd ../..

bin/updatecss.sh
bin/cssshrink.sh

rm transifexpull.sh package2composer.sh importgettext.sh exportgettext.sh README.md INSTALL UPGRADING, LICENSE, CHANGELOG
rm -rf tests/ public_html/ installer/ .git* .tx*

cp composer.json-dist composer.json

php /tmp/composer.phar install --prefer-dist --no-dev

cd ../

mv roundcubemail data/web/rc
chown -R root: data/web/rc/

