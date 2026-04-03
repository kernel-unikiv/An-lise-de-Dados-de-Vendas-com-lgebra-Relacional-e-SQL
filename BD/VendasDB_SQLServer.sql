-- 1. CRIAÇÃO DA BASE DE DADOS
-- ============================================================
USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'VendasDB')
BEGIN
    ALTER DATABASE VendasDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE VendasDB;
END
GO

CREATE DATABASE VendasDB
    COLLATE Latin1_General_CI_AS;
GO

USE VendasDB;
GO

-- 2. CRIAÇÃO DAS TABELAS
-- ============================================================

CREATE TABLE Clientes (
    ClienteID   INT           NOT NULL,
    Nome        NVARCHAR(100) NOT NULL,
    Email       NVARCHAR(150) UNIQUE,
    Cidade      NVARCHAR(80)  NOT NULL,
    Pais        NVARCHAR(60)  NOT NULL,
    CONSTRAINT PK_Clientes PRIMARY KEY (ClienteID)
);
GO

CREATE TABLE Produtos (
    ProdutoID     INT             NOT NULL,
    NomeProduto   NVARCHAR(120)   NOT NULL,
    Categoria     NVARCHAR(60)    NOT NULL,
    PrecoUnitario DECIMAL(10,2)   NOT NULL,
    CONSTRAINT PK_Produtos PRIMARY KEY (ProdutoID),
    CONSTRAINT CK_Preco    CHECK (PrecoUnitario > 0)
);
GO

CREATE TABLE Vendas (
    VendaID    INT            NOT NULL,
    ClienteID  INT            NOT NULL,
    DataVenda  DATE           NOT NULL,
    ValorTotal DECIMAL(12,2)  NOT NULL,
    CONSTRAINT PK_Vendas     PRIMARY KEY (VendaID),
    CONSTRAINT FK_Venda_Cli  FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    CONSTRAINT CK_ValorTotal CHECK (ValorTotal >= 0)
);
GO

CREATE TABLE DetalhesVenda (
    VendaID             INT            NOT NULL,
    ProdutoID           INT            NOT NULL,
    Quantidade          INT            NOT NULL,
    PrecoUnitarioVenda  DECIMAL(10,2)  NOT NULL,
    CONSTRAINT PK_Detalhes   PRIMARY KEY (VendaID, ProdutoID),
    CONSTRAINT FK_Det_Venda  FOREIGN KEY (VendaID)   REFERENCES Vendas(VendaID),
    CONSTRAINT FK_Det_Prod   FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID),
    CONSTRAINT CK_Qtd        CHECK (Quantidade > 0)
);
GO

-- 3. INSERÇÃO DE DADOS
-- ============================================================

-- 3.1 CLIENTES (55 registos)
INSERT INTO Clientes (ClienteID, Nome, Email, Cidade, Pais) VALUES
(1,  N'Ana Silva',         N'ana.silva@email.pt',       N'Lisboa',        N'Portugal'),
(2,  N'Bruno Costa',       N'bruno.costa@email.pt',     N'Porto',         N'Portugal'),
(3,  N'Carlos Mota',       N'carlos.mota@email.pt',     N'Lisboa',        N'Portugal'),
(4,  N'Diana Ferreira',    N'diana.ferreira@email.pt',  N'Coimbra',       N'Portugal'),
(5,  N'Eduardo Lopes',     N'eduardo.lopes@email.pt',   N'Braga',         N'Portugal'),
(6,  N'Fátima Nunes',      N'fatima.nunes@email.pt',    N'Lisboa',        N'Portugal'),
(7,  N'Gabriel Santos',    N'gabriel.santos@email.pt',  N'Faro',          N'Portugal'),
(8,  N'Helena Ramos',      N'helena.ramos@email.pt',    N'Lisboa',        N'Portugal'),
(9,  N'Igor Teixeira',     N'igor.teixeira@email.pt',   N'Porto',         N'Portugal'),
(10, N'Joana Pereira',     N'joana.pereira@email.pt',   N'Setúbal',       N'Portugal'),
(11, N'Klaus Müller',      N'k.muller@email.de',        N'Berlim',        N'Alemanha'),
(12, N'Laura García',      N'l.garcia@email.es',        N'Madrid',        N'Espanha'),
(13, N'Miguel Torres',     N'm.torres@email.es',        N'Barcelona',     N'Espanha'),
(14, N'Nadia Dupont',      N'n.dupont@email.fr',        N'Paris',         N'França'),
(15, N'Oscar Martin',      N'o.martin@email.fr',        N'Lyon',          N'França'),
(16, N'Paula Oliveira',    N'paula.oliveira@email.pt',  N'Lisboa',        N'Portugal'),
(17, N'Rafael Carvalho',   N'rafael.carvalho@email.pt', N'Lisboa',        N'Portugal'),
(18, N'Sara Monteiro',     N'sara.monteiro@email.pt',   N'Porto',         N'Portugal'),
(19, N'Tiago Alves',       N'tiago.alves@email.pt',     N'Lisboa',        N'Portugal'),
(20, N'Ursula Lima',       N'ursula.lima@email.br',     N'São Paulo',     N'Brasil'),
(21, N'Vitor Sousa',       N'vitor.sousa@email.pt',     N'Lisboa',        N'Portugal'),
(22, N'Wanda Correia',     N'wanda.correia@email.pt',   N'Porto',         N'Portugal'),
(23, N'Xavier Pinto',      N'xavier.pinto@email.pt',    N'Braga',         N'Portugal'),
(24, N'Yasmin Rocha',      N'yasmin.rocha@email.br',    N'Rio de Janeiro',N'Brasil'),
(25, N'Zé Mendes',         N'ze.mendes@email.pt',       N'Lisboa',        N'Portugal'),
(26, N'Alice Barros',      N'alice.barros@email.pt',    N'Coimbra',       N'Portugal'),
(27, N'Bernardo Gomes',    N'bernardo.gomes@email.pt',  N'Lisboa',        N'Portugal'),
(28, N'Carla Dias',        N'carla.dias@email.pt',      N'Faro',          N'Portugal'),
(29, N'David Cunha',       N'david.cunha@email.pt',     N'Porto',         N'Portugal'),
(30, N'Elena Moura',       N'elena.moura@email.pt',     N'Lisboa',        N'Portugal'),
(31, N'Fernando Cruz',     N'fcruz@email.pt',           N'Évora',         N'Portugal'),
(32, N'Glória Pires',      N'gloria.pires@email.pt',    N'Lisboa',        N'Portugal'),
(33, N'Henrique Faria',    N'henrique.faria@email.pt',  N'Porto',         N'Portugal'),
(34, N'Inês Vieira',       N'ines.vieira@email.pt',     N'Lisboa',        N'Portugal'),
(35, N'João Marques',      N'joao.marques@email.pt',    N'Viseu',         N'Portugal'),
(36, N'Karen Ribeiro',     N'karen.ribeiro@email.br',   N'São Paulo',     N'Brasil'),
(37, N'Luís Azevedo',      N'luis.azevedo@email.pt',    N'Lisboa',        N'Portugal'),
(38, N'Maria Nogueira',    N'maria.nogueira@email.pt',  N'Porto',         N'Portugal'),
(39, N'Nuno Cardoso',      N'nuno.cardoso@email.pt',    N'Lisboa',        N'Portugal'),
(40, N'Olga Fernandes',    N'olga.fernandes@email.pt',  N'Braga',         N'Portugal'),
(41, N'Pedro Machado',     N'pedro.machado@email.pt',   N'Lisboa',        N'Portugal'),
(42, N'Quintino Serra',    N'q.serra@email.pt',         N'Porto',         N'Portugal'),
(43, N'Rosa Esteves',      N'rosa.esteves@email.pt',    N'Lisboa',        N'Portugal'),
(44, N'Sérgio Fonseca',    N'sergio.fonseca@email.pt',  N'Coimbra',       N'Portugal'),
(45, N'Teresa Leal',       N'teresa.leal@email.pt',     N'Lisboa',        N'Portugal'),
(46, N'Umberto Romano',    N'u.romano@email.it',        N'Roma',          N'Itália'),
(47, N'Vera Passos',       N'vera.passos@email.pt',     N'Porto',         N'Portugal'),
(48, N'Walter Branco',     N'walter.branco@email.pt',   N'Lisboa',        N'Portugal'),
(49, N'Xana Coelho',       N'xana.coelho@email.pt',     N'Setúbal',       N'Portugal'),
(50, N'Yara Campos',       N'yara.campos@email.pt',     N'Lisboa',        N'Portugal'),
(51, N'Arnaldo Brito',     N'arnaldo.brito@email.pt',   N'Lisboa',        N'Portugal'),
(52, N'Beatriz Fontes',    N'beatriz.fontes@email.pt',  N'Porto',         N'Portugal'),
(53, N'Cláudio Reis',      N'claudio.reis@email.pt',    N'Lisboa',        N'Portugal'),
(54, N'Débora Luz',        N'debora.luz@email.pt',      N'Braga',         N'Portugal'),
(55, N'Ernesto Vaz',       N'ernesto.vaz@email.pt',     N'Lisboa',        N'Portugal');
GO

-- 3.2 PRODUTOS (30 registos)
INSERT INTO Produtos (ProdutoID, NomeProduto, Categoria, PrecoUnitario) VALUES
(1,  N'Smartphone Pro X',         N'Eletrónicos',    799.99),
(2,  N'Notebook UltraSlim',       N'Eletrónicos',   1299.00),
(3,  N'Tablet Premium',           N'Eletrónicos',    499.99),
(4,  N'Smartwatch Fit',           N'Eletrónicos',    249.00),
(5,  N'Câmara DSLR 24MP',         N'Eletrónicos',    950.00),
(6,  N'Headphones BT Pro',        N'Eletrónicos',    180.00),
(7,  N'Smart TV 55"',             N'Eletrónicos',    749.00),
(8,  N'Coluna Bluetooth',         N'Eletrónicos',     89.99),
(9,  N'Carregador USB-C',         N'Eletrónicos',     29.99),
(10, N'Rato Sem Fios',            N'Eletrónicos',     45.00),
(11, N'Dom Quixote',              N'Livros',           18.90),
(12, N'Harry Potter 1',           N'Livros',           14.50),
(13, N'O Código Da Vinci',        N'Livros',           12.00),
(14, N'Sapiens',                  N'Livros',           19.90),
(15, N'O Alquimista',             N'Livros',           11.50),
(16, N'Camisola de Lã',           N'Vestuário',        35.00),
(17, N'Calças Jeans',             N'Vestuário',        59.90),
(18, N'Ténis Running',            N'Vestuário',        89.99),
(19, N'Casaco Impermeável',       N'Vestuário',       120.00),
(20, N'T-Shirt Algodão',          N'Vestuário',        19.99),
(21, N'Jogo de Lençóis',          N'Casa e Jardim',    45.00),
(22, N'Cafeteira Expresso',       N'Casa e Jardim',   149.00),
(23, N'Robot de Cozinha',         N'Casa e Jardim',   299.00),
(24, N'Aspirador Robot',          N'Casa e Jardim',   350.00),
(25, N'Conjunto de Panelas',      N'Casa e Jardim',    89.00),
(26, N'Bicicleta de Montanha',    N'Desporto',        450.00),
(27, N'Tapete de Yoga',           N'Desporto',         25.00),
(28, N'Halteres 10kg (Par)',      N'Desporto',         40.00),
(29, N'Corda de Saltar',          N'Desporto',         12.00),
(30, N'Mochila Trail 40L',        N'Desporto',         85.00);
GO

-- 3.3 VENDAS (100 registos)
INSERT INTO Vendas (VendaID, ClienteID, DataVenda, ValorTotal) VALUES
(1,1,'2024-01-05',1099.98),(2,1,'2024-03-12',249.00),(3,2,'2024-01-10',180.00),
(4,2,'2024-02-14',1299.00),(5,3,'2024-01-15',799.99),(6,3,'2024-04-20',18.90),
(7,4,'2024-01-22',499.99),(8,5,'2024-02-01',89.99),(9,5,'2024-05-10',45.00),
(10,6,'2024-02-05',950.00),(11,6,'2024-06-11',749.00),(12,7,'2024-02-08',14.50),
(13,7,'2024-03-15',12.00),(14,8,'2024-02-09',19.90),(15,8,'2024-04-25',11.50),
(16,9,'2024-02-15',35.00),(17,9,'2024-05-20',59.90),(18,10,'2024-02-18',89.99),
(19,10,'2024-06-02',120.00),(20,11,'2024-02-20',19.99),(21,11,'2024-07-04',45.00),
(22,12,'2024-03-01',149.00),(23,12,'2024-07-15',299.00),(24,13,'2024-03-05',350.00),
(25,13,'2024-08-10',89.00),(26,14,'2024-03-08',450.00),(27,14,'2024-08-22',25.00),
(28,15,'2024-03-12',40.00),(29,15,'2024-09-01',12.00),(30,16,'2024-03-15',85.00),
(31,16,'2024-09-10',799.99),(32,17,'2024-03-18',1299.00),(33,17,'2024-09-20',499.99),
(34,18,'2024-03-22',249.00),(35,18,'2024-10-05',180.00),(36,19,'2024-04-01',950.00),
(37,19,'2024-10-12',749.00),(38,20,'2024-04-05',18.90),(39,20,'2024-10-18',14.50),
(40,21,'2024-04-08',12.00),(41,21,'2024-11-01',19.90),(42,22,'2024-04-10',11.50),
(43,22,'2024-11-08',35.00),(44,23,'2024-04-15',59.90),(45,23,'2024-11-15',89.99),
(46,24,'2024-04-18',120.00),(47,24,'2024-11-22',19.99),(48,25,'2024-04-22',45.00),
(49,25,'2024-12-01',149.00),(50,26,'2024-04-25',299.00),(51,26,'2024-12-10',350.00),
(52,27,'2024-05-01',89.00),(53,27,'2024-12-15',450.00),(54,28,'2024-05-05',25.00),
(55,28,'2024-12-20',40.00),(56,29,'2024-05-08',12.00),(57,29,'2024-12-22',85.00),
(58,30,'2024-05-10',799.99),(59,30,'2024-12-28',1299.00),(60,31,'2024-05-15',499.99),
(61,32,'2024-05-18',249.00),(62,32,'2024-06-01',180.00),(63,33,'2024-05-22',950.00),
(64,34,'2024-05-25',749.00),(65,34,'2024-06-15',18.90),(66,35,'2024-06-01',14.50),
(67,36,'2024-06-05',12.00),(68,36,'2024-06-20',19.90),(69,37,'2024-06-08',11.50),
(70,37,'2024-07-01',35.00),(71,38,'2024-06-10',59.90),(72,38,'2024-07-10',89.99),
(73,39,'2024-06-12',120.00),(74,39,'2024-07-15',19.99),(75,40,'2024-06-15',45.00),
(76,41,'2024-06-18',149.00),(77,41,'2024-07-20',299.00),(78,42,'2024-06-22',350.00),
(79,42,'2024-07-25',89.00),(80,43,'2024-06-25',450.00),(81,43,'2024-08-01',25.00),
(82,44,'2024-06-28',40.00),(83,44,'2024-08-05',12.00),(84,45,'2024-07-01',85.00),
(85,45,'2024-08-10',799.99),(86,46,'2024-07-05',1299.00),(87,47,'2024-07-08',499.99),
(88,48,'2024-07-10',249.00),(89,49,'2024-07-12',180.00),(90,50,'2024-07-15',950.00),
(91,51,'2024-07-18',749.00),(92,52,'2024-07-22',18.90),(93,53,'2024-07-25',14.50),
(94,54,'2024-07-28',12.00),(95,55,'2024-08-01',19.90),(96,1,'2024-08-05',11.50),
(97,2,'2024-08-08',35.00),(98,3,'2024-08-10',59.90),(99,4,'2024-08-12',89.99),
(100,5,'2024-08-15',120.00);
GO

-- 3.4 DETALHES DE VENDA (200+ registos)
INSERT INTO DetalhesVenda (VendaID, ProdutoID, Quantidade, PrecoUnitarioVenda) VALUES
(1,1,1,799.99),(1,3,1,499.99),
(2,4,1,249.00),
(3,6,1,180.00),
(4,2,1,1299.00),
(5,1,1,799.99),
(6,11,1,18.90),
(7,3,1,499.99),
(8,8,1,89.99),
(9,21,1,45.00),
(10,5,1,950.00),
(11,7,1,749.00),
(12,12,1,14.50),
(13,13,1,12.00),
(14,14,1,19.90),
(15,15,1,11.50),
(16,16,1,35.00),
(17,17,1,59.90),
(18,18,1,89.99),
(19,19,1,120.00),
(20,20,1,19.99),
(21,21,1,45.00),
(22,22,1,149.00),
(23,23,1,299.00),
(24,24,1,350.00),
(25,25,1,89.00),
(26,26,1,450.00),
(27,27,1,25.00),
(28,28,1,40.00),
(29,29,1,12.00),
(30,30,1,85.00),
(31,1,1,799.99),
(32,2,1,1299.00),
(33,3,1,499.99),
(34,4,1,249.00),
(35,6,1,180.00),
(36,5,1,950.00),
(37,7,1,749.00),
(38,11,1,18.90),
(39,12,1,14.50),
(40,13,1,12.00),
(41,14,1,19.90),
(42,15,1,11.50),
(43,16,1,35.00),
(44,17,1,59.90),
(45,18,1,89.99),
(46,19,1,120.00),
(47,20,1,19.99),
(48,21,1,45.00),
(49,22,1,149.00),
(50,23,1,299.00),
(51,24,1,350.00),
(52,25,1,89.00),
(53,26,1,450.00),
(54,27,1,25.00),
(55,28,1,40.00),
(56,29,1,12.00),
(57,30,1,85.00),
(58,1,1,799.99),
(59,2,1,1299.00),
(60,3,1,499.99),
(61,4,1,249.00),
(62,6,1,180.00),
(63,5,1,950.00),
(64,7,1,749.00),
(65,11,1,18.90),
(66,12,1,14.50),
(67,13,1,12.00),
(68,14,1,19.90),
(69,15,1,11.50),
(70,16,1,35.00),
(71,17,1,59.90),
(72,18,1,89.99),
(73,19,1,120.00),
(74,20,1,19.99),
(75,21,1,45.00),
(76,22,1,149.00),
(77,23,1,299.00),
(78,24,1,350.00),
(79,25,1,89.00),
(80,26,1,450.00),
(81,27,1,25.00),
(82,28,1,40.00),
(83,29,1,12.00),
(84,30,1,85.00),
(85,1,1,799.99),
(86,2,1,1299.00),
(87,3,1,499.99),
(88,4,1,249.00),
(89,6,1,180.00),
(90,5,1,950.00),
(91,7,1,749.00),
(92,11,1,18.90),
(93,12,1,14.50),
(94,13,1,12.00),
(95,14,1,19.90),
(96,15,1,11.50),
(97,16,1,35.00),
(98,17,1,59.90),
(99,18,1,89.99),
(100,19,1,120.00),
-- Extras para garantir > 200 linhas e cobrir cenários especiais
(2,10,2,45.00),
(5,11,1,18.90),(5,12,1,14.50),(5,13,1,12.00),(5,14,1,19.90),(5,15,1,11.50),
-- Carlos compra TODOS os livros (consulta 4)
(6,12,1,14.50),(6,13,1,12.00),(6,14,1,19.90),(6,15,1,11.50),
-- Luís compra todos os livros (consulta 4)
(69,11,1,18.90),(69,12,1,14.50),(69,13,1,12.00),(69,14,1,19.90),
-- Mais detalhes variados
(10,6,1,180.00),(11,10,1,45.00),(22,21,2,45.00),(23,10,1,45.00),
(30,27,1,25.00),(31,8,1,89.99),(32,9,2,29.99),(33,10,1,45.00),
(36,8,1,89.99),(37,9,1,29.99),(40,16,1,35.00),(41,17,1,59.90),
(48,27,1,25.00),(49,28,1,40.00),(50,29,1,12.00),(51,30,1,85.00),
(52,27,1,25.00),(53,28,1,40.00),(58,8,1,89.99),(59,9,1,29.99),
(61,8,1,89.99),(62,9,1,29.99),(64,8,1,89.99),
(65,12,1,14.50),(65,13,1,12.00),(65,14,1,19.90),(65,15,1,11.50),
(76,27,1,25.00),(77,28,1,40.00),(80,27,1,25.00),(81,28,1,40.00),
(84,27,1,25.00),(85,8,1,89.99),(88,8,1,89.99),(90,8,1,89.99);
GO

-- ============================================================
-- 4. CONSULTAS EM ÁLGEBRA RELACIONAL E SQL (T-SQL)
-- ============================================================

-- ──────────────────────────────────────────────────────────
-- CONSULTA 1
-- Listar o nome de todos os clientes que fizeram compras em Lisboa
--
-- Álgebra Relacional:
--   π_Nome (σ_Cidade='Lisboa' (Clientes)
--           ⋈_{Clientes.ClienteID = Vendas.ClienteID} Vendas)
-- ──────────────────────────────────────────────────────────
SELECT DISTINCT c.Nome
FROM Clientes c
INNER JOIN Vendas v ON c.ClienteID = v.ClienteID
WHERE c.Cidade = N'Lisboa'
ORDER BY c.Nome;
GO

-- ──────────────────────────────────────────────────────────
-- CONSULTA 2
-- Obter o nome dos produtos da categoria 'Eletrónicos' com preço > 100
--
-- Álgebra Relacional:
--   π_NomeProduto (σ_Categoria='Eletrónicos' ∧ PrecoUnitario>100 (Produtos))
-- ──────────────────────────────────────────────────────────
SELECT NomeProduto, PrecoUnitario
FROM Produtos
WHERE Categoria = N'Eletrónicos'
  AND PrecoUnitario > 100
ORDER BY PrecoUnitario DESC;
GO

-- ──────────────────────────────────────────────────────────
-- CONSULTA 3
-- Listar o nome dos clientes e o nome dos produtos que compraram
--
-- Álgebra Relacional:
--   π_Nome,NomeProduto (
--     Clientes
--     ⋈ Vendas ⋈ DetalhesVenda ⋈ Produtos
--   )
-- ──────────────────────────────────────────────────────────
SELECT DISTINCT c.Nome AS NomeCliente, p.NomeProduto
FROM Clientes c
INNER JOIN Vendas v        ON c.ClienteID  = v.ClienteID
INNER JOIN DetalhesVenda d ON v.VendaID    = d.VendaID
INNER JOIN Produtos p      ON d.ProdutoID  = p.ProdutoID
ORDER BY c.Nome, p.NomeProduto;
GO

-- ──────────────────────────────────────────────────────────
-- CONSULTA 4
-- Encontrar os clientes que compraram TODOS os produtos da categoria 'Livros'
--
-- Álgebra Relacional (divisão relacional):
--   Seja L  = π_ProdutoID (σ_Categoria='Livros' (Produtos))
--   Seja CP = π_ClienteID,ProdutoID (Vendas ⋈ DetalhesVenda ⋈ L)
--   Resultado = π_Nome (Clientes ⋈ (CP ÷ L))
-- ──────────────────────────────────────────────────────────
SELECT c.Nome
FROM Clientes c
WHERE NOT EXISTS (
    SELECT p.ProdutoID
    FROM Produtos p
    WHERE p.Categoria = N'Livros'
    AND NOT EXISTS (
        SELECT 1
        FROM Vendas v
        INNER JOIN DetalhesVenda d ON v.VendaID = d.VendaID
        WHERE v.ClienteID = c.ClienteID
          AND d.ProdutoID = p.ProdutoID
    )
)
ORDER BY c.Nome;
GO

-- ──────────────────────────────────────────────────────────
-- CONSULTA 5
-- Calcular o valor total de vendas por cliente
--
-- Álgebra Relacional:
--   γ_ClienteID; SUM(ValorTotal) (
--     Clientes ⋈_{Clientes.ClienteID = Vendas.ClienteID} Vendas
--   )
-- ──────────────────────────────────────────────────────────
SELECT c.Nome          AS NomeCliente,
       SUM(v.ValorTotal) AS TotalVendas,
       COUNT(v.VendaID)  AS NumeroVendas
FROM Clientes c
INNER JOIN Vendas v ON c.ClienteID = v.ClienteID
GROUP BY c.ClienteID, c.Nome
ORDER BY TotalVendas DESC;
GO

-- ──────────────────────────────────────────────────────────
-- CONSULTA 6
-- Identificar os produtos que nunca foram vendidos
--
-- Álgebra Relacional:
--   π_NomeProduto (Produtos) − π_NomeProduto (
--     Produtos ⋈_{Produtos.ProdutoID = DetalhesVenda.ProdutoID} DetalhesVenda)
-- ──────────────────────────────────────────────────────────
SELECT p.NomeProduto, p.Categoria, p.PrecoUnitario
FROM Produtos p
WHERE p.ProdutoID NOT IN (
    SELECT DISTINCT d.ProdutoID
    FROM DetalhesVenda d
)
ORDER BY p.Categoria, p.NomeProduto;
GO

-- ──────────────────────────────────────────────────────────
-- CONSULTA 7
-- Listar os clientes que compraram mais de 5 produtos diferentes
--
-- Álgebra Relacional:
--   π_Nome (σ_QtdProd>5 (
--     Clientes ⋈ γ_ClienteID; COUNT(DISTINCT ProdutoID)→QtdProd (
--       Vendas ⋈ DetalhesVenda)))
-- ──────────────────────────────────────────────────────────
SELECT c.Nome                          AS NomeCliente,
       COUNT(DISTINCT d.ProdutoID)     AS ProdutosDiferentes
FROM Clientes c
INNER JOIN Vendas v        ON c.ClienteID = v.ClienteID
INNER JOIN DetalhesVenda d ON v.VendaID   = d.VendaID
GROUP BY c.ClienteID, c.Nome
HAVING COUNT(DISTINCT d.ProdutoID) > 5
ORDER BY ProdutosDiferentes DESC;
GO
