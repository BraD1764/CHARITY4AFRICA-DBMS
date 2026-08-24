IF OBJECT_ID('INVOICE', 'U') IS NOT NULL DROP TABLE INVOICE;
IF OBJECT_ID('RETURNS', 'U') IS NOT NULL DROP TABLE RETURNS;
IF OBJECT_ID('DELIVERY', 'U') IS NOT NULL DROP TABLE DELIVERY;
IF OBJECT_ID('DONATION', 'U') IS NOT NULL DROP TABLE DONATION;
IF OBJECT_ID('DONATOR', 'U') IS NOT NULL DROP TABLE DONATOR;
IF OBJECT_ID('EMPLOYEE', 'U') IS NOT NULL DROP TABLE EMPLOYEE;
IF OBJECT_ID('CUSTOMER', 'U') IS NOT NULL DROP TABLE CUSTOMER;
IF OBJECT_ID('FUNDING', 'U') IS NOT NULL DROP TABLE FUNDING;

-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    FIRST_NAME NVARCHAR(50),
    SURNAME NVARCHAR(50),
    ADDRESS NVARCHAR(100),
    CONTACT_NUMBER NVARCHAR(20),
    EMAIL NVARCHAR(100)
);

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID NVARCHAR(10) PRIMARY KEY,
    FIRST_NAME NVARCHAR(50),
    SURNAME NVARCHAR(50),
    CONTACT_NUMBER NVARCHAR(20),
    ADDRESS NVARCHAR(100),
    EMAIL NVARCHAR(100)
);

-- Create DONATOR table
CREATE TABLE DONATOR (
    DONATOR_ID INT PRIMARY KEY,
    FIRST_NAME NVARCHAR(50),
    SURNAME NVARCHAR(50),
    CONTACT_NUMBER NVARCHAR(20),
    EMAIL NVARCHAR(100)
);

-- Create DONATION table
CREATE TABLE DONATION (
    DONATION_ID INT PRIMARY KEY,
    DONATOR_ID INT,
    DONATION_NAME NVARCHAR(100),
    PRICE NVARCHAR(20),
    DONATION_DATE NVARCHAR(30)
);

-- Create DELIVERY table
CREATE TABLE DELIVERY (
    DELIVERY_ID INT PRIMARY KEY,
    DELIVERY_NOTES NVARCHAR(200),
    DISPATCH_DATE NVARCHAR(30),
    DELIVERY_DATE NVARCHAR(30)
);

-- Create RETURNS table
CREATE TABLE RETURNS (
    RETURN_ID NVARCHAR(10) PRIMARY KEY,
    RETURN_DATE NVARCHAR(30),
    REASON NVARCHAR(200),
    CUSTOMER_ID INT,
    DONATION_ID INT,
    EMPLOYEE_ID NVARCHAR(10)
);

-- Create INVOICE table
CREATE TABLE INVOICE (
    INVOICE_NUMBER INT PRIMARY KEY,
    CUSTOMER_ID INT,
    INVOICE_DATE NVARCHAR(30),
    EMPLOYEE_ID NVARCHAR(10),
    DONATION_ID INT,
    DELIVERY_ID INT
);

-- Insert data into CUSTOMER
INSERT INTO CUSTOMER VALUES (11011, 'Jack', 'Smith', '18 Water Rd', '0877277521', 'jsmith@isat.com');
INSERT INTO CUSTOMER VALUES (11012, 'Pat', 'Hendricks', '22 Water Rd', '0863257857', 'ph@mcom.co.za');
INSERT INTO CUSTOMER VALUES (11013, 'Andre', 'Clark', '101 Summer Lane', '0834567891', 'aclark@mcom.co.za');
INSERT INTO CUSTOMER VALUES (11014, 'Kevin', 'Jones', '55 Mountain way', '0612547895', 'kj@isat.co.za');
INSERT INTO CUSTOMER VALUES (11015, 'Lucy', 'Williams', '5 Main rd', '0827238521', 'lw@mcal.co.za');

-- Insert data into EMPLOYEE
INSERT INTO EMPLOYEE VALUES ('emp101', 'Jeff', 'Davis', '0877277521', '10 main road', 'jand@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp102', 'Kevin', 'Marks', '0837377522', '18 water road', 'km@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp103', 'Adanya', 'Andrews', '0817117523', '21 circle lane', 'aa@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp104', 'Adebayo', 'Dryer', '0797215244', '1 sea road', 'aryer@isat.com');
INSERT INTO EMPLOYEE VALUES ('emp105', 'Xolani', 'Samson', '0827122255', '12 main road', 'xosam@isat.com');

-- Insert data into DONATOR
INSERT INTO DONATOR VALUES (20111, 'Jeff', 'Watson', '0827172250', 'jwatson@ymail.com');
INSERT INTO DONATOR VALUES (20112, 'Stephen', 'Jones', '0837865670', 'joness@ymail.com');
INSERT INTO DONATOR VALUES (20113, 'James', 'Joe', '0878978650', 'jj@isat.com');
INSERT INTO DONATOR VALUES (20114, 'Kelly', 'Ross', '0826575650', 'kross@gsat.com');
INSERT INTO DONATOR VALUES (20115, 'Abraham', 'Clark', '0797656430', 'aclark@ymail.com');

-- Insert data into DONATION
INSERT INTO DONATION VALUES (7111, 20111, 'KIC Fridge', '599', '1 May 2024');
INSERT INTO DONATION VALUES (7112, 20112, 'Samsung 42inch LCD', '1299', '3 May 2024');
INSERT INTO DONATION VALUES (7113, 20113, 'Sharp Microwave', '1599', '3 May 2024');
INSERT INTO DONATION VALUES (7114, 20115, '6 Seat Dining room table', '799', '5 May 2024');
INSERT INTO DONATION VALUES (7115, 20114, 'Lazyboy Sofa', '1199', '7 May 2024');
INSERT INTO DONATION VALUES (7116, 20113, 'JVC Surround Sound System', '179', '9 May 2024');

-- Insert data into DELIVERY
INSERT INTO DELIVERY VALUES (511, 'Double packaging requested', '10 May 2024', '15 May 2024');
INSERT INTO DELIVERY VALUES (512, 'Delivery to work address', '12 May 2024', '15 May 2024');
INSERT INTO DELIVERY VALUES (513, 'Signature required', '12 May 2024', '17 May 2024');
INSERT INTO DELIVERY VALUES (514, 'No notes', '12 May 2024', '15 May 2024');
INSERT INTO DELIVERY VALUES (515, 'Birthday present wrapping required', '18 May 2024', '19 May 2024');
INSERT INTO DELIVERY VALUES (516, 'Delivery to work address', '20 May 2024', '25 May 2024');

-- Insert data into RETURNS
INSERT INTO RETURNS VALUES ('ret001', '25 May 2024', 'Customer not satisfied with product', 11011, 7116, 'emp101');
INSERT INTO RETURNS VALUES ('ret002', '25 May 2024', 'Product had broken section', 11013, 7114, 'emp103');

-- Insert data into INVOICE (FIXED VERSION)
INSERT INTO INVOICE VALUES (8111, 11011, '15 May 2024', 'emp103', 7111, 511);
INSERT INTO INVOICE VALUES (8112, 11013, '15 May 2024', 'emp101', 7114, 512);
INSERT INTO INVOICE VALUES (8113, 11012, '17 May 2024', 'emp101', 7112, 513);
INSERT INTO INVOICE VALUES (8114, 11015, '17 May 2024', 'emp102', 7113, 514);
INSERT INTO INVOICE VALUES (8115, 11011, '17 May 2024', 'emp102', 7115, 515);
INSERT INTO INVOICE VALUES (8116, 11015, '18 May 2024', 'emp103', 7116, 516);

PRINT 'Question 1 Complete: Tables created and populated successfully!';
GO


SELECT 
    C.FIRST_NAME + ', ' + C.SURNAME AS CUSTOMER,
    I.EMPLOYEE_ID,
    D.DELIVERY_NOTES,
    DN.DONATION_NAME AS DONATION,
    I.INVOICE_NUMBER AS INVOICE_NUM,
    I.INVOICE_DATE
FROM INVOICE I
INNER JOIN CUSTOMER C ON I.CUSTOMER_ID = C.CUSTOMER_ID
INNER JOIN DELIVERY D ON I.DELIVERY_ID = D.DELIVERY_ID
INNER JOIN DONATION DN ON I.DONATION_ID = DN.DONATION_ID
WHERE I.INVOICE_DATE IN ('15 May 2024', '17 May 2024')
ORDER BY I.INVOICE_NUMBER;

PRINT 'Question 2 Complete: Report generated!';
GO


-- Create FUNDING table
CREATE TABLE FUNDING (
    FUNDING_ID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-generates unique ID
    FUNDER NVARCHAR(100),
    FUNDING_AMOUNT DECIMAL(10,2)
);

INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('ABC Corporation', 50000);
INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('XYZ Foundation', 75000);
INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('Community Trust', 25000);
INSERT INTO FUNDING (FUNDER, FUNDING_AMOUNT) VALUES ('Local Business Association', 100000);

-- View the results
SELECT * FROM FUNDING;

PRINT 'Question 3 Complete: Funding table with auto-generated IDs created!';
GO


DECLARE 
    @first_name NVARCHAR(50),
    @surname NVARCHAR(50),
    @donation_name NVARCHAR(100),
    @price INT,
    @reason NVARCHAR(200);

DECLARE return_cursor CURSOR FOR
    SELECT 
        C.FIRST_NAME,
        C.SURNAME,
        DN.DONATION_NAME,
        CAST(REPLACE(DN.PRICE, ' ', '') AS INT) AS PRICE_AMOUNT,
        R.REASON
    FROM RETURNS R
    INNER JOIN CUSTOMER C ON R.CUSTOMER_ID = C.CUSTOMER_ID
    INNER JOIN DONATION DN ON R.DONATION_ID = DN.DONATION_ID;

OPEN return_cursor;

FETCH NEXT FROM return_cursor INTO @first_name, @surname, @donation_name, @price, @reason;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'CUSTOMER:';
    PRINT @first_name + ', ' + @surname;
    PRINT 'DONATION PURCHASED:';
    PRINT @donation_name;
    PRINT 'PRICE:';
    PRINT CAST(@price AS NVARCHAR);
    PRINT 'RETURN REASON:';
    PRINT @reason;
    PRINT '-----------------------------------';
    
    FETCH NEXT FROM return_cursor INTO @first_name, @surname, @donation_name, @price, @reason;
END

CLOSE return_cursor;
DEALLOCATE return_cursor;

PRINT 'PL/SQL procedure successfully completed.';
PRINT 'Question 4 Complete: Returns report generated!';
GO



DECLARE 
    @customer_name NVARCHAR(100),
    @employee_name NVARCHAR(100),
    @donation_name NVARCHAR(100),
    @dispatch_date DATE,
    @delivery_date DATE,
    @days_difference INT;

SELECT 
    @customer_name = C.FIRST_NAME + '.' + LEFT(C.SURNAME, 1),
    @employee_name = E.FIRST_NAME + '.' + LEFT(E.SURNAME, 1),
    @donation_name = DN.DONATION_NAME,
    @dispatch_date = CAST(D.DISPATCH_DATE AS DATE),
    @delivery_date = CAST(D.DELIVERY_DATE AS DATE)
FROM INVOICE I
INNER JOIN CUSTOMER C ON I.CUSTOMER_ID = C.CUSTOMER_ID
INNER JOIN EMPLOYEE E ON I.EMPLOYEE_ID = E.EMPLOYEE_ID
INNER JOIN DONATION DN ON I.DONATION_ID = DN.DONATION_ID
INNER JOIN DELIVERY D ON I.DELIVERY_ID = D.DELIVERY_ID
WHERE C.CUSTOMER_ID = 11013;

-- Calculate days between dispatch and delivery
SET @days_difference = ABS(DATEDIFF(DAY, @dispatch_date, @delivery_date));

PRINT 'CUSTOMER:';
PRINT @customer_name;
PRINT 'EMPLOYEE:';
PRINT @employee_name;
PRINT 'DONATION:';
PRINT @donation_name;
PRINT 'DISPATCH DATE:';
PRINT FORMAT(@dispatch_date, 'dd/MMM/yy');
PRINT 'DELIVERY DATE:';
PRINT FORMAT(@delivery_date, 'dd/MMM/yy');
PRINT 'DAYS TO DELIVERY: ' + CAST(@days_difference AS NVARCHAR);

PRINT 'PL/SQL procedure successfully completed.';
PRINT 'Question 5 Complete: Delivery calculation done!';
GO


SELECT 
    C.FIRST_NAME,
    C.SURNAME,
    SUM(CAST(REPLACE(DN.PRICE, ' ', '') AS INT)) AS TOTAL_AMOUNT,
    CASE 
        WHEN SUM(CAST(REPLACE(DN.PRICE, ' ', '') AS INT)) >= 1500 THEN ' (*)'
        ELSE ''
    END AS STAR_RATING
FROM INVOICE I
INNER JOIN CUSTOMER C ON I.CUSTOMER_ID = C.CUSTOMER_ID
INNER JOIN DONATION DN ON I.DONATION_ID = DN.DONATION_ID
GROUP BY C.FIRST_NAME, C.SURNAME
ORDER BY C.FIRST_NAME;

PRINT 'Question 6 Complete: Customer spending report with ratings generated!';
GO

-- SQL Server doesn't have %TYPE, but we simulate using local variables
DECLARE 
    @v_customer_name NVARCHAR(50),      -- Matches CUSTOMER.FIRST_NAME type
    @v_customer_surname NVARCHAR(50),   -- Matches CUSTOMER.SURNAME type
    @v_contact NVARCHAR(20),            -- Matches CUSTOMER.CONTACT_NUMBER type
    @v_email_id NVARCHAR(100);          -- Matches CUSTOMER.EMAIL type

SELECT 
    @v_customer_name = FIRST_NAME,
    @v_customer_surname = SURNAME,
    @v_contact = CONTACT_NUMBER,
    @v_email_id = EMAIL
FROM CUSTOMER
WHERE CUSTOMER_ID = 11011;

PRINT '=== %TYPE Attribute Demonstration (SQL Server Equivalent) ===';
PRINT 'Customer Name: ' + @v_customer_name + ' ' + @v_customer_surname;
PRINT 'Contact: ' + @v_contact;
PRINT 'Email: ' + @v_email_id;

PRINT 'Question 7.1 Complete!';
GO


-- SQL Server uses temporary table or table variable to simulate %ROWTYPE
DECLARE @customer_table TABLE (
    CUSTOMER_ID INT,
    FIRST_NAME NVARCHAR(50),
    SURNAME NVARCHAR(50),
    ADDRESS NVARCHAR(100),
    CONTACT_NUMBER NVARCHAR(20),
    EMAIL NVARCHAR(100)
);

INSERT INTO @customer_table
SELECT TOP 1 * FROM CUSTOMER WHERE CUSTOMER_ID = 11012;

PRINT '=== %ROWTYPE Attribute Demonstration (SQL Server Equivalent) ===';
PRINT '--- Customer Information ---';
SELECT 
    'ID: ' + CAST(CUSTOMER_ID AS NVARCHAR) AS INFO,
    'Name: ' + FIRST_NAME + ' ' + SURNAME AS INFO2,
    'Address: ' + ADDRESS AS INFO3
FROM @customer_table;

PRINT 'Question 7.2 Complete!';
GO


BEGIN TRY
    DECLARE @donation_name NVARCHAR(100);
    DECLARE @price NVARCHAR(20);
    DECLARE @donation_id INT = 9999; -- Non-existent ID
    
    PRINT '=== System-Defined Exception Demonstration ===';
    PRINT 'Attempting to fetch donation with ID: ' + CAST(@donation_id AS NVARCHAR);
    
    -- This will raise an error because ID doesn't exist
    SELECT 
        @donation_name = DONATION_NAME,
        @price = PRICE
    FROM DONATION
    WHERE DONATION_ID = @donation_id;
    
    IF @donation_name IS NULL
    BEGIN
        -- Simulate NO_DATA_FOUND
        PRINT 'SYSTEM EXCEPTION: No donation found with ID ' + CAST(@donation_id AS NVARCHAR);
    END
    ELSE
    BEGIN
        PRINT 'Donation found: ' + @donation_name;
    END
END TRY
BEGIN CATCH
    PRINT 'SYSTEM EXCEPTION: ' + ERROR_MESSAGE();
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
END CATCH

-- Example 2: Duplicate key exception
BEGIN TRY
    PRINT 'Attempting to insert duplicate customer ID...';
    INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, SURNAME)
    VALUES (11011, 'Test', 'User'); -- ID already exists
END TRY
BEGIN CATCH
    PRINT 'SYSTEM EXCEPTION: Cannot insert duplicate customer ID';
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH

GO

BEGIN TRY
    DECLARE @v_donation_name NVARCHAR(100) = 'Premium Television';
    DECLARE @v_price INT = 5000;
    DECLARE @v_donation_date DATE = GETDATE();
    DECLARE @v_donator_id INT = 20111;
    
    PRINT '=== User-Defined Exception Demonstration ===';
    PRINT 'Processing donation: ' + @v_donation_name;
    PRINT 'Price: R ' + CAST(@v_price AS NVARCHAR);
    
    -- Business rule 1: Price must be greater than 0
    IF @v_price <= 0
    BEGIN
        PRINT 'USER-DEFINED EXCEPTION: Invalid price detected!';
        PRINT 'Price must be greater than R0. Current price: R' + CAST(@v_price AS NVARCHAR);
        RETURN;
    END
    
    -- Business rule 2: High value donation (> R3000) requires special approval
    IF @v_price > 3000
    BEGIN
        PRINT 'USER-DEFINED EXCEPTION: High value donation requires manager approval!';
        PRINT 'Donation value: R' + CAST(@v_price AS NVARCHAR);
        PRINT 'Please contact your supervisor for authorization.';
        RETURN;
    END
    
    -- Business rule 3: Donation date cannot be in the future
    IF @v_donation_date > GETDATE()
    BEGIN
        PRINT 'USER-DEFINED EXCEPTION: Invalid donation date!';
        PRINT 'Donation date cannot be in the future.';
        RETURN;
    END
    
    -- If all validations pass
    PRINT 'SUCCESS: Donation processed successfully!';
    
END TRY
BEGIN CATCH
    PRINT 'Unexpected error: ' + ERROR_MESSAGE();
END CATCH


BEGIN TRY
    DECLARE @v_donation_id INT = 7111;
    DECLARE @v_current_price INT;
    DECLARE @v_new_price INT = 800;
    DECLARE @v_price_increase_percent DECIMAL(5,2);
    
    PRINT '--- Updating Donation Price ---';
    
    SELECT @v_current_price = CAST(REPLACE(PRICE, ' ', '') AS INT)
    FROM DONATION
    WHERE DONATION_ID = @v_donation_id;
    
    SET @v_price_increase_percent = ((@v_new_price - @v_current_price) / CAST(@v_current_price AS DECIMAL)) * 100;
    
    -- Business rule: Price cannot increase by more than 20%
    IF @v_price_increase_percent > 20
    BEGIN
        PRINT 'USER-DEFINED EXCEPTION: Price increase exceeds 20% limit!';
        PRINT 'Current price: R' + CAST(@v_current_price AS NVARCHAR);
        PRINT 'Requested price: R' + CAST(@v_new_price AS NVARCHAR);
        PRINT 'Increase: ' + CAST(ROUND(@v_price_increase_percent, 2) AS NVARCHAR) + '%';
        PRINT 'Maximum allowed increase is 20%.';
        RETURN;
    END
    
    UPDATE DONATION 
    SET PRICE = CAST(@v_new_price AS NVARCHAR)
    WHERE DONATION_ID = @v_donation_id;
    
    PRINT 'SUCCESS: Price updated from R' + CAST(@v_current_price AS NVARCHAR) + 
          ' to R' + CAST(@v_new_price AS NVARCHAR);
    PRINT 'Increase: ' + CAST(ROUND(@v_price_increase_percent, 2) AS NVARCHAR) + '%';
    
END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH

GO
