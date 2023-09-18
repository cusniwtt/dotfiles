# PostgreSQL
Cheat Sheet for using postgresql in admin-role and user-role

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->
## Tables of Contens
- [Login (Require)](#login-require)
- [Postgres Command](#postgres-command)
- [User / Role](#user--role)
<!-- TOC end -->

## Login (Require)
Login for super admin
```bash
sudo -u postgres psql
```
## Postgres Command
### Connect database
```psql
\c <dbname>;
```
### Quit psql
```psql
\q
```
### List all database
```psql
\l
```
### List all schemas
```psql
\dn
```
### List all functions
```psql
\df
```
### List all views
```psql
\dv
```
### List all tables (connected database)
```psql
\dt
\dt+ (for detail)
```
### List all users
```psql
\du
```

## User / Role
### Create
```SQL
CREATE ROLE <username> WITH ENCRYPTED PASSWORD <password>;
```
### Grant Privileges
```SQL
GRANT ALL PRIVILEGES ON DATABASE <dbname> TO <username>;
```