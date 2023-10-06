# PostgreSQL
Cheat Sheet for using postgresql in admin-role and user-role

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->
## Tables of Contens
- [Login (Require)](#login-require)
- [Postgres Command](#postgres-command)
- [User / Role](#user--role)
<!-- TOC end -->

## Best Practices
[What is DDL and DML](https://www.geeksforgeeks.org/difference-between-ddl-and-dml-in-dbms/)
1. Create custom database for app
2. Create custom schema for custom DB for app
3. Create DDL role
4. Create DML role
5. Revoke ALL on created custom DB from PUBLIC
6. Revoke create on schema PUBLIC into DB-ses postgres and created custom DB
7. Grant USAGE and CREATE on custom schema for DDL role
8. Grant only USAGE on custom schema for DML role
9. Create user with DDL role for DDL app operations(for flyway or liquibase migrations, creating/alter/drop entities etc.)
10. Create user with DML role for DML app operations(SELECT, INSERT, UPDATE, DELETE)
11. !Under DDL user! Alter default privileges in custom schema to DML role

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
### List all permision in table
```psql
\z <table_name>
```
or
```SQL
SELECT grantee, privilege_type, table_name
FROM information_schema.role_table_grants
WHERE grantee='<username>';
```
## Roles
### Default Commands
reference: https://www.postgresql.org/docs/current/database-roles.html
#### Create
```SQL
CREATE ROLE <role_name>;
```
#### Drop
```SQL
DROP ROLE <role_name>;
```
### Role Attributes
reference: https://www.postgresql.org/docs/current/role-attributes.html
#### Login Privilege
`CREATE USER` is equivalent to `CREATE ROLE` except that `CREATE USER` includes `LOGIN` by default, while `CREATE ROLE` does not.
```SQL
CREATE ROLE <role_name> LOGIN;
```
#### Superuser Status
*DO NOT USE, IF NOT NEEDS SUPER ADMIN PERMISSION*
```SQL
CREATE ROLE <role_name> SUPERUSER;
```
#### Database Creation
```SQL
CREATE ROLE <role_name> CREATEDB;
```
#### Role Creation
*DO NOT USE, IF NOT MANAGE ROLE PERMISSION*
```SQL
CREATE ROLE <role_name> CREATEROLE;
```

## User
### Create
for reference: https://www.postgresql.org/docs/current/ddl-priv.html
#### Create User
```SQL
CREATE USER <username> WITH ENCRYPTED PASSWORD <password>;
```
#### Grant Privileges Databases
```SQL
GRANT ALL ON DATABASE <db_name> TO <username>;
```
#### Grant Privileges Schemas
```SQL
GRANT ALL ON SCHEMA <schema_name> TO <username>;
```
#### Grant Privileges Tables
```SQL
GRANT ALL ON ALL TABLES IN SCHEMA <schema_name> TO <username>;
```
#### Grant Permission

### Drop/Revoke
#### Drop users
```SQL
DROP USER <username>;
```
#### Revoke Previleges
```SQL
REVOKE ALL ON ALL TABLES IN SCHEMA <schema_name> FROM <username>;
```
#### Drop Owned (when denied privileges)
```SQL
DROP OWNED by <username>;
```
### Update
#### Update password
```SQL
ALTER USER <username> LOGIN PASSWORD <new_password>;
```


## Databases
### Create
