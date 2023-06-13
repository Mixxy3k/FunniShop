-- Drop Section --
-- Drop the foreign key constraints first
ALTER TABLE [OrderItems] DROP CONSTRAINT FK_OrderItems_Orders;
ALTER TABLE [OrderItems] DROP CONSTRAINT FK_OrderItems_Products;
ALTER TABLE [Orders] DROP CONSTRAINT FK_Orders_Customers;
ALTER TABLE [Customers] DROP CONSTRAINT FK_Customers_Address;

-- Drop the tables in reverse order of creation
DROP TABLE [OrderItems];
DROP TABLE [Orders];
DROP TABLE [Customers];
DROP TABLE [Address];
DROP TABLE [Products];


CREATE TABLE [OrderItems] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [OrderId] INT,
  [ProductId] INT NOT NULL,
  [Quantity] INT DEFAULT (1)
);

CREATE TABLE [Orders] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [UserId] INT,
  [Status] NVARCHAR(255) NOT NULL,
  [CreatedAt] DATETIME NOT NULL
);

CREATE TABLE [Products] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [Name] NVARCHAR(255) NOT NULL,
  [Description] NVARCHAR(255) NOT NULL,
  [Price] INT NOT NULL,
  [CreatedAt] DATETIME DEFAULT (GETDATE()),
  [Amount] INT NOT NULL
);

CREATE TABLE [Customers] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [AddressId] INT,
  [Name] NVARCHAR(255) NOT NULL,
  [Surname] NVARCHAR(255) NOT NULL,
  [Email] NVARCHAR(255) NOT NULL,
  [PhoneNumber] NVARCHAR(255) NOT NULL
);

CREATE TABLE [Address] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [City] NVARCHAR(255) NOT NULL,
  [Street] NVARCHAR(255) NOT NULL,
  [ZipCode] NVARCHAR(255) NOT NULL
);

ALTER TABLE [OrderItems] ADD CONSTRAINT FK_OrderItems_Orders FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([Id]);
ALTER TABLE [OrderItems] ADD CONSTRAINT FK_OrderItems_Products FOREIGN KEY ([ProductId]) REFERENCES [Products] ([Id]);
ALTER TABLE [Orders] ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY ([UserId]) REFERENCES [Customers] ([Id]);
ALTER TABLE [Customers] ADD CONSTRAINT FK_Customers_Address FOREIGN KEY ([AddressId]) REFERENCES [Address] ([Id]);

-- Inserting dummy data into [Address] table
INSERT INTO [Address] ([City], [Street], [ZipCode])
VALUES
  ('Warszawa', 'Aleje Jerozolimskie', '00-001'),
  ('Kraków', 'Rynek Główny', '31-042'),
  ('Gdańsk', 'Długi Targ', '80-830');

-- Inserting dummy data into [Customers] table
INSERT INTO [Customers] ([AddressId], [Name], [Surname], [Email], [PhoneNumber])
VALUES
  (1, 'Jan', 'Kowalski', 'jan.kowalski@example.com', '123456789'),
  (2, 'Anna', 'Nowak', 'anna.nowak@example.com', '987654321'),
  (3, 'Piotr', 'Wójcik', 'piotr.wojcik@example.com', '456123789');

-- Inserting dummy data into [Products] table
INSERT INTO [Products] ([Name], [Description], [Price], [Amount])
VALUES
  ('Product 1', 'Description 1', 10, 100),
  ('Product 2', 'Description 2', 20, 200),
  ('Product 3', 'Description 3', 30, 300);

-- Inserting dummy data into [Orders] table
INSERT INTO [Orders] ([UserId], [Status], [CreatedAt])
VALUES
  (1, 'Pending', GETDATE()),
  (2, 'Shipped', GETDATE()),
  (3, 'Delivered', GETDATE());

-- Inserting dummy data into [OrderItems] table
INSERT INTO [OrderItems] ([OrderId], [ProductId], [Quantity])
VALUES
  (1, 1, 2),
  (1, 2, 1),
  (2, 3, 3);
