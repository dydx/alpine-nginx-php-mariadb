## alpine-nginx-php-mariadb
A slightly opinionated minimal development environment for PHP/Laravel, built with:

* Alpine Linux
* Nginx 1.8.0
* PHP 5.6
* MariaDB 5.5

## Usage
* clone this repo: `git clone https://github.com/dydx/alpine-nginx-php-mariadb`
* cd in: `cd alpine-nginx-php-mariadb`
* build/run it: `docker-compose up -d`

## Connections
MariaDB is linked as `mysql`, just reference this in your database connection config. The credentials are identical to Laravel Homestead's:

* database: homestead
* username: homestead
* password: secret

## Running Artisan migrations and seeds
I'm still working on a more efficient way to do this, but currently, you have to do this to run artisan:

* attach to the nginx container: `docker exec -it alpinenginxphpmariadb_front_1 /bin/sh`
* cd to the web root: `cd /var/www/default`
* run your migrations/seeds: `php artisan migrate` or `php artisan db:seed`

## Data locations and persistence
MySQL is persisted to the host in the `database` directory, Nginx's default vhost is stored at `sites/default`, and your http docs are stored in `www/default`.

The setup is a little opinionated for Laravel development; the current Nginx vhost has `/var/www/default/public` as its doc root. You can obviously change this for your needs.

## size
I wanted these containers to be pretty small, considering that my main workstation is an Acer C720 with the 16Gb SSD (running Elementary OS). On my machine, here are the image virtual sizes:

* front: 70.05 MB
* mysql: 199.5 MB

I think this is considerably smaller than the setup I had with [kasperisager's](https://github.com/kasperisager) excellent [phpstack](https://github.com/kasperisager/phpstack). There isn't anything inherently wrong with his setup (it actually has a lot more features baked in), but it was cramping my laptop up quite a bit.

## TODO
I'm considering adding in Composer, PHPUnit, NodeJS/Gulp/Bower for doing *all* of the development related tasks in the nginx container, but I'm unsure just how necessary that is.
