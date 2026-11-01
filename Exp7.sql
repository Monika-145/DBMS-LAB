CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50)
);
```

Output:

```
Table created.
```

Insert Records:

```
INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (1, 'George', 'Orwell');

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (2, 'Aldous', 'Huxley');

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES (3, 'J.K.', 'Rowling');
```

Output:

```
3 rows created.
```

```
SELECT * FROM Authors;
```

Output:

| AuthorID | FirstName | LastName |
| -------- | --------- | -------- |
| 1        | George    | Orwell   |
| 2        | Aldous    | Huxley   |
| 3        | J.K.      | Rowling  |

### 2. Create Books Table

Program:

```
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR2(100),
    Genre VARCHAR2(50),
    PublicationYear INT
);
```

Output:

```
Table created.
```

Insert Records:

```
INSERT INTO Books
VALUES (1, '1984', 'Dystopian', 1949);

INSERT INTO Books
VALUES (2, 'Brave New World', 'Dystopian', 1932);

INSERT INTO Books
VALUES (3, 'Harry Potter and the Sorcerers Stone',
        'Fantasy', 1997);
```

Output:

```
3 rows created.
```

```
SELECT * FROM Books;
```

Output:

| BookID | Title                                | Genre     | PublicationYear |
| ------ | ------------------------------------ | --------- | --------------- |
| 1      | 1984                                 | Dystopian | 1949            |
| 2      | Brave New World                      | Dystopian | 1932            |
| 3      | Harry Potter and the Sorcerers Stone | Fantasy   | 1997            |

### 3. Create BookAuthors Table

Program:

```
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
```

Output:

```
Table created.
```

Insert Records:

```
INSERT INTO BookAuthors VALUES (1, 1);
INSERT INTO BookAuthors VALUES (2, 2);
INSERT INTO BookAuthors VALUES (3, 3);
```

Output:

```
3 rows created.
```

```
SELECT * FROM BookAuthors;
```

Output:

| BookID | AuthorID |
| ------ | -------- |
| 1      | 1        |
| 2      | 2        |
| 3      | 3        |

### 4. Create Borrowers Table

Program:

```
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    MembershipDate DATE
);
```

Output:

```
Table created.
```

Insert Records:

```
INSERT INTO Borrowers
VALUES (1, 'John', 'Doe',
TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO Borrowers
VALUES (2, 'Jane', 'Smith',
TO_DATE('2023-02-15', 'YYYY-MM-DD'));
```

Output:

```
2 rows created.
```

```
SELECT * FROM Borrowers;
```

Output:

| BorrowerID | FirstName | LastName | MembershipDate |
| ---------- | --------- | -------- | -------------- |
| 1          | John      | Doe      | 2023-01-01     |
| 2          | Jane      | Smith    | 2023-02-15     |

### 5. Create BorrowedBooks Table

Program:

```
CREATE TABLE BorrowedBooks (
    BorrowerID INT,
    BookID INT,
    BorrowedDate DATE,
    ReturnDate DATE,
    PRIMARY KEY (BorrowerID, BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
```

Output:

```
Table created.
```

Insert Records:

```
INSERT INTO BorrowedBooks
VALUES (1, 1,
TO_DATE('2023-03-01', 'YYYY-MM-DD'),
TO_DATE('2023-03-15', 'YYYY-MM-DD'));

INSERT INTO BorrowedBooks
VALUES (2, 3,
TO_DATE('2023-03-05', 'YYYY-MM-DD'),
TO_DATE('2023-03-20', 'YYYY-MM-DD'));
```

Output:

```
2 rows created.
```

```
SELECT * FROM BorrowedBooks;
```

Output:

| BorrowerID | BookID | BorrowedDate | ReturnDate |
| ---------- | ------ | ------------ | ---------- |
| 1          | 1      | 2023-03-01   | 2023-03-15 |
| 2          | 3      | 2023-03-05   | 2023-03-20 |
