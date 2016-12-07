echo Downloading Composer
curl -sS https://getcomposer.org/installer | php

echo Invoking composer install in deployment directory $DEPLOYMENT_TARGET
php -d extension=php_intl.dll %DEPLOYMENT_TARGET%/oauth2-client-1.4.2/composer.json install -v --prefer-dist --no-dev --optimize-autoloader --no-interaction
