To create database:

~$ psql -U `user` -d postgres -c "DROP DATABASE IF EXISTS laravel;" // drop existing database (if any)

~$ sudo -u postgres psql -c "CREATE DATABASE laravel OWNER `user`;" // create a new database

~$ php artisan migrate  // run laravel migrations

~$ psql -U `user` -d laravel -f database/data.sql // import initial data

It creates database with books and two users:

User: user@google.com user111
Admin: admin@google.com admin111