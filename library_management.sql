-- Creating a new schema
CREATE SCHEMA library_management_system;

-- Use the new Schema
USE library_management_system;

-- Authors Table
CREATE TABLE authors(
	author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(50) NOT NULL
);

-- Books Table
CREATE TABLE books(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    publication_year INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
    );
    
-- Borrowers Table
CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    borrower_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(15)
);

-- Book Loans Table
CREATE TABLE book_loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    borrower_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id)
);

-- Create a table to store log events
CREATE TABLE IF NOT EXISTS log_tables(
	log_id INT AUTO_INCREMENT PRIMARY KEY,
	event_description VARCHAR(255),
	event_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a trigger to log book borrowings
DELIMITER //
CREATE TRIGGER after_borrow_book
AFTER INSERT ON book_loans
FOR EACH ROW
BEGIN
    INSERT INTO log_table (event_description)
    VALUES ('Book borrowed - Book ID: ' || NEW.book_id || ', Borrower ID: ' || NEW.borrower_id);
END //
DELIMITER ;

-- Create a trigger to log book returns
DELIMITER //
CREATE TRIGGER after_return_book
AFTER UPDATE ON book_loans
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL THEN
        INSERT INTO log_table (event_description)
        VALUES ('Book returned - Book ID: ' || NEW.book_id || ', Borrower ID: ' || NEW.borrower_id);
    END IF;
END //
DELIMITER ;

-- Drop the existing after_borrow_book trigger
DROP TRIGGER IF EXISTS after_borrow_book;

-- Recreate the after_borrow_book trigger with CONCAT for string concatenation
DELIMITER //
CREATE TRIGGER after_borrow_book
AFTER INSERT ON book_loans
FOR EACH ROW
BEGIN
    INSERT INTO log_table (event_description)
    VALUES (CONCAT('Book borrowed - Book ID: ', NEW.book_id, ', Borrower ID: ', NEW.borrower_id));
END //
DELIMITER ;

-- Borrow a book (assuming you know the book_id and borrower_id)
-- Adjust the values based on your actual data
INSERT INTO book_loans (book_id, borrower_id, loan_date, return_date)
VALUES (2, 10, CURRENT_DATE, NULL);

-- Check the log entries
SELECT * FROM log_table;
