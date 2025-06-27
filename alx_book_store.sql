Database Name: alx_book_store

CREATE DATABASE IF NOT EXISTS alx_book_store;


CREATE TABLE Authors(
    author_id INT PRIMARY KEY AUTOINCREMENT,
    author_name VARCHAR(215)
    ;

CREATE TABLE Books(
    book_id INT AUTOINCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id  INT,
    price INT NOT NULL,
    publication_date DATE,
    FOREIGN KEY(author_id) REFERENCES authors(author_id)
    );

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY AUTOINCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT NOT NULL
    );

CREATE TABLE Orders(
    order_id INT PRIMARY KEY AUTOINCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );

CREATE TABLE Order_datails(
    order_detail_id INT PRIMARY KEY AUTOINCREMENT,
    order_id INT  FOREIGN KEY REFERENCES Orders(order_id),
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY(book_id) REFERENCES Books(book_id)
    );
