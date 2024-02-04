# Library Management System

## Overview
The Library Management System is a database project designed to manage and organize information related to books, authors, borrowers, and book loans in a library. The project is implemented using MySQL as the database management system and MySQL Workbench as the development environment.

## Database Schema
The project consists of the following tables:

- **authors**: Stores information about authors.
- **books**: Contains details about books, including title, genre, publication year, and author.
- **borrowers**: Manages borrower information, including name, email, and phone number.
- **book_loans**: Records book loan transactions, including loan and return dates.
- **log_table**: A table to log events related to book borrowings and returns.

## Features
The Library Management System provides the following functionalities:

1. **Book Borrowing and Returning:** Allows users to borrow and return books, updating the `book_loans` table and logging events in the `log_table`.

2. **Log Events:** Utilizes triggers to log events such as book borrowings and returns in the `log_table`.

3. **Search and Availability:** Supports searching for books based on various criteria and checking the availability status of a book.

4. **View Borrowed Books:** Provides a view to list borrowed books, including due dates.

5. **Overdue Books:** Offers a feature to list overdue books.

## Setup and Usage
1. **Database Creation:**
   - Import the SQL script provided in the project to create the necessary tables.

2. **Configuration:**
   - Modify the database connection parameters in the project files if necessary.

3. **Run Queries:**
   - Use MySQL Workbench or any SQL client to execute queries and interact with the database.

4. **Triggers and Events:**
   - Understand the triggers and events defined in the system for logging.

## Project Structure
- **SQLScripts:** Contains SQL scripts for creating the database schema and triggers.
- **Documentation:** Additional documentation for the project.
- **SourceCode:** Any additional source code files related to the project.

## Future Improvements
- Implement user authentication and authorization.
- Enhance search functionality with more advanced queries.
- Improve error handling and input validation.

## Contributors
- [Your Name]
- [Contributor 1]
- [Contributor 2]

## License
This project is licensed under the [License Name]. See the [LICENSE.md](LICENSE.md) file for details.
