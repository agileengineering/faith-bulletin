# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Database Creation / Initalization
## Dependencies
* Have [PostGres](https://www.postgresql.org/) installed and running on your machine.
* create a PostGres user named "faith-bulletin"
* setup an environment variable "FAITH-BULLETIN_DATABASE_PASSWORD" with same password for postgres user.
* run rake db:create
* run rake db:migrate

### Window Setup Detials
After installing PostGres and utilities:
1.  Run pgAdmin III
2.  Login to the default database with password used at install
3.  Right-Click ServerGroups > Servers > PostgreSQL ... > Login Roles
4.  New Login Role
5.  Tab 1 Properties: Role Name = faith-bulletin
6.  Tab_2 Definition: Password = <your choice here>
7.  Tab_3 Role privileges: Superuser, Can create databases, Can create roles

Now update your environemnt variables so that FAITH-BULLETIN_DATABASE_PASSWORD matches the one you added in the pgAdmin tool.

