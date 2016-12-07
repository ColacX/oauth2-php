echo Deleting contents of %DEPLOYMENT_TARGET%
del /q destination\*
for /d %x in (destination\*) do @rd /s /q "%x"

echo Copy Contents from %DEPLOYMENT_SOURCE% to %DEPLOYMENT_TARGET%
cp -a %DEPLOYMENT_SOURCE% %DEPLOYMENT_TARGET%

echo Downloading Composer
cd %DEPLOYMENT_TARGET%
curl -sS https://getcomposer.org/installer | php

echo Invoking composer install in directory %DEPLOYMENT_SOURCE%
cd %DEPLOYMENT_TARGET%
php -d extension=php_intl.dll composer.phar install -v --prefer-dist --no-dev --optimize-autoloader --no-interaction

echo %DEPLOYMENT_SOURCE%
dir %DEPLOYMENT_SOURCE%

echo %DEPLOYMENT_TARGET%
dir %DEPLOYMENT_TARGET%
