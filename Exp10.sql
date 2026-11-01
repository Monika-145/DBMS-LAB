use library;

// Insert Authors
db.authors.insertMany([
  { "AuthorID": 1, "FirstName": "George", "LastName": "Orwell" },
  { "AuthorID": 2, "FirstName": "Aldous", "LastName": "Huxley" },
  { "AuthorID": 3, "FirstName": "J.K.", "LastName": "Rowling" }
]);

// Insert Books
db.books.insertMany([
  { "BookID": 1, "Title": "1984", "Genre": "Dystopian", "PublicationYear": 1949, "Authors": [1] },
  { "BookID": 2, "Title": "Brave New World", "Genre": "Dystopian", "PublicationYear": 1932, "Authors": [2] },
  { "BookID": 3, "Title": "Harry Potter and the Sorcerer's Stone", "Genre": "Fantasy", "PublicationYear": 1997, "Authors": [3] }
]);

// Insert Borrowers
db.borrowers.insertMany([
  { "BorrowerID": 1, "FirstName": "John", "LastName": "Doe", "MembershipDate": new Date("2023-01-01") },
  { "BorrowerID": 2, "FirstName": "Jane", "LastName": "Smith", "MembershipDate": new Date("2023-02-15") }
]);

// Insert Borrowed Books
db.borrowedBooks.insertMany([
  { "BorrowerID": 1, "BookID": 1, "BorrowedDate": new Date("2023-03-01"), "ReturnDate": new Date("2023-03-15") },
  { "BorrowerID": 2, "BookID": 3, "BorrowedDate": new Date("2023-03-05"), "ReturnDate": new Date("2023-03-20") }
]);

// Update Author
db.authors.updateOne(
  { "AuthorID": 1 },
  { $set: { "LastName": "Smith" } }
);

// Display Authors
db.authors.find().pretty();

// Delete Author
db.authors.deleteOne({ "AuthorID": 1 });

// Display Authors
db.authors.find().pretty();
```

### Output

1\. Authors Insertion

```
{ "acknowledged": true, "insertedIds": [1, 2, 3] }
```

2\. Books Insertion

```
{ "acknowledged": true, "insertedIds": [1, 2, 3] }
```

3\. Borrowers Insertion

```
{ "acknowledged": true, "insertedIds": [1, 2] }
```

4\. Borrowed Books Insertion

```
{ "acknowledged": true, "insertedIds": [1, 2] }
```

5\. Update Author

```
{ "acknowledged": true, "matchedCount": 1, "modifiedCount": 1 }
```

6\. Display Authors

```
{ "AuthorID": 1, "FirstName": "George", "LastName": "Smith" }
{ "AuthorID": 2, "FirstName": "Aldous", "LastName": "Huxley" }
{ "AuthorID": 3, "FirstName": "J.K.", "LastName": "Rowling" }
```

7\. Delete Author

```
{ "acknowledged": true, "deletedCount": 1 }
```

8\. Display Authors After Deletion

```
{ "AuthorID": 2, "FirstName": "Aldous", "LastName": "Huxley" }
{ "AuthorID": 3, "FirstName": "J.K.", "LastName": "Rowling" }
```
