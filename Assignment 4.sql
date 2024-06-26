
-- Assignment 4 

-- 1. 

-- Customer table

CREATE TABLE CUSTOMER(
CUST_NO VARCHAR(5) PRIMARY KEY CHECK(CUST_NO LIKE 'C____'),
NAME VARCHAR(20) NOT NULL,
PHONE_NO NUMERIC(10),
CITY VARCHAR(20));

-- Branch table

CREATE TABLE BRANCH(
BRANCH_CODE VARCHAR(5) PRIMARY KEY,
BRANCH_NAME VARCHAR(30) NOT NULL,
BRANCH_CITY VARCHAR(10) NOT NULL CHECK(BRANCH_CITY IN
('DELHI','MUMBAI','KOLKATA','CHENNAI')));

-- Account table

CREATE TABLE ACCOUNT(
ACCOUNT_NO VARCHAR(5) PRIMARY KEY CHECK(ACCOUNT_NO LIKE 'A____'),
TYPE VARCHAR(2) NOT NULL CHECK( TYPE IN ('SB','FD','CA')),
BALANCE NUMERIC(7) NOT NULL CHECK(BALANCE<10000000),
BRANCH_CODE VARCHAR(5),
FOREIGN KEY(BRANCH_CODE) REFERENCES BRANCH(BRANCH_CODE));

-- Depositor table

CREATE TABLE DEPOSITOR(
CUST_NO VARCHAR(5),
ACCOUNT_NO VARCHAR(5),
FOREIGN KEY (CUST_NO) REFERENCES CUSTOMER(CUST_NO),
FOREIGN KEY (ACCOUNT_NO)REFERENCES ACCOUNT(ACCOUNT_NO),
PRIMARY KEY(CUST_NO,ACCOUNT_NO))

-- Loan table

CREATE TABLE LOAN(
LOAN_NO VARCHAR(5) PRIMARY KEY CHECK(LOAN_NO LIKE 'L____'),
CUST_NO VARCHAR(5),
AMOUNT NUMERIC(10) CHECK(AMOUNT>1000),
BRANCH_CODE VARCHAR(5),
FOREIGN KEY (CUST_NO) REFERENCES CUSTOMER(CUST_NO),
FOREIGN KEY (BRANCH_CODE) REFERENCES BRANCH(BRANCH_CODE));

-- Installment table

CREATE TABLE INSTALLMENT(
    INST_NO NUMERIC(2) CHECK (INST_NO <=10),
    LOAN_NO VARCHAR(5),
    INST_AMOUNT NUMERIC(20) NOT NULL,
    PRIMARY KEY(INST_NO,LOAN_NO),
    FOREIGN KEY(LOAN_NO) REFERENCES LOAN(LOAN_NO)
)

-- 2. Inserting values

-- Customer table

INSERT ALL
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0001', 'RAJ ANAND SINGH', 9861258466, 'DELHI')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0002', 'ANKITA SINGH', 9879958651, 'BANGALORE')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0003', 'SOUMYA JHA', 9885623344, 'MUMBAI')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0004', 'ABHIJIT MISHRA', 9455845425, 'MUMBAI')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0005', 'YASH SARAF', 9665854585, 'KOLKATA')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0006', 'SWAROOP RAY', 9437855466, 'CHENNAI')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0007', 'SURYA NARAYAN', 9937955212, 'GURGAON')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0008', 'PRANAV PRAVEEN', 9336652441, 'PUNE')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0009', 'STUTI MISRA', 7870266534, 'DELHI')
    INTO CUSTOMER (CUST_NO, NAME, PHONE_NO, CITY) VALUES ('C0010', 'ASLESHA TIWARI', NULL, 'MUMBAI')
SELECT * FROM DUAL;


-- Branch table

INSERT ALL
    INTO BRANCH VALUES ('B001', 'JANAKPURI BRANCH', 'DELHI')
    INTO BRANCH VALUES ('B002', 'CHANDNICHOWK BRANCH', 'DELHI')
    INTO BRANCH VALUES ('B003', 'JUHU BRANCH', 'MUMBAI')
    INTO BRANCH VALUES ('B004', 'ANDHERI BRANCH', 'MUMBAI')
    INTO BRANCH VALUES ('B005', 'SALTLAKE BRANCH', 'KOLKATA')
    INTO BRANCH VALUES ('B006', 'SRIRAMPURAM BRANCH', 'CHENNAI')
SELECT * FROM DUAL;

-- Account table

INSERT ALL
    INTO ACCOUNT VALUES ('A0001', 'SB', 200000, 'B003')
    INTO ACCOUNT VALUES ('A0002', 'SB', 15000, 'B002')
    INTO ACCOUNT VALUES ('A0003', 'CA', 850000, 'B004')
    INTO ACCOUNT VALUES ('A0004', 'CA', 35000, 'B004')
    INTO ACCOUNT VALUES ('A0005', 'FD', 28500, 'B005')
    INTO ACCOUNT VALUES ('A0006', 'FD', 550000, 'B005')
    INTO ACCOUNT VALUES ('A0007', 'SB', 48000, 'B001')
    INTO ACCOUNT VALUES ('A0008', 'SB', 7200, 'B002')
    INTO ACCOUNT VALUES ('A0009', 'SB', 18750, 'B003')
    INTO ACCOUNT VALUES ('A0010', 'FD', 99000, 'B004')
SELECT * FROM DUAL;

-- Depositor table

INSERT ALL
    INTO DEPOSITOR VALUES ('C0003', 'A0001')
    INTO DEPOSITOR VALUES ('C0004', 'A0001')
    INTO DEPOSITOR VALUES ('C0004', 'A0002')
    INTO DEPOSITOR VALUES ('C0006', 'A0003')
    INTO DEPOSITOR VALUES ('C0006', 'A0004')
    INTO DEPOSITOR VALUES ('C0001', 'A0005')
    INTO DEPOSITOR VALUES ('C0002', 'A0005')
    INTO DEPOSITOR VALUES ('C0010', 'A0006')
    INTO DEPOSITOR VALUES ('C0009', 'A0007')
    INTO DEPOSITOR VALUES ('C0008', 'A0008')
    INTO DEPOSITOR VALUES ('C0007', 'A0009')
    INTO DEPOSITOR VALUES ('C0006', 'A0010')
SELECT * FROM DUAL;

-- Loan table 

INSERT ALL
    INTO LOAN VALUES ('L0001', 'C0005', 3000000, 'B006')
    INTO LOAN VALUES ('L0002', 'C0001', 50000, 'B005')
    INTO LOAN VALUES ('L0003', 'C0002', 8000000, 'B004')
    INTO LOAN VALUES ('L0004', 'C0010', 100000, 'B004')
    INTO LOAN VALUES ('L0005', 'C0009', 9500000, 'B005')
    INTO LOAN VALUES ('L0006', 'C0008', 25000, 'B006')
SELECT * FROM DUAL;

-- installment table

INSERT ALL
    INTO INSTALLMENT VALUES (1, 'L0005', 500000)
    INTO INSTALLMENT VALUES (1, 'L0002', 1000)
    INTO INSTALLMENT VALUES (1, 'L0003', 50000)
    INTO INSTALLMENT VALUES (1, 'L0004', 20000)
    INTO INSTALLMENT VALUES (2, 'L0005', 500000)
    INTO INSTALLMENT VALUES (1, 'L0006', 3000)
    INTO INSTALLMENT VALUES (2, 'L0002', 10000)
    INTO INSTALLMENT VALUES (3, 'L0002', 10000)
    INTO INSTALLMENT VALUES (2, 'L0003', 50000)
    INTO INSTALLMENT VALUES (2, 'L0004', 20000)
SELECT * FROM dual;



-- Key commands -
-- Primary key constraints - It is used to ensure that the values in a particular column are unique
-- Foreign key constraints - It is used to ensure that the values in a particular column are present in another table
-- Check constraints - It is used to ensure that the values in a particular column satisfies a particular condition
-- Like constraints - It is used to ensure that the values in a particular column match a particular pattern
