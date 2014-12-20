echo "create database joomla3_zhen CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -uroot -pyikes3479
mysql -u root -pyikes3479 joomla3_zhen < /jgenerator3_setup/joomla3_zhen.sql

echo "create database joomla3_wrspb CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -uroot -pyikes3479
mysql -u root -pyikes3479 joomla3_wrspb < /jgenerator3_setup/joomla3_wrspb.sql


sudo usermod -a -G www-data vagrant

sudo mkdir -p /var/www/vhosts/
sudo cp /jgenerator3_setup/drhespa.j3.tar.gz /var/www/vhosts
sudo tar -zxvf /var/www/vhosts/drhespa.j3.tar.gz -C /var/www/vhosts

sudo cp /jgenerator3_setup/wrspblog.j3.tar.gz /var/www/vhosts
sudo tar -zxvf /var/www/vhosts/wrspblog.j3.tar.gz -C /var/www/vhosts

echo "Chowning /var/www/vhosts"
sudo chown -R vagrant:www-data /var/www/vhosts
sudo chmod -R 775 /var/www/vhosts

export PATH="$PATH:/jgenerator3_setup/.bin"

echo 'export PATH="$PATH:/jgenerator3_setup/.bin"' >> ~/.bashrc

source ~/.bashrc

sudo virtualhost create drhespa.j3 vhosts/drhespa.j3/
sudo virtualhost create wrspblog.j3 vhosts/wrspblog.j3/

#sudo a2ensite drhespa.j3.conf

sudo service apache2 reload

sudo chown -R vagrant:www-data /var/www/vhosts
sudo chmod -R 775 /var/www/vhosts
