CREATE DATABASE BankManagement;
USE BankManagement;

CREATE TABLE CUSTOMER_INFO (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    CustomerMembership VARCHAR(50)
);

CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    OrderName VARCHAR(100) NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER_INFO(CustomerID)
);

CREATE TABLE ORDER_DETAILS (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)
);

CREATE TABLE PAYMENT (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    OrderID INT,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER_INFO(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)
);

INSERT INTO CUSTOMER_INFO (Name, Country, CustomerMembership) 
VALUES 
('John Doe', 'USA', 'Standard'),
('Jane Smith', 'UK', 'Standard'),
('Ali Koné', 'Ivory Coast', 'Premium');

INSERT INTO ORDERS (OrderName, CustomerID) 
VALUES 
('Loan Application', 1),
('Credit Card Request', 2),
('Savings Account Opening', 3);

INSERT INTO ORDER_DETAILS (OrderID, Quantity, TotalPrice) 
VALUES 
(1, 1, 500.00),  -- Loan application fee
(2, 2, 1200.00), -- Two credit cards
(3, 1, 300.00);  -- Account opening fee

INSERT INTO PAYMENT (CustomerID, OrderID, Amount, PaymentMethod) 
VALUES 
(1, 1, 500.00, 'Bank Transfer'),
(2, 2, 1200.00, 'Credit Card'),
(3, 3, 300.00, 'Cash');