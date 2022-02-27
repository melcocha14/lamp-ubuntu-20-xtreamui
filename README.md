# lamp-ubuntu-20-xtreamui

Instalacion de LAMP mas PhpMyadmin mas Xtream ui panel para ubuntu 20

La instacion incluye 
Actualizacion de php a 7.4.27
Actualizacion de nginx 1.20.2 con ssl 3.0.1


La instalacion te pidira un usuario para phpmyadmin (no user root o ROOT)

Te pedira 2 contraseñas una para usuario de php y la otra contraseña root de mariadb

Puedes generar tus contraseñas desde esta web no uses el caracter & en el password Rl&FxUP3wcqZ

si lo usas te dara un error la instalacion del panel main

https://www.lastpass.com/es/features/password-generator

# Comandos de instalacion
Usaremos 4 comandos

sudo su

wget https://raw.githubusercontent.com/melcocha14/lamp-ubuntu-20-xtreamui/main/lamp-ubuntu20.sh

chmod +x lamp-ubuntu20.sh

./lamp-ubuntu20.sh



Cuando Termines de hacer la instalacion. usa este comando para instalar el panel de administracion


chattr -i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb && rm -rf /home/xtreamcodes/iptv_xtream_codes/admin && rm -rf /home/xtreamcodes/iptv_xtream_codes/pytools && wget "https://raw.githubusercontent.com/melcocha14/lamp-ubuntu-20-xtreamui/main/tools/release_22f.zip" -O /tmp/update.zip -o /dev/null && unzip /tmp/update.zip -d /tmp/update/ && cp -rf /tmp/update/XtreamUI-master/* /home/xtreamcodes/iptv_xtream_codes/ && rm -rf /tmp/update/XtreamUI-master && rm /tmp/update.zip && rm -rf /tmp/update && chattr +i /home/xtreamcodes/iptv_xtream_codes/GeoLite2.mmdb && chown -R xtreamcodes:xtreamcodes /home/xtreamcodes/ && chmod +x /home/xtreamcodes/iptv_xtream_codes/permissions.sh && /home/xtreamcodes/iptv_xtream_codes/permissions.sh && /home/xtreamcodes/iptv_xtream_codes/start_services.sh

Usuario y contraseña del panel de admiistracion xtream ui

usuario: admin

password: admin



# Comandos para instalar Balancer

sudo su

apt install python2

wget https://raw.githubusercontent.com/melcocha14/lamp-ubuntu-20-xtreamui/main/tools/install.py

python2 install.py

En el siguiente menu selecciona LB
