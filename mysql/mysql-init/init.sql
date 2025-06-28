-- Create the database
CREATE DATABASE IF NOT EXISTS ecommerceproductsdatabase;
USE ecommerceproductsdatabase;

-- Create the products table
CREATE TABLE IF NOT EXISTS Products (
  ProductID char(36) NOT NULL,
  ProductName varchar(50) NOT NULL,
  Category varchar(50) DEFAULT NULL,
  ProductDescription varchar(150) DEFAULT NULL,
  ProductImage varchar(80) DEFAULT NULL,
  UnitPrice decimal(10,2) DEFAULT NULL,
  QuantityInStock int DEFAULT NULL,
  PRIMARY KEY (ProductID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create an index on the ProductName column
CREATE INDEX idx_productname ON Products (ProductName);

-- Create an index on the Category column
CREATE INDEX idx_category ON Products (Category);

-- Insert 12 sample rows into the products table with specified categories
 INSERT INTO Products (ProductID, ProductName, Category, UnitPrice, QuantityInStock) VALUES
  ('1a9df78b-3f46-4c3d-9f2a-1b9f69292a77', 'Chargeuse sur pneus', 1, 150000.00, 10),
  ('2c8e8e7c-97a3-4b11-9a1b-4dbe681cfe17', 'Remorqueuse', 1, 80000.00, 8),
  ('3f3e8b3a-4a50-4cd0-8d8e-1e178ae2cfc1', 'Bétonnière', 1, 50000.00, 15),
  ('4c9b6f71-6c5d-485f-8db2-58011a236b63', 'Niveleuse', 1, 120000.00, 5),
  ('5d7e36bf-65c3-4a71-bf97-740d561d8b65', 'Grue mobile', 1, 250000.00, 3),
  ('6a14f510-72c1-42c8-9a5a-8ef8f3f45a0d', 'Tracteur de chantier', 1, 95000.00, 12),
  ('7b39ef14-932b-4c84-9187-55b748d2b28f', 'Pelle hydraulique', 1, 180000.00, 6),
  ('8c5f6e73-68fc-49d9-99b4-aecc3706a4f4', 'Compacteur', 1, 75000.00, 9),
  ('9e7e7085-6f4e-4921-8f15-c59f084080f9', 'Chariot élévateur', 1, 60000.00, 20),
  ('10d7b110-ecdb-4921-85a4-58a5d1b32bf4', 'Bulldozer', 1, 200000.00, 4),
  ('11f2e86a-9d5d-42f9-b3c2-3e4d652e3df8', 'Chariot télescopique', 1, 110000.00, 7),
  ('12b369b7-9101-41b1-a653-6c6c9a4fe1e4', 'Mini-pelle', 1, 85000.00, 10);
