echo Downloading Composer
curl -sS https://getcomposer.org/installer | php

echo Invoking composer install in deployment directory $DEPLOYMENT_TARGET
php -d extension=php_intl.dll %DEPLOYMENT_TARGET%/composer.phar install -v --prefer-dist --no-dev --optimize-autoloader --no-interaction