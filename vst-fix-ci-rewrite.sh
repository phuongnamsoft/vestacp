#!/bin/bash

#fix codeigniter 3

cp /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter3.stpl /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter3-rewrite.stpl
cp /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter3.tpl /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter3-rewrite.tpl

sed -i "s#/index.php;#/index.php?\$args;#g" /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter3-rewrite.stpl
sed -i "s#/index.php;#/index.php?\$args;#g" /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter3-rewrite.tpl

#fix codeigniter 2

cp /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter2.stpl /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter2-rewrite.stpl
cp /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter2.tpl /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter2-rewrite.tpl

sed -i "s#/index.php;#/index.php?\$args;#g" /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter2-rewrite.stpl
sed -i "s#/index.php;#/index.php?\$args;#g" /usr/local/vesta/data/templates/web/nginx/php-fpm/codeigniter2-rewrite.tpl
