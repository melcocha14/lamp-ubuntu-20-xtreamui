#!/bin/bash
echo " "
jeshile='\e[40;38;5;82m'
jo='\e[0m'
os=$(exec uname -m|grep 64)
if [ "$os" = "" ]
then os="x86"
else os="x64"
fi

DIRE=$(hostname -I)
DIREMODE=$(expr "$DIRE" : '\(.*\).')

echo  "${jeshile} +-----------------------------+ \e[0m"
echo  "${jeshile} ¦Revisando Version del sistema¦ \e[0m"
echo  "${jeshile} +-----------------------------+ \e[0m"
sleep "5"

echo  "${jeshile} +------------------------------+ \e[0m"
echo  "${jeshile} ¦Sistema de $os Bits Detecatado¦ \e[0m"
echo  "${jeshile} +------------------------------+ \e[0m"
sleep "5"

echo  "${jeshile} +--------------------------------+ \e[0m"
echo  "${jeshile} ¦   Prerequisitos para instalar  ¦ \e[0m"
echo  "${jeshile} ¦       LAMP y Panel admin       ¦ \e[0m"
echo  "${jeshile} ¦                                ¦ \e[0m"
echo  "${jeshile} ¦  1 Usuario admin de MYSQL      ¦ \e[0m"
echo  "${jeshile} ¦  2 Contraseña admin de MySql   ¦ \e[0m"
echo  "${jeshile} ¦  3 Contraseña root de MySql    ¦ \e[0m"
echo  "${jeshile} +--------------------------------+ \e[0m"
echo ""
echo ""
sleep "8"




echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦    Escribe un usuario     ¦ \e[0m"
echo  "${jeshile} ¦      para MYSQL           ¦ \e[0m"
echo  "${jeshile} ¦                           ¦ \e[0m"
echo  "${jeshile} ¦    NOTA NO USES ROOT      ¦ \e[0m"
echo  "${jeshile} ¦                           ¦ \e[0m"
echo  "${jeshile} ¦    ejemplo: admin         ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep "3"

read USERMYSQL
echo "Tu Usuario de administrador para Mysql es: $USERMYSQL"
echo ""


echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo  "${jeshile} ¦     admin para Mysql      ¦ \e[0m"
echo  "${jeshile} ¦                           ¦ \e[0m"
echo  "${jeshile} ¦ Usa una contraseña segura ¦ \e[0m"
echo  "${jeshile} ¦ que contenga numeros      ¦ \e[0m"
echo  "${jeshile} ¦ mayusculas minusculas     ¦ \e[0m"
echo  "${jeshile} ¦ caracteres especiales     ¦ \e[0m"
echo  "${jeshile} ¦ de diez digitos           ¦ \e[0m"
echo  "${jeshile} ¦ ejemplo AdmiN2@9#h        ¦ \e[0m"
echo  "${jeshile} ¦                           ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep "3"

read CONTRAMYSQLADMIN
echo "Tu Contraseña de administrador para Mysql es: $CONTRAMYSQLADMIN"
echo ""



echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦  Escribe la contraseña    ¦ \e[0m"
echo  "${jeshile} ¦      root para Mysql      ¦ \e[0m"
echo  "${jeshile} ¦                           ¦ \e[0m"
echo  "${jeshile} ¦ Usa una contraseña segura ¦ \e[0m"
echo  "${jeshile} ¦ que contenga numeros      ¦ \e[0m"
echo  "${jeshile} ¦ mayusculas minusculas     ¦ \e[0m"
echo  "${jeshile} ¦ caracteres especiales     ¦ \e[0m"
echo  "${jeshile} ¦ de diez digitos           ¦ \e[0m"
echo  "${jeshile} ¦ ejemplo RooT12@9#hX       ¦ \e[0m"
echo  "${jeshile} ¦                           ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep "3"

read CONTRAMYSQLROOT
echo "Tu Contraseña de Mysql Root  es: $CONTRAMYSQLROOT"
echo ""



echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦  Actulizando el sisteama  ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep "5"

sudo apt update -y


echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦     Instalando Apache     ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep "5"

sudo apt install apache2 -y


echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦    Habilitando Apache     ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep "5"

sudo ufw allow in "Apache"
sudo ufw allow in "Apache Full"


echo  "${jeshile} +---------------------------------------+ \e[0m"
echo  "${jeshile} ¦    Agregando repositorios MariaDb     ¦ \e[0m"
echo  "${jeshile} +---------------------------------------+ \e[0m"
sleep "5"

sudo apt -y install software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64] http://mariadb.mirror.globo.tech/repo/10.5/ubuntu focal main'
sudo apt update

echo  "${jeshile} +---------------------------------------+ \e[0m"
echo  "${jeshile} ¦    Instalando servidor MariaDb        ¦ \e[0m"
echo  "${jeshile} +---------------------------------------+ \e[0m"
sleep "5"
sudo apt install mariadb-server mariadb-client



echo ""
echo  "${jeshile} +-----------------------------------------------------------------+ \e[0m"
echo  "${jeshile} ¦    Configurando seguridad MariaDb                               ¦ \e[0m"
echo  "${jeshile} ¦    Tu contraseña de Mysql es $CONTRAMYSQLROOT                   ¦ \e[0m"
echo  "${jeshile} ¦                                                                 ¦ \e[0m"
echo  "${jeshile} ¦    Enter password for user root:  Pon tu contraseña             ¦ \e[0m"
echo  "${jeshile} ¦                                                                 ¦ \e[0m"
echo  "${jeshile} ¦           ***  Cuando te pregunte ***                           ¦ \e[0m"
echo  "${jeshile} ¦                                                                 ¦ \e[0m"
echo  "${jeshile} ¦   Switch to unix_socket authentication [Y/n]        Presiona n  ¦ \e[0m"
echo  "${jeshile} ¦                                                                 ¦ \e[0m"
echo  "${jeshile} ¦   Change the root password? [Y/n]                   Presiona n  ¦ \e[0m"
echo  "${jeshile} ¦   Remove anonymous users? [Y/n]                     Presiona y  ¦ \e[0m"
echo  "${jeshile} ¦   Disallow root login remotely? [Y/n]               Presiona Y  ¦ \e[0m"
echo  "${jeshile} ¦   Remove test database and access to it? [Y/n]      Presiona Y  ¦ \e[0m"
echo  "${jeshile} ¦   Reload privilege tables now? [Y/n]                Presiona Y  ¦ \e[0m"
echo  "${jeshile} ¦                                                                 ¦ \e[0m"
echo  "${jeshile} ¦                                                                 ¦ \e[0m"
echo  "${jeshile} +-----------------------------------------------------------------+ \e[0m"
echo ""
sleep "5"
mysql_secure_installation


echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦    Instalando Php 7.4     ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep "5"
sudo apt install php-mbstring php-zip php-gd php-json php-curl -y


echo " "
echo  "${jeshile} +---------------------------------------------------------------+ \e[0m"
echo  "${jeshile} ¦                                                               ¦ \e[0m"
echo  "${jeshile} ¦     Configurando Usuario de MYSQL y creando base de datos     ¦ \e[0m"
echo  "${jeshile} ¦                                                               ¦ \e[0m"
echo  "${jeshile} +---------------------------------------------------------------+ \e[0m"
echo " "
sleep "3"
mysql --user=root --password=$CONTRAMYSQLROOT -e "CREATE USER '$USERMYSQL'@'localhost' IDENTIFIED BY '$CONTRAMYSQLADMIN';"
mysql --user=root --password=$CONTRAMYSQLROOT -e "GRANT ALL PRIVILEGES ON *.* TO '$USERMYSQL'@'localhost' WITH GRANT OPTION;"
mysql --user=root --password=$CONTRAMYSQLROOT -e "FLUSH PRIVILEGES;"





echo " "
echo  "${jeshile} +--------------------------------+ \e[0m"
echo  "${jeshile} ¦                                ¦ \e[0m"
echo  "${jeshile} ¦     Instalando phpmyadmin      ¦ \e[0m"
echo  "${jeshile} ¦                                ¦ \e[0m"
echo  "${jeshile} +--------------------------------+ \e[0m"
echo " "
sleep "3"
apt install phpmyadmin -y





echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦    Reiniciando Apache     ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo service apache2 restart


echo  "${jeshile} +---------------------------+ \e[0m"
echo  "${jeshile} ¦   Instalando Python2      ¦ \e[0m"
echo  "${jeshile} +---------------------------+ \e[0m"
sleep 3
sudo apt-get install python2 -y


sudo wget https://raw.githubusercontent.com/melcocha14/lamp-ubuntu-20-xtreamui/main/tools/install.py


echo " "
echo  "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo  "${jeshile} ¦      Creditos y soporte melcocha14@gmail.com             ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦      Tus Datos de Acceso son:                            ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦      Datos acceso de PhpMyadmin                          ¦ \e[0m"
echo  "${jeshile} ¦      Usuario: 	$USERMYSQL                             ¦ \e[0m"
echo  "${jeshile} ¦      Contraseña: 	$CONTRAMYSQLADMIN                      ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦      Link de acceso Phpmyadmin                           ¦ \e[0m"
echo  "${jeshile} ¦      http://$DIREMODE/phpmyadmin                         ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦      Datos de acceso Mysql                               ¦ \e[0m"
echo  "${jeshile} ¦      Usuario: 	root                                   ¦ \e[0m"
echo  "${jeshile} ¦      Contraseña: 	$CONTRAMYSQLROOT                       ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦      Guarda tus Datos en un lugar seguro                 ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} ¦      Escribe el siguiente comando y escribe MAIN         ¦ \e[0m"
echo  "${jeshile} ¦      python2 install.py                                  ¦ \e[0m"
echo  "${jeshile} ¦                                                          ¦ \e[0m"
echo  "${jeshile} +-----------------------------------------------------------+ \e[0m"
echo " "
sleep 3