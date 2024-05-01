CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  Email VARCHAR(255) NOT NULL,
  Phone VARCHAR(255) NOT NULL,
  FName VARCHAR(255) NOT NULL,
  LName VARCHAR(255) NOT NULL
);

CREATE TABLE Business (
  BusinessID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Industry VARCHAR(255),
  Location VARCHAR(255)
);

CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Promotion (
  PromotionID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(255)
);

CREATE TABLE `Transaction` (
  TransactionID INT PRIMARY KEY,
  CustomerID INT,
  ProductID INT,
  PromotionID INT,
  TransactionDate DATE NOT NULL,
  TotalAmount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (PromotionID) REFERENCES Promotion(PromotionID)
);

CREATE TABLE Buys (
  TransactionID INT,
  CustomerID INT,
  Does  VARCHAR(255) NOT NULL,
  PointsEarned INT,
  FOREIGN KEY (TransactionID) REFERENCES `Transaction`(TransactionID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Reward (
  RewardID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(255)
);

CREATE TABLE Redemption (
  RedemptionID INT PRIMARY KEY,
  CustomerID INT,
  RewardID INT,
  Status VARCHAR(255) NOT NULL,
  Points INT,
  RedemptionDate DATE NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (RewardID) REFERENCES Reward(RewardID)
);

CREATE TABLE Earns (
  ProductID INT,
  RewardID INT,
  EarnedPoints INT,
  EarnedDate DATE NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (RewardID) REFERENCES Reward(RewardID)
);

CREATE TABLE Makes (
  BusinessID INT,
  ProductID INT,
  FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Gives (
  PromotionID INT,
  RewardID INT,
  FOREIGN KEY (PromotionID) REFERENCES Promotion(PromotionID),
  FOREIGN KEY (RewardID) REFERENCES Reward(RewardID)
);
