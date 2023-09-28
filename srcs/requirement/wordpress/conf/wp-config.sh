chmod +x /usr/local/bin/wp
mkdir -p /42website

# if [ ! -d $WPPATH ]; then
  wp core download --path=$WPPATH --allow-root ;
  wp config create --path=$WPPATH --allow-root --force --dbhost=$DBHOST --dbname=$DBNAME --dbuser=$DBUSR --dbpass=$DBUSRPSSWD
  wp core install --path=$WPPATH --allow-root --url=$DOMAIN --title="$WPTITLE" --admin_user=$WPADM --admin_password=$WPADMPSSWD --admin_email=$WPMAIL
  wp user create --path=$WPPATH --allow-root $WPUSR $WPUSRMAIL --user_pass=$WPUSRPSSWD
# else
#   echo "WordPress installation already exists at $WPPATH. Skipping installation."
# fi

php-fpm7.3 -F
