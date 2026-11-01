SET SERVEROUTPUT ON;

DECLARE
    c_id customers.id%TYPE := 5;
    c_name customers.name%TYPE;
    c_addr customers.address%TYPE;
BEGIN
    SELECT name, address
    INTO c_name, c_addr
    FROM customers
    WHERE id = c_id;

    DBMS_OUTPUT.PUT_LINE('name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE('address: ' || c_addr);

EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('no such customer!');

    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('error!');
END;
/
```

Output:

```
name: Hardik
address: Bhopal

PL/SQL procedure successfully completed.
```

### 2. User-Defined Exception

Program:

```
DECLARE
    c_id customers.id%TYPE := &cc_id;
    c_name customers.name%TYPE;
    c_addr customers.address%TYPE;

    ex_invalid_id EXCEPTION;

BEGIN
    IF c_id <= 0 THEN
        RAISE ex_invalid_id;
    ELSE
        SELECT name, address
        INTO c_name, c_addr
        FROM customers
        WHERE id = c_id;

        DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
        DBMS_OUTPUT.PUT_LINE('Address: ' || c_addr);
    END IF;

EXCEPTION
    WHEN ex_invalid_id THEN
        DBMS_OUTPUT.PUT_LINE('ID must be greater than zero!');

    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('No such customer!');

    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('Error!');
END;
/
```

Output:

```
Enter value for cc_id: -6

ID must be greater than zero!

PL/SQL procedure successfully completed.
```
