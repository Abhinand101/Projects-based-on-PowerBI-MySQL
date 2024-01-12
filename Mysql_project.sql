CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT NOT NULL UNIQUE,
Branch_address VARCHAR(100) NOT NULL,
Contact_no BIGINT NOT NULL UNIQUE);
INSERT INTO Branch VALUES 
(101,010,"693 Tiffany Parks, O'Keefeport, WV 78375",8756983458),
(103,01,"3994 Chu Plaza, West Vernonfurt, UT 19560 ",6843769823),
(105,015,"50866 Truman Drive, Mitziville, AR 08908",6748567384),
(106,016,"60528 Waylon Club, Bartonland, VA 23328-1064",7390564856),
(107,017,"4/mn, Vijay Chambers, Tribhuvan Road, Chira Bazar",75488939495),
(108,018,"7539 Aufderhar Greens, Elanafurt, NV 82416",6789030540),
(102,012,"2, Luz Church Road, Mylapore City:Chennai",8945678476),
(104,014,"102, F-20, Green Crest, Yamuna Nagar, Opp Parsurampuria Tower, Andheri (west)",5690394856),
(109,019,"501, Heritage Plaza, J P Rd, Opp Ioc Colony, Andheri (west)",7654389098),
(111,011,"773 Dana Greens, South Pathaven, OR 29682",6578903040);

CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(50) NOT NULL,
Position VARCHAR(30),
Salary INT,
Branch_no INT NOT NULL,
FOREIGN KEY(Branch_no) REFERENCES Branch(branch_no));
INSERT INTO Employee VALUES 
(41,"Abhinand","Library Director",62000,107),
(42,"Keerthy","Library Managers",30000,101),
(43,"Karthik","Library Manager",55000,111),
(44,"Aaliya","Pages",15000,107),
(45,"Theresa","Library Director",62000,107),
(46,"Asif","Librarian",25000,101),
(47,"Arjun","Library Assistant",28000,101),
(48,"Pooja","Librarian",25000,107),
(49, 'James','Pages', 15000,101),
(50, 'Priyanka', 'Librarian', 25000,101),
(51, 'Sara', 'Library Assistant', 25000,101),
(52, 'Subrat', 'Pages',15000,101),
(53, 'Sushanta','Library Assistant',28000,107),
(54, 'Mahesh', 'Librarian',25000,101),
(55, 'Hina', 'Library Assistant',28000,107);

CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR (50) NOT NULL,
Customer_address VARCHAR (100) NOT NULL,
Reg_date DATE NOT NULL);
INSERT INTO Customer VALUES 
(12, 'Jane','West Coast 3rd Street Los Angeles','2020-03-22'),
(13, 'Bob','Park avenue east raipur','2020-07-12'),
(14, 'Alice',"Treehill north 22nd lane','Gurgaon'",'2020-05-17'),
(15, 'Charlie',"West hill hilton apartments','Boston'",'2021-06-08'),
(16, 'Eva',"Heartville 43rd Street','Toronto'",'2020-05-22'),
(17, 'Arun',"Bareli house 3rd street','Noida'",'2021-09-04'),
(18, 'Sophia',"'St petersburg 3rd avenue','Los Angeles'",'2020-11-19'),
(19, 'David',"Apt. 238 271 Nienow Creek, Robbiborough, SC 53050",'2021-09-28'),
(20, 'Bob',"Apt. 391 6869 Annamaria Square, Wymanland, SC 87367-8824",'2021-02-22');

CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book VARCHAR(50),
FOREIGN KEY(Issued_cust) REFERENCES Customer(Customer_Id),FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));
INSERT INTO IssueStatus VALUES 
(1002,15, 'X-Men: God Loves, Man Kills','2022-05-15','9788654552277'),
(1003,14, 'Mike Tyson : Undisputed Truth','2023-6-12','0964161484100'),
(1006,18,'V for Vendetta','1982-07-12','6901142585540'),
(1007,17, 'When Breath Becomes Air','2022-01-12','9094996245442'),
(1009,12, 'The Great Gatsby','2023-04-10','8653491200700'), 
(1010,13,'Java: The Complete Reference ','2021-10-10','BL000002'),
(1004,19,'Let Us C','2022-12-11','BL000007'),
(1011,12,'The Catcher in the Rye','2021-07-16','978010012484'),
(1012,20,'Nine Stories','2023-06-06','9780316769501'),
(1013,16,'Grant','2021-10-10','9780143110637');
UPDATE issuestatus SET Issued_cust=17 WHERE Issued_cust=18;

CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust INT NOT NULL,
Return_book_name VARCHAR(30),
Return_date DATE NOT NULL,
Isbn_book2 VARCHAR(50),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));
INSERT INTO ReturnStatus VALUES
(991,18,'V for Vendetta','2021-07-19','6901142585540'),
(997,17, 'When Breath Becomes Air','2021-12-05','9094996245442'),
(999,12, 'The Great Gatsby', '2021-12-15','8653491200700'), 
(992,13,'Java: The Complete Reference ','2021-12-02','BL000002'),
(994,19,'Let Us C','2022-08-11','BL000007'),
(995,12,'The Catcher in the Rye','2021-05-26','978010012484'),
(996,20,'Nine Stories','2021-04-15','9780316769501'),
(993,16,'Grant','2021-12-11','9780143110637');

CREATE TABLE Books(
ISBN VARCHAR(50) PRIMARY KEY,
Book_title VARCHAR(50) NOT NULL,
Category VARCHAR(30),
Rental_Price INT NOT NULL,
Availability ENUM('Yes','No'),
Author VARCHAR(50),
Publisher VARCHAR(50));
INSERT INTO Books VALUES
('9788654552277', 'X-Men: God Loves, Man Kills','Comics',100, 1,'Chris Claremont','Marvel Comics'),
('0964161484100', 'Mike Tyson : Undisputed Truth', 'Sports',100,2,'Larry Sloman, Mike Tyson','HarperSport'),
('6901142585540', 'V for Vendetta','Comics',100,2,'Alan Moore','DC Comics'),
('9094996245442', 'When Breath Becomes Air','Medical',100,1,'Paul Kalanithi','Random House'),
('8653491200700', 'The Great Gatsby','Fiction',100,2,'F. Scott Fitzgerald',"Charles Scribner's Sons"),
('BL000002','Java: The Complete Reference ','JAVA',120,1,'Herbert Schildt', 'Tata Mcgraw Hill '),
('9780143110637','Grant','History',100,1,'Ron Chernow','Penguin Press'),
('BL000007', 'Let Us C', 'C',120,2,'Yashavant Kanetkar','BPB Publications'),
('9780100124841011','The Catcher in the Rye','Fiction',100,1,'J.D.Salinger','Little Brown and Company'),
('9780316769501','Nine Stories','Short Story Collection',100,1,'J.D.Salinger','Little Brown and Company');
SELECT * FROM Books;
UPDATE Books SET ISBN='978010012484' WHERE Book_title="The Catcher in the Rye";

#1. Retrieve the book title, category, and rental price of all available books
SELECT Book_title,Category,Rental_Price FROM Books WHERE Availability='Yes';

#2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Issued_Book_name,Issued_cust FROM IssueStatus;
SELECT IssueStatus.Issued_book_name, Customer.customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.customer_id;

#4.Display the total count of books in each category.
SELECT Category,COUNT(Book_title) AS Totalbooks FROM Books GROUP BY Category; 

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name,Position FROM Employee WHERE Salary>50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no,COUNT(Emp_name) AS Totalemployees FROM Employee GROUP BY Branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT Customer.customer_name
FROM Customer
JOIN IssueStatus ON Customer.customer_id = IssueStatus.Issued_cust
WHERE MONTH(IssueStatus.Issue_date) = 6 AND YEAR(IssueStatus.Issue_date) = 2023;

#9. Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE Category='History';

#10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no,COUNT(Emp_name) AS Totalemployee FROM Employee GROUP BY Branch_no HAVING Totalemployee > 5;
