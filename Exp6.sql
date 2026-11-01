1\. Create Customer Table

```
CREATE TABLE customer (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(30),
    salary NUMBER
);
```

Output:

```
Table created.
```

2\. Insert Records

```
INSERT INTO customer VALUES (1, 'Aarthi', 300);
INSERT INTO customer VALUES (2, 'Ramya', 500);
INSERT INTO customer VALUES (3, 'Sakthi', 670);
```

Output:

```
3 rows created.
```

### 3. BEFORE UPDATE Trigger

```
CREATE OR REPLACE TRIGGER up_classd
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('new value is ' || :new.salary);
    DBMS_OUTPUT.PUT_LINE('old value is ' || :old.salary);
END;
/
```

Output:

```
Trigger created.
```

```
UPDATE customer SET salary = 500 WHERE sid = 1;
```

Output:

```
new value is 500
old value is 300
1 row updated.
```

```
SELECT * FROM customer;
```

Output:

| SID | SNAME  | SALARY |
| --- | ------ | ------ |
| 1   | Aarthi | 500    |
| 2   | Ramya  | 500    |
| 3   | Sakthi | 670    |

### 4. BEFORE DELETE Trigger

```
CREATE OR REPLACE TRIGGER del_classb
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('row deleted');
END;
/
```

Output:

```
Trigger created.
```

```
DELETE FROM customer WHERE sid = 1;
```

Output:

```
row deleted
1 row deleted.
```

```
SELECT * FROM customer;
```

Output:

| SID | SNAME  | SALARY |
| --- | ------ | ------ |
| 2   | Ramya  | 500    |
| 3   | Sakthi | 670    |

### 5. Create Classb Table

```
CREATE TABLE classb (
    sid NUMBER,
    sname VARCHAR2(20),
    dept VARCHAR2(10),
    stotal NUMBER,
    grade VARCHAR2(2)
);
```

Output:

```
Table created.
```

### 6. BEFORE INSERT Trigger

```
CREATE OR REPLACE TRIGGER ins_classb
BEFORE INSERT ON classb
FOR EACH ROW
DECLARE
    InvTot EXCEPTION;
BEGIN
    IF :new.stotal > 1000 THEN
        RAISE InvTot;
    END IF;
EXCEPTION
    WHEN InvTot THEN
        RAISE_APPLICATION_ERROR(-20000, 'Total not valid');
END;
/
```

Output:

```
Trigger created.
```

Valid Insert:

```
INSERT INTO classb VALUES (5, 'vino', 'it', 500, 'a');
```

Output:

```
1 row created.
```

Invalid Insert:

```
INSERT INTO classb VALUES (6, 'jana', 'it', 2000, 'a');
```

Output:

```
ERROR at line 1:
ORA-20000: Total not valid
ORA-06512: at "SCOTT.INS_CLASSB", line 11
ORA-04088: error during execution of trigger 'SCOTT.INS_CLASSB'
```
