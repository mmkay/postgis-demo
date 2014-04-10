--setup script for postgres. Should be run first.

create database postgis_demo;
create user demo with password 'password';
grant all privileges on database postgis_demo to demo;
alter user demo with superuser;
