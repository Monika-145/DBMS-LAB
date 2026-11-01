CREATE KEYSPACE library
WITH REPLICATION = {
    'class': 'SimpleStrategy',
    'replication_factor': 3
};

-- Use Keyspace
USE library;

-- Create Table
CREATE TABLE authors (
    AuthorID int PRIMARY KEY,
    FirstName text,
    LastName text
);

-- Insert Records
INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (1, 'George', 'Orwell');

INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (2, 'Aldous', 'Huxley');

INSERT INTO authors (AuthorID, FirstName, LastName)
VALUES (3, 'J.K.', 'Rowling');

-- Display Records
SELECT * FROM authors;

-- Update Record
UPDATE authors
SET LastName = 'Smith'
WHERE AuthorID = 1;

-- Display Updated Record
SELECT * FROM authors
WHERE AuthorID = 1;

-- Delete Record
DELETE FROM authors
WHERE AuthorID = 1;

-- Display After Deletion
SELECT * FROM authors
WHERE AuthorID = 1;
```

### Output

1\. Create Keyspace

```
Keyspace created.
```

2\. Use Keyspace

```
Context switched to library.
```

3\. Create Table

```
Table created.
```

4\. Insert Records

```
3 rows inserted.
```

5\. Display Records

```
authorid    firstname    lastname
1           George       Orwell
2           Aldous       Huxley
3           J.K.         Rowling
```

6\. Update Record

```
authorid    firstname    lastname
1           George       Smith
```

7\. Delete Record and Display

```
(Empty result set)
```
