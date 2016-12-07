echo Deleting contents of %DEPLOYMENT_TARGET%
cd %DEPLOYMENT_TARGET%
del * /S /Q

echo Copy Contents from %DEPLOYMENT_SOURCE% to %DEPLOYMENT_TARGET%
xcopy /s %DEPLOYMENT_SOURCE% %DEPLOYMENT_TARGET%

echo Downloading Composer
cd %DEPLOYMENT_TARGET%
curl -sS https://getcomposer.org/installer | php

echo Invoking composer install in directory %DEPLOYMENT_SOURCE%
cd %DEPLOYMENT_TARGET%
php -d extension=php_intl.dll composer.phar install -v --prefer-dist --no-dev --optimize-autoloader --no-interaction

echo Contents of directory %DEPLOYMENT_SOURCE%
dir %DEPLOYMENT_SOURCE%

echo Contents of directory %DEPLOYMENT_TARGET%
dir %DEPLOYMENT_TARGET%
