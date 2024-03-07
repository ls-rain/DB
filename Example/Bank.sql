CREATE TABLE Customer (
	customer_id	Varchar(3)	NOT NULL,
	customer_name	Varchar(100)	NULL,
	customer_street	Varchar(100)	NULL,
	customer_city	Varchar(100)	NULL
);

CREATE TABLE Loan (
	loan_number	Varchar(20)	NOT NULL,
	amount	Int(10)	NULL
);

CREATE TABLE Account (
	account_number	Varchar(20)	NOT NULL,
	balance	Int(10)	NULL
);

CREATE TABLE Employee (
	employee_id	Varchar(4)	NOT NULL,
	employee_name	Varchar(100)	NULL,
	telephone_number	Varchar(11)	NULL,
	employee_length	Int(10)	NULL,
	start_date	Date(8)	NULL
);

CREATE TABLE Employee_Dependent (
	employee_id	Varchar(4)	NOT NULL,
	dependent_name	Varchar(100)	NULL
);

CREATE TABLE Branch (
	branch_name	Varchar(100)	NOT NULL,
	branch_city	Varchar(100)	NULL,
	assets	Int(10)	NULL
);

CREATE TABLE Payment (
	payment_number	Int(10)	NOT NULL,
	loan_number	Varchar(20)	NOT NULL,
	payment_amount	Int(10)	NULL,
	payment_date	Date(8)	NULL
);

CREATE TABLE Borrower (
	customer_id	Varchar(3)	NOT NULL,
	loan_number	Varchar(20)	NOT NULL
);

CREATE TABLE Depositor (
	customer_id	Varchar(3)	NOT NULL,
	account_number	Varchar(20)	NOT NULL
);

CREATE TABLE Customer_Banker (
	employee_id	Varchar(4)	NOT NULL,
	customer_id	Varchar(3)	NOT NULL
);

CREATE TABLE Manager_Worker (
	employee_manager	Varchar(20)	NOT NULL,
	employee_worker	Varchar(20)	NOT NULL
);

CREATE TABLE Loan_Branch (
	branch_name	Varchar(100)	NOT NULL,
	loan_number	Varchar(20)	NOT NULL
);

ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (
	customer_id
);

ALTER TABLE Loan ADD CONSTRAINT PK_LOAN PRIMARY KEY (
	loan_number
);

ALTER TABLE Account ADD CONSTRAINT PK_ACCOUNT PRIMARY KEY (
	account_number
);

ALTER TABLE Employee ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (
	employee_id
);

ALTER TABLE Employee_Dependent ADD CONSTRAINT PK_EMPLOYEE_DEPENDENT PRIMARY KEY (
	employee_id
);

ALTER TABLE Branch ADD CONSTRAINT PK_BRANCH PRIMARY KEY (
	branch_name
);

ALTER TABLE Payment ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	payment_number,
	loan_number
);

ALTER TABLE Borrower ADD CONSTRAINT PK_BORROWER PRIMARY KEY (
	customer_id,
	loan_number
);

ALTER TABLE Depositor ADD CONSTRAINT PK_DEPOSITOR PRIMARY KEY (
	customer_id,
	account_number
);

ALTER TABLE Customer_Banker ADD CONSTRAINT PK_CUSTOMER_BANKER PRIMARY KEY (
	employee_id
);

ALTER TABLE Manager_Worker ADD CONSTRAINT PK_MANAGER_WORKER PRIMARY KEY (
	employee_manager
);

ALTER TABLE Loan_Branch ADD CONSTRAINT PK_LOAN_BRANCH PRIMARY KEY (
	branch_name
);

ALTER TABLE Employee_Dependent ADD CONSTRAINT FK_Employee_TO_Employee_Dependent_1 FOREIGN KEY (
	employee_id
)
REFERENCES Employee (
	employee_id
);

ALTER TABLE Payment ADD CONSTRAINT FK_Loan_TO_Payment_1 FOREIGN KEY (
	loan_number
)
REFERENCES Loan (
	loan_number
);

ALTER TABLE Borrower ADD CONSTRAINT FK_Customer_TO_Borrower_1 FOREIGN KEY (
	customer_id
)
REFERENCES Customer (
	customer_id
);

ALTER TABLE Borrower ADD CONSTRAINT FK_Loan_TO_Borrower_1 FOREIGN KEY (
	loan_number
)
REFERENCES Loan (
	loan_number
);

ALTER TABLE Depositor ADD CONSTRAINT FK_Customer_TO_Depositor_1 FOREIGN KEY (
	customer_id
)
REFERENCES Customer (
	customer_id
);

ALTER TABLE Depositor ADD CONSTRAINT FK_Account_TO_Depositor_1 FOREIGN KEY (
	account_number
)
REFERENCES Account (
	account_number
);

ALTER TABLE Customer_Banker ADD CONSTRAINT FK_Employee_TO_Customer_Banker_1 FOREIGN KEY (
	employee_id
)
REFERENCES Employee (
	employee_id
);

ALTER TABLE Manager_Worker ADD CONSTRAINT FK_Employee_TO_Manager_Worker_1 FOREIGN KEY (
	employee_manager
)
REFERENCES Employee (
	employee_id
);

ALTER TABLE Loan_Branch ADD CONSTRAINT FK_Branch_TO_Loan_Branch_1 FOREIGN KEY (
	branch_name
)
REFERENCES Branch (
	branch_name
);

