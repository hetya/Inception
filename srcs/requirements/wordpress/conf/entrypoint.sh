#!/bin/bash
wp core download --allow-root

if [ ! -f /wp-config.php ]
then
wp config create --allow-root --dbhost=mariadb --dbname=${MYSQL_DATABASE_NAME} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define('WP_HOME','https://hetya.42.fr');
define('WP_SITEURL','https://hetya.42.fr');
PHP

wp core install --allow-root --url="${DOMAIN_NAME}" --title="Inception" --admin_user="${WORDPRESS_ROOT_USER}" --admin_password="${WORDPRESS_ROOT_PASSWORD}" --admin_email="votre@email.com"
wp user create ${WORDPRESS_USER} lol@email.com --user_pass=${WORDPRESS_PASSWORD} --allow-root
wp theme install twentytwentythree --activate --allow-root
fi

exec "$@"