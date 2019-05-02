git clone https://github.com/roundcube/roundcubemail

cd roundcubemail

bin/install-jsdeps.sh
bin/jsshrink.sh
bin/updatecss.sh
bin/cssshrink.sh

cd skins/elastic
lessc -x styles/styles.less > styles/styles.css
lessc -x styles/print.less > styles/print.css
lessc -x styles/embed.less > styles/embed.css
cd ../..

mv roundcubemail data/web/rc





cd data/web
wget -O - https://github.com/roundcube/roundcubemail/releases/download/1.3.x/roundcubemail-1.3.x-complete.tar.gz | tar xfvz -
# Change folder name
mv roundcubemail-1.3.x rc
# Change permissions
chown -R root: rc/
