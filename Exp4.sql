CREATE TABLE customers (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    age NUMBER,
    address VARCHAR2(50),
    salary NUMBER(10,2)
);

INSERT INTO customers VALUES (1, 'Ramesh', 32, 'Ahmadabad', 2000.00);
INSERT INTO customers VALUES (2, 'Khilan', 25, 'Delhi', 1500.00);
INSERT INTO customers VALUES (3, 'Kaushik', 23, 'Kota', 2000.00);
INSERT INTO customers VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00);
INSERT INTO customers VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00);
INSERT INTO customers VALUES (6, 'Komal', 22, 'MP', 4500.00);

SET SERVEROUTPUT ON;

DECLARE
    total_rows NUMBER(2);
BEGIN
    UPDATE customers
    SET salary = salary + 500;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('no customers selected');
    ELSIF SQL%FOUND THEN
        total_rows := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE(total_rows || ' customers selected');
    END IF;
END;
/

  OUTPUT
  
6 customers selected

PL/SQL procedure successfully completed.

SELECT * FROM customers;

OUTPUT

ID	NAME	AGE	ADDRESS	SALARY
1	Ramesh	32	Ahmadabad	2500.00
2	Khilan	25	Delhi	2000.00
3	Kaushik	23	Kota	2500.00
4	Chaitali	25	Mumbai	7000.00
5	Hardik	27	Bhopal	9000.00
6	Komal	22	MP	5000.00

DECLARE
    c_id customers.id%TYPE;
    c_name customers.name%TYPE;
    c_addr customers.address%TYPE;

    CURSOR c_customers IS
        SELECT id, name, address FROM customers;

BEGIN
    OPEN c_customers;

    LOOP
        FETCH c_customers INTO c_id, c_name, c_addr;

        EXIT WHEN c_customers%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            c_id || ' ' || c_name || ' ' || c_addr
        );
    END LOOP;

    CLOSE c_customers;
END;
/

ID	NAME	ADDRESS
1	Ramesh	Ahmadabad
2	Khilan	Delhi
3	Kaushik	Kota
4	Chaitali	Mumbai
5	Hardik	Bhopal
6	Komal	MP
