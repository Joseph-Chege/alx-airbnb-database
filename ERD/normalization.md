# Normalization procedure

## First Normal Form (1NF)
To achieve a normalization of 1NF, multi-valued attributes are removed by splitting them into separate rows
A primary key is also assigned to uniquely identify each record

## Second Normal form (2NF)
To achieve a normalization of 2NF, 1NF should already be achieved and partial dependency should be elmininated and only applies if the table has a composite primary key
All non-key attributes should depend on tyhe whole primary key and not just part of it
If a non-key attribute depends only on part of a composite key, move it to a separate table

## Third Normal form (3NF)
To achieve a normalization of 3NF, 2NF should already be achieved and non-key attributes should depend only on the primary key and not on other non-key attributes
If a non-key attribute depends on another non-key attribute, separate it into another table



