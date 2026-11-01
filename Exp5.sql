
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE Sum_Proc(
    a IN NUMBER,
    b IN NUMBER
) IS
    c NUMBER;
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Sum of two nos = ' || c);
END Sum_Proc;
/
```

Output:

```
Procedure created.
```

Execution:

```
DECLARE
    x NUMBER;
    y NUMBER;
BEGIN
    x := &x;
    y := &y;
    Sum_Proc(x, y);
END;
/
```

Output:

```
Enter value for x: 10
Enter value for y: 20

Sum of two nos = 30

PL/SQL procedure successfully completed.
```

### 2. Function

Program:

```
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION Sum_Func(
    a IN NUMBER,
    b IN NUMBER
)
RETURN NUMBER IS
    c NUMBER;
BEGIN
    c := a + b;
    RETURN c;
END Sum_Func;
/
```

Output:

```
Function created.
```

Execution:

```
DECLARE
    no1 NUMBER;
    no2 NUMBER;
    result NUMBER;
BEGIN
    no1 := &no1;
    no2 := &no2;

    result := Sum_Func(no1, no2);

    DBMS_OUTPUT.PUT_LINE('Sum of two nos = ' || result);
END;
/
```

Output:

```
Enter value for no1: 5
Enter value for no2: 5

Sum of two nos = 10

PL/SQL procedure successfully completed.
```
