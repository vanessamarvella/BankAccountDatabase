CREATE DATABASE BANK

USE BANK

-- CREATE TABLE

CREATE TABLE BranchType(
BranchTypeID CHAR(5) PRIMARY KEY CHECK(BranchTypeID LIKE 'BT[0-9][0-9][0-9]'), 
BranchType VARCHAR(100)
)

CREATE TABLE Branch(
BranchID CHAR(5) PRIMARY KEY CHECK(BranchID LIKE 'BR[0-9][0-9][0-9]'), 
BranchTypeID CHAR (5) REFERENCES BranchType(BranchTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchAddress VARCHAR(200)
)

CREATE TABLE CustomerType(
CustomerTypeID CHAR(5) PRIMARY KEY CHECK(CustomerTypeID LIKE 'CT[0-9][0-9][0-9]'),
CustomerType VARCHAR(100)
)

CREATE TABLE Customer(
CIF CHAR(5) PRIMARY KEY CHECK(CIF LIKE 'CU[0-9][0-9][0-9]'), 
BranchID CHAR (5) REFERENCES Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
CustomerTypeID CHAR (5) REFERENCES CustomerType(CustomerTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
CustomerName VARCHAR(150)
)

CREATE TABLE DepositoAccountType(
DepositoAccountTypeID CHAR(5) PRIMARY KEY CHECK(DepositoAccountTypeID LIKE 'DA[0-9][0-9][0-9]'),
DepositoAccountType VARCHAR(100)
)

CREATE TABLE DepositoAccountDetails(
DepositoAccountDetailsID CHAR(5) PRIMARY KEY CHECK(DepositoAccountDetailsID LIKE 'DD[0-9][0-9][0-9]'),
Nisbah FLOAT,
EquivalentRate FLOAT,
DispositionAccountNumber_Principal CHAR(10) CHECK(DispositionAccountNumber_Principal LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
TimeDepositTerm INT,
ProfitDistributionPaymentTerm INT,
AutomaticRollOver CHAR(1) CHECK(AutomaticRollOver IN ('Y','N')),
IslamicContract VARCHAR(100),
Zakat CHAR(1) CHECK(Zakat IN ('Y','N'))
)


CREATE TABLE DepositoAccount(
DepositoAccountNumber CHAR(15) PRIMARY KEY CHECK(DepositoAccountNumber LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
DepositoAccountDetailsID CHAR (5) REFERENCES DepositoAccountDetails(DepositoAccountDetailsID) ON UPDATE CASCADE ON DELETE CASCADE,
DepositoAccountTypeID CHAR (5) REFERENCES DepositoAccountType(DepositoAccountTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
DepositoAccountName VARCHAR(150),
DepositoBalance INT,
StartDate DATE,
EndDate DATE,
)

CREATE TABLE CustomerDetails(
CIF CHAR (5) REFERENCES Customer(CIF) ON UPDATE CASCADE ON DELETE CASCADE,
DepositoAccountNumber CHAR (15) REFERENCES DepositoAccount(DepositoAccountNumber) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (CIF, DepositoAccountNumber)
)

-- INSERT DATA
INSERT INTO BranchType VALUES 
('BT001', 'General'),
('BT002', 'Development'),
('BT003', 'Rural')

INSERT INTO Branch VALUES 
('BR001', 'BT001', 'Jakarta'),
('BR002', 'BT002', 'Surabaya'),
('BR003', 'BT002', 'Malang'),
('BR004', 'BT003', 'Tangerang'),
('BR005', 'BT001', 'Bali'),
('BR006', 'BT003', 'Bandung'),
('BR007', 'BT002', 'Banjarmasin'),
('BR008', 'BT001', 'Papua'),
('BR009', 'BT003', 'Yogyakarta'),
('BR010', 'BT003', 'Semarang')

INSERT INTO CustomerType VALUES 
('CT001', 'General'),
('CT002', 'Priority')

INSERT INTO Customer VALUES
('CU001', 'BR004', 'CT001', 'Yuliana Khosasi'),
('CU002', 'BR001', 'CT001', 'Hanna Jarina'),
('CU003', 'BR004', 'CT002', 'Garren Hunter'),
('CU004', 'BR002', 'CT001', 'Putri Niasih'),
('CU005', 'BR010', 'CT002', 'Salsa Ningrat'),
('CU006', 'BR004', 'CT002', 'Jimmy Rent'),
('CU007', 'BR003', 'CT001', 'Sherina Putri'),
('CU008', 'BR001', 'CT002', 'Natalia Simanjuntak'),
('CU009', 'BR009', 'CT002', 'Firzal Putra'),
('CU010', 'BR005', 'CT001', 'Edward Saputra')

INSERT INTO DepositoAccountType VALUES
('DA001', 'TB IB CLICKS'),
('DA002', 'TB IB MOBILE')

INSERT INTO DepositoAccountDetails VALUES 
('DD001', 4.52, 3.97, '0984567543', 3, 3, 'Y', 'Mudharabah', 'N'),
('DD002',  3.76, 3.66, '0345234876', 1, 1, 'N', 'Mudharabah', 'N'),
('DD003', 3.65, 3.51, '0345234876', 3, 3, 'Y', 'Musharakah', 'Y'),
('DD004', 3.87, 3.71, '0867512398', 3, 3, 'Y', 'Murabahah ', 'Y'),
('DD005', 3.32, 3.69, '0873452376', 1, 1, 'N', 'Mudharabah', 'Y'),
('DD006',  4.48, 3.66, '0345234876', 3, 3, 'N', 'Murabahah ', 'N'),
('DD007', 3.97, 3.54, '0345234876', 1, 1, 'Y', 'Musharakah', 'N' ),
('DD008',  3.76, 4.32, '0765287654', 3, 3, 'N', 'Murabahah', 'Y'),
('DD009',  3.65, 4.21, '0634217865', 1, 1, 'Y', 'Murabahah', 'Y'),
('DD010', 3.65, 4.43,'0746375673', 3, 3, 'N', 'Murabahah', 'N'),
('DD011', 3.47, 4.11,'0863876512', 1, 1, 'N', 'Murabahah', 'N' ),
('DD012', 3.76, 4.43,'0914264789', 3, 3, 'Y', 'Murabahah', 'Y'),
('DD013',  3.98, 4.12,'0767381009', 1, 1, 'Y', 'Murabahah', 'N')

INSERT INTO DepositoAccount VALUES 
('678543217654389', 'DD001', 'DA002', 'Yuliana Khosasi', 20000000, '2020-02-20', '2020-08-20'),
('647495764597462', 'DD002', 'DA001', 'Garren Hunter', 30000000, '2020-03-23', '2020-12-23'),
('654232841374147', 'DD003', 'DA002', 'Garren Hunter', 35000000, '2020-05-30', '2020-11-30'),
('613244755483453', 'DD004', 'DA002', 'Putri Niasih', 25000000, '2020-04-12', '2020-10-12'),
('693294563720143', 'DD005', 'DA001', 'Hanna Jarina', 20000000, '2020-05-14', '2020-11-14'),
('632786147468769', 'DD006', 'DA002', 'Garren Hunter', 26000000, '2020-05-22', '2020-11-22'),
('674325362374234', 'DD007', 'DA001', 'Garren Hunter', 37000000, '2020-07-13', '2020-11-13'),
('653271847234832', 'DD008', 'DA002', 'Salsa Ningrat', 45000000, '2020-03-09', '2021-12-09'),
('623848493489231', 'DD009', 'DA002', 'Jimmy Rent', 30000000, '2020-09-13', '2020-11-13'),
('644567546436780', 'DD010', 'DA001', 'Sherina Putri', 46000000, '2020-05-19', '2021-02-19'),
('613784264233567', 'DD011', 'DA001', 'Natalia Simanjuntak', 22000000, '2020-02-11', '2021-05-11'),
('653843147190914', 'DD012', 'DA002', 'Firzal Putra', 13000000, '2020-05-24', '2021-11-24'),
('683924829342384', 'DD013', 'DA002', 'Edward Saputra', 27000000, '2020-05-22', '2021-08-22')


INSERT INTO CustomerDetails VALUES
('CU001', '678543217654389'),
('CU003', '647495764597462'),
('CU003', '654232841374147'),
('CU004', '613244755483453'),
('CU002', '693294563720143'),
('CU003', '632786147468769'),
('CU003', '674325362374234'),
('CU005', '653271847234832'),
('CU006', '623848493489231'),
('CU007', '644567546436780'),
('CU008', '613784264233567'),
('CU009', '653843147190914'),
('CU010', '683924829342384')

-- ANSWER
-- 4
-- a
SELECT dd.DepositoAccountDetailsID, dd.Nisbah, dd.EquivalentRate, dd.DispositionAccountNumber_Principal, dd.TimeDepositTerm,
dd.ProfitDistributionPaymentTerm, dd.AutomaticRollOver, dd.IslamicContract, dd.Zakat
FROM DepositoAccountDetails dd JOIN DepositoAccount da ON dd.DepositoAccountDetailsID = da.DepositoAccountDetailsID
JOIN CustomerDetails cd ON da.DepositoAccountNumber = cd.DepositoAccountNumber
JOIN Customer c ON c.CIF = cd.CIF
JOIN Branch b ON c.BranchID = b.BranchID
WHERE b.BranchAddress LIKE 'Surabaya'


-- b
SELECT c.CIF, c.CustomerName FROM Customer c JOIN CustomerDetails cd ON c.CIF = cd.CIF
JOIN DepositoAccount da ON da.DepositoAccountNumber = cd.DepositoAccountNumber
GROUP BY c.CIF, c.CustomerName
HAVING COUNT(da.DepositoAccountNumber) > 3


-- 5
-- a
SELECT * FROM Customer
WHERE BranchID NOT IN 
	(
	SELECT BranchID FROM Branch
	WHERE BranchAddress LIKE 'Jakarta'
	)

-- b
SELECT da.DepositoAccountNumber, da.DepositoAccountDetailsID, da.DepositoAccountTypeID, da.DepositoAccountName,
da.DepositoBalance, da.StartDate, da.EndDate
FROM DepositoAccount da 
JOIN CustomerDetails cd ON da.DepositoAccountNumber = cd.DepositoAccountNumber
JOIN Customer c ON c.CIF = cd.CIF
WHERE c.BranchID IN
	(
	SELECT BranchID FROM Branch
	WHERE BranchAddress IN ('Jakarta', 'Tangerang')
	)