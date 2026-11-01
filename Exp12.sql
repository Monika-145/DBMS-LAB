1\. Database Schema (`schema.sql`)

```
CREATE TABLE IF NOT EXISTS customer (
    custid INTEGER PRIMARY KEY AUTOINCREMENT,
    cname TEXT NOT NULL,
    phone TEXT
);

CREATE TABLE IF NOT EXISTS account (
    accno INTEGER PRIMARY KEY,
    custid INTEGER NOT NULL REFERENCES customer(custid),
    balance REAL NOT NULL DEFAULT 0 CHECK (balance >= 0)
);

CREATE TABLE IF NOT EXISTS transactions (
    txnid INTEGER PRIMARY KEY AUTOINCREMENT,
    accno INTEGER NOT NULL REFERENCES account(accno),
    txntype TEXT NOT NULL CHECK (
        txntype IN ('OPEN', 'DEPOSIT', 'WITHDRAW')
    ),
    amount REAL NOT NULL CHECK (amount >= 0),
    balance_after REAL NOT NULL,
    txntime TEXT NOT NULL DEFAULT (datetime('now', 'localtime'))
);
```

2\. Python Program (`bank_app.py`)

The record's Python program uses:

- `sqlite3` for database connectivity.
- `Tkinter` for the graphical user interface.
- `BankDB` class for database operations.
- `BankApp` class for GUI operations.

Main operations included:

```
import os    def update(self, accno, cname, phone):        row = self.get(accno)        with self.conn:            self.conn.execute(                "UPDATE customer SET cname = ?, phone = ? WHERE custid = ?",                (cname.strip(), phone or None, row[1])            )    def delete(self, accno):        row = self.get(accno)        with self.conn:            self.conn.execute(                "DELETE FROM transactions WHERE accno = ?", (accno,)            )            self.conn.execute(                "DELETE FROM account WHERE accno = ?", (accno,)            )            self.conn.execute(                "DELETE FROM customer WHERE custid = ? "                "AND NOT EXISTS "                "(SELECT 1 FROM account WHERE custid = ?)",                (row[1], row[1])            )    def deposit(self, accno, amount):        return self._move(accno, amount, "DEPOSIT")    def withdraw(self, accno, amount):        return self._move(accno, amount, "WITHDRAW")    def _move(self, accno, amount, kind):        amount = round(amount, 2)        if amount <= 0:            raise BankError("Amount must be greater than zero.")        self.get(accno)        change = amount if kind == "DEPOSIT" else -amount        with self.conn:            cur = self.conn.execute(                "UPDATE account SET balance = ROUND(balance + ?, 2) "                "WHERE accno = ? AND balance + ? >= 0",                (change, accno, change)            )            if cur.rowcount == 0:                raise BankError("Insufficient balance.")            new_balance = self.conn.execute(                "SELECT balance FROM account WHERE accno = ?",                (accno,)            ).fetchone()[0]            self.conn.execute(                "INSERT INTO transactions "                "(accno, txntype, amount, balance_after) "
```

The original record continues with input-validation functions and the complete Tkinter GUI (`BankApp`) on pages 32–36.

### Output

1\. Insert Account

```
Record inserted successfully.
```

Account created with opening balance: Rs 10,000.00.

2\. Deposit Rs 2,000

```
Current balance is Rs 12000.00
```

3\. Withdraw Rs 3,000

```
Current balance is Rs 9000.00
```

4\. Transaction History

| Type     | Amount    | Balance After |
| -------- | --------- | ------------- |
| OPEN     | Rs 10,000 | Rs 10,000     |
| DEPOSIT  | Rs 2,000  | Rs 12,000     |
| WITHDRAW | Rs 3,000  | Rs 9,000      |

5\. Update Customer

```
Record updated successfully.
```

Customer name changed to `Akash Kumar`. Balance remains Rs 9,000.

6\. Withdraw Rs 20,000

```
Insufficient balance.
```

7\. Delete Account

```
Record deleted.
```

The account list becomes empty



