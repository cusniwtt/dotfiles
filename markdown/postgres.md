# PostgreSQL
Cheat Sheet for using postgresql in admin-role and user-role

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->
## Tables of Contens
- [Best Practices](#best-practices)
- [Login (Require)](#login-require)
- [Postgres Command](#postgres-command)
- [Role](#roles)
- [User](#user)
<!-- TOC end -->

## Best Practices Method 1 (Dev+Read)
[What is DDL and DML](https://www.geeksforgeeks.org/difference-between-ddl-and-dml-in-dbms/) The DDL and DML will common if you have 3 tier user. (Multi-Admin [as DDL], Multi-Write [as DML], Multi-Read [as DML]). 
### Initializing Database and Schema
1. Create custom database for app
```sql
/* Create database */
CREATE DATABASE <db_name>;

/* For Security purpose. Revoke all privileges from PUBLIC */
REVOKE ALL ON DATABASE <db_name> FROM PUBLIC;

REVOKE CREATE ON SCHEMA public FROM PUBLIC;
```
2. Create custom schema for custom DB. (Dont use `public` is possible.)
```sql
CREATE SCHEMA <schema_name>;
```
### Initializing Role and Group Role
3. Create DDL role.
```sql
/* Create Role */
CREATE ROLE <ddl_role> WITH NOLOGIN;

/* Grant Connection to Role */
GRANT CONNECT ON DATABASE <db_name> TO <ddl_role>;

GRANT TEMPORARY ON DATABASE <db_name> TO <ddl_role>;
```
4. Create DML-Write role
```sql
CREATE ROLE <dml_write_role> WITH NOLOGIN;

/* Grant Connection to Role */
GRANT CONNECT ON DATABASE <db_name> TO <dml_write_role>;

GRANT TEMPORARY ON DATABASE <db_name> TO <dml_write_role>;
```
5. Create DML-Read role
```sql
CREATE ROLE <dml_read_role> WITH NOLOGIN;

/* Grant Connection to Role */
GRANT CONNECT ON DATABASE <db_name> TO <dml_read_role>;

GRANT TEMPORARY ON DATABASE <db_name> TO <dml_read_role>;
```
### Initailizing Grant Privileges
6. Grant USAGE and CREATE on custom schema for DDL role
```sql
GRANT USAGE, CREATE ON SCHEMA <schema_name> TO <ddl_role>;
```
6. Grant only USAGE on custom schema for DML role
```sql
/* If 3 tier, Do not assign CREATE */
GRANT USAGE ON SCHEMA <schema_name> TO <dml_write_role>;

/* assign USAGE only to DML_read */
GRANT USAGE ON SCHEMA <schema_name> TO <dml_read_role>;
```
7. Create user with DDL role for DDL app operations(for flyway or liquibase migrations, creating/alter/drop entities etc.)
```sql
CREATE USER flywayuser WITH ENCRYPTED PASSWORD 'PWDPWD';
GRANT <ddl_role> TO flywayuser;
```
8. Create user with DML role for DML app operations such as, SELECT(read), INSERT(write), UPDATE(write), DELETE(write)
```sql
/* for write */
CREATE USER appuser_write WITH ENCRYPTED PASSWORD 'PWDPWD';
GRANT <dml_write_role> to appuser_write;

/* for read */
CREATE USER appuser_read WITH ENCRYPTED PASSWORD 'PWDPWD';
GRANT <dml_read_role> to appuser_read;
```
9. **!Under DDL user!** Alter default privileges in custom schema to DML role
```sql
SET ROLE <ddl_role>;

ALTER DEFAULT PRIVILEGES IN SCHEMA <schema_name> FOR ROLE <ddl_role>
    GRANT INSERT, UPDATE, DELETE ON TABLES TO <dml_write>;

ALTER DEFAULT PRIVILEGES IN SCHEMA <schema_name> FOR ROLE <ddl_role>
    GRANT SELECT ON TABLES TO <dml_read>;
```

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
\dt <schema_name>.* (for all tables in schema)
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
