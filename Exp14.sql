CREATE TABLE employeepersonaldetails (
    id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    age INT NOT NULL,
    mobilenumber NUMBER(10) NOT NULL UNIQUE
);

INSERT INTO employeepersonaldetails VALUES (1, 'Ajay', 20, 9876543210);
INSERT INTO employeepersonaldetails VALUES (2, 'Brindha', 20, 9874563210);
INSERT INTO employeepersonaldetails VALUES (3, 'Kumaran', 20, 9673443210);

SELECT * FROM employeepersonaldetails;

COMMIT;

INSERT INTO employeepersonaldetails VALUES (4, 'Archana', 20, 9876543410);

SELECT * FROM employeepersonaldetails;

ROLLBACK;

SELECT * FROM employeepersonaldetails;

INSERT INTO employeepersonaldetails VALUES (5, 'Braham', 20, 9878953210);

SAVEPOINT a;

INSERT INTO employeepersonaldetails VALUES (6, 'Srimathi', 20, 9678953210);

SAVEPOINT b;

SELECT * FROM employeepersonaldetails;

ROLLBACK TO a;

SELECT * FROM employeepersonaldetails;

COMMIT;

CREATE TABLE account (
    accno INT PRIMARY KEY,
    cname VARCHAR(20),
    balance NUMBER(10,2)
);

INSERT INTO account VALUES (101, 'Ajay', 5000);
INSERT INTO account VALUES (102, 'Brindha', 3000);

COMMIT;

UPDATE account SET balance = balance - 1000 WHERE accno = 101;

SAVEPOINT debited;

UPDATE account SET balance = balance + 1000 WHERE accno = 102;

SELECT * FROM account;

ROLLBACK TO debited;

SELECT * FROM account;

ROLLBACK;

SELECT * FROM account;

CREATE USER student2 IDENTIFIED BY student2pwd;

GRANT CREATE SESSION TO student2;

CONNECT student2/student2pwd;

SELECT * FROM system.employeepersonaldetails;

CONNECT system/&&sys_pwd;

GRANT SELECT ON employeepersonaldetails TO student2;

SELECT grantee, table_name, privilege
FROM user_tab_privs_made
WHERE grantee = 'STUDENT2';

CONNECT student2/student2pwd;

SELECT * FROM system.employeepersonaldetails;
```

### Output

1\. Table creation and insertion

```
Table created.
3 rows created.
Commit complete.
1 row created.
```

2\. After inserting Archana

| ID | NAME    | AGE | MOBILE NUMBER |
| -- | ------- | --- | ------------- |
| 1  | Ajay    | 20  | 9876543210    |
| 2  | Brindha | 20  | 9874563210    |
| 3  | Kumaran | 20  | 9673443210    |
| 4  | Archana | 20  | 9876543410    |

3\. After ROLLBACK

```
Rollback complete.
```

| ID | NAME    | AGE | MOBILE NUMBER |
| -- | ------- | --- | ------------- |
| 1  | Ajay    | 20  | 9876543210    |
| 2  | Brindha | 20  | 9874563210    |
| 3  | Kumaran | 20  | 9673443210    |

4\. After SAVEPOINT and ROLLBACK TO a

| ID | NAME    | AGE | MOBILE NUMBER |
| -- | ------- | --- | ------------- |
| 1  | Ajay    | 20  | 9876543210    |
| 2  | Brindha | 20  | 9874563210    |
| 3  | Kumaran | 20  | 9673443210    |
| 5  | Braham  | 20  | 9878953210    |

5\. Account transaction output

| ACCNO | CNAME   | BALANCE |
| ----- | ------- | ------- |
| 101   | Ajay    | 4000    |
| 102   | Brindha | 4000    |

After `ROLLBACK TO debited`:

| ACCNO | CNAME   | BALANCE |
| ----- | ------- | ------- |
| 101   | Ajay    | 4000    |
| 102   | Brindha | 3000    |

After `ROLLBACK`:

| ACCNO | CNAME   | BALANCE |
| ----- | ------- | ------- |
| 101   | Ajay    | 5000    |
| 102   | Brindha | 3000    |

6\. User creation and privileges

```
User created.
Grant succeeded.
Connected.

ERROR at line 1:
ORA-00942: table or view does not exist

Grant succeeded.
```

Privilege verification:

| GRANTEE  | TABLE_NAME              | PRIVILEGE |
| -------- | ----------------------- | --------- |
| STUDENT2 | EMPLOYEEPERSONALDETAILS | SELECT    |

Final output after granting SELECT permission:

| ID | NAME    | AGE | MOBILE NUMBER |
| -- | ------- | --- | ------------- |
| 1  | Ajay    | 20  | 9876543210    |
| 2  | Brindha | 20  | 9874563210    |
| 3  | Kumaran | 20  | 9673443210    |
| 5  | Braham  | 20  | 9878953210    |


