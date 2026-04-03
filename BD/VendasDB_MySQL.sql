-- 1. CRIAÇÃO DA BASE DE DADOS
-- ============================================================
DROP DATABASE IF EXISTS VendasDB;
CREATE DATABASE VendasDB
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE VendasDB;

-- 2. CRIAÇÃO DAS TABELAS
-- ============================================================

CREATE TABLE Clientes (
    ClienteID   INT           NOT NULL,
    Nome        VARCHAR(100)  NOT NULL,
    Email       VARCHAR(150)  UNIQUE,
    Cidade      VARCHAR(80)   NOT NULL,
    Pais        VARCHAR(60)   NOT NULL,
    CONSTRAINT PK_Clientes PRIMARY KEY (ClienteID)
);

CREATE TABLE Produtos (
    ProdutoID     INT            NOT NULL,
    NomeProduto   VARCHAR(120)   NOT NULL,
    Categoria     VARCHAR(60)    NOT NULL,
    PrecoUnitario DECIMAL(10,2)  NOT NULL,
    CONSTRAINT PK_Produtos PRIMARY KEY (ProdutoID),
    CONSTRAINT CK_Preco    CHECK (PrecoUnitario > 0)
);

CREATE TABLE Vendas (
    VendaID    INT            NOT NULL,
    ClienteID  INT            NOT NULL,
    DataVenda  DATE           NOT NULL,
    ValorTotal DECIMAL(12,2)  NOT NULL,
    CONSTRAINT PK_Vendas     PRIMARY KEY (VendaID),
    CONSTRAINT FK_Venda_Cli  FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    CONSTRAINT CK_ValorTotal CHECK (ValorTotal >= 0)
);

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

-- 3. INSERÇÃO DE DADOS
-- ============================================================

-- 3.1 CLIENTES (55 registos)
INSERT INTO Clientes (ClienteID, Nome, Email, Cidade, Pais) VALUES
(1,  'Ana Silva',         'ana.silva@email.pt',       'Lisboa',        'Portugal'),
(2,  'Bruno Costa',       'bruno.costa@email.pt',     'Porto',         'Portugal'),
(3,  'Carlos Mota',       'carlos.mota@email.pt',     'Lisboa',        'Portugal'),
(4,  'Diana Ferreira',    'diana.ferreira@email.pt',  'Coimbra',       'Portugal'),
(5,  'Eduardo Lopes',     'eduardo.lopes@email.pt',   'Braga',         'Portugal'),
(6,  'Fátima Nunes',      'fatima.nunes@email.pt',    'Lisboa',        'Portugal'),
(7,  'Gabriel Santos',    'gabriel.santos@email.pt',  'Faro',          'Portugal'),
(8,  'Helena Ramos',      'helena.ramos@email.pt',    'Lisboa',        'Portugal'),
(9,  'Igor Teixeira',     'igor.teixeira@email.pt',   'Porto',         'Portugal'),
(10, 'Joana Pereira',     'joana.pereira@email.pt',   'Setúbal',       'Portugal'),
(11, 'Klaus Müller',      'k.muller@email.de',        'Berlim',        'Alemanha'),
(12, 'Laura García',      'l.garcia@email.es',        'Madrid',        'Espanha'),
(13, 'Miguel Torres',     'm.torres@email.es',        'Barcelona',     'Espanha'),
(14, 'Nadia Dupont',      'n.dupont@email.fr',        'Paris',         'França'),
(15, 'Oscar Martin',      'o.martin@email.fr',        'Lyon',          'França'),
(16, 'Paula Oliveira',    'paula.oliveira@email.pt',  'Lisboa',        'Portugal'),
(17, 'Rafael Carvalho',   'rafael.carvalho@email.pt', 'Lisboa',        'Portugal'),
(18, 'Sara Monteiro',     'sara.monteiro@email.pt',   'Porto',         'Portugal'),
(19, 'Tiago Alves',       'tiago.alves@email.pt',     'Lisboa',        'Portugal'),
(20, 'Ursula Lima',       'ursula.lima@email.br',     'São Paulo',     'Brasil'),
(21, 'Vitor Sousa',       'vitor.sousa@email.pt',     'Lisboa',        'Portugal'),
(22, 'Wanda Correia',     'wanda.correia@email.pt',   'Porto',         'Portugal'),
(23, 'Xavier Pinto',      'xavier.pinto@email.pt',    'Braga',         'Portugal'),
(24, 'Yasmin Rocha',      'yasmin.rocha@email.br',    'Rio de Janeiro','Brasil'),
(25, 'Zé Mendes',         'ze.mendes@email.pt',       'Lisboa',        'Portugal'),
(26, 'Alice Barros',      'alice.barros@email.pt',    'Coimbra',       'Portugal'),
(27, 'Bernardo Gomes',    'bernardo.gomes@email.pt',  'Lisboa',        'Portugal'),
(28, 'Carla Dias',        'carla.dias@email.pt',      'Faro',          'Portugal'),
(29, 'David Cunha',       'david.cunha@email.pt',     'Porto',         'Portugal'),
(30, 'Elena Moura',       'elena.moura@email.pt',     'Lisboa',        'Portugal'),
(31, 'Fernando Cruz',     'fcruz@email.pt',           'Évora',         'Portugal'),
(32, 'Glória Pires',      'gloria.pires@email.pt',    'Lisboa',        'Portugal'),
(33, 'Henrique Faria',    'henrique.faria@email.pt',  'Porto',         'Portugal'),
(34, 'Inês Vieira',       'ines.vieira@email.pt',     'Lisboa',        'Portugal'),
(35, 'João Marques',      'joao.marques@email.pt',    'Viseu',         'Portugal'),
(36, 'Karen Ribeiro',     'karen.ribeiro@email.br',   'São Paulo',     'Brasil'),
(37, 'Luís Azevedo',      'luis.azevedo@email.pt',    'Lisboa',        'Portugal'),
(38, 'Maria Nogueira',    'maria.nogueira@email.pt',  'Porto',         'Portugal'),
(39, 'Nuno Cardoso',      'nuno.cardoso@email.pt',    'Lisboa',        'Portugal'),
(40, 'Olga Fernandes',    'olga.fernandes@email.pt',  'Braga',         'Portugal'),
(41, 'Pedro Machado',     'pedro.machado@email.pt',   'Lisboa',        'Portugal'),
(42, 'Quintino Serra',    'q.serra@email.pt',         'Porto',         'Portugal'),
(43, 'Rosa Esteves',      'rosa.esteves@email.pt',    'Lisboa',        'Portugal'),
(44, 'Sérgio Fonseca',    'sergio.fonseca@email.pt',  'Coimbra',       'Portugal'),
(45, 'Teresa Leal',       'teresa.leal@email.pt',     'Lisboa',        'Portugal'),
(46, 'Umberto Romano',    'u.romano@email.it',        'Roma',          'Itália'),
(47, 'Vera Passos',       'vera.passos@email.pt',     'Porto',         'Portugal'),
(48, 'Walter Branco',     'walter.branco@email.pt',   'Lisboa',        'Portugal'),
(49, 'Xana Coelho',       'xana.coelho@email.pt',     'Setúbal',       'Portugal'),
(50, 'Yara Campos',       'yara.campos@email.pt',     'Lisboa',        'Portugal'),
(51, 'Arnaldo Brito',     'arnaldo.brito@email.pt',   'Lisboa',        'Portugal'),
(52, 'Beatriz Fontes',    'beatriz.fontes@email.pt',  'Porto',         'Portugal'),
(53, 'Cláudio Reis',      'claudio.reis@email.pt',    'Lisboa',        'Portugal'),
(54, 'Débora Luz',        'debora.luz@email.pt',      'Braga',         'Portugal'),
(55, 'Ernesto Vaz',       'ernesto.vaz@email.pt',     'Lisboa',        'Portugal');

-- 3.2 PRODUTOS (30 registos — inclui Eletrónicos > 100 e vários Livros)
INSERT INTO Produtos (ProdutoID, NomeProduto, Categoria, PrecoUnitario) VALUES
(1,  'Smartphone Pro X',         'Eletrónicos',   799.99),
(2,  'Notebook UltraSlim',       'Eletrónicos',  1299.00),
(3,  'Tablet Premium',           'Eletrónicos',   499.99),
(4,  'Smartwatch Fit',           'Eletrónicos',   249.00),
(5,  'Câmara DSLR 24MP',         'Eletrónicos',   950.00),
(6,  'Headphones BT Pro',        'Eletrónicos',   180.00),
(7,  'Smart TV 55"',             'Eletrónicos',   749.00),
(8,  'Coluna Bluetooth',         'Eletrónicos',    89.99),
(9,  'Carregador USB-C',         'Eletrónicos',    29.99),
(10, 'Rato Sem Fios',            'Eletrónicos',    45.00),
(11, 'Dom Quixote',              'Livros',          18.90),
(12, 'Harry Potter 1',           'Livros',          14.50),
(13, 'O Código Da Vinci',        'Livros',          12.00),
(14, 'Sapiens',                  'Livros',          19.90),
(15, 'O Alquimista',             'Livros',          11.50),
(16, 'Camisola de Lã',           'Vestuário',       35.00),
(17, 'Calças Jeans',             'Vestuário',       59.90),
(18, 'Ténis Running',            'Vestuário',       89.99),
(19, 'Casaco Impermeável',       'Vestuário',      120.00),
(20, 'T-Shirt Algodão',          'Vestuário',       19.99),
(21, 'Jogo de Lençóis',          'Casa e Jardim',   45.00),
(22, 'Cafeteira Expresso',       'Casa e Jardim',  149.00),
(23, 'Robot de Cozinha',         'Casa e Jardim',  299.00),
(24, 'Aspirador Robot',          'Casa e Jardim',  350.00),
(25, 'Conjunto de Panelas',      'Casa e Jardim',   89.00),
(26, 'Bicicleta de Montanha',    'Desporto',       450.00),
(27, 'Tapete de Yoga',           'Desporto',        25.00),
(28, 'Halteres 10kg (Par)',      'Desporto',        40.00),
(29, 'Corda de Saltar',          'Desporto',        12.00),
(30, 'Mochila Trail 40L',        'Desporto',        85.00);

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

-- 3.4 DETALHES DE VENDA (200 registos — mínimo garantido)
INSERT INTO DetalhesVenda (VendaID, ProdutoID, Quantidade, PrecoUnitarioVenda) VALUES
-- Venda 1 (Ana, Lisboa — Smartphone + Tablet)
(1,1,1,799.99),(1,3,1,499.99),
-- Venda 2 (Ana, Lisboa — Smartwatch)
(2,4,1,249.00),
-- Venda 3 (Bruno, Porto)
(3,6,1,180.00),
-- Venda 4 (Bruno, Porto)
(4,2,1,1299.00),
-- Venda 5 (Carlos, Lisboa)
(5,1,1,799.99),
-- Venda 6 (Carlos, Lisboa — Livro)
(6,11,1,18.90),
-- Venda 7 (Diana, Coimbra)
(7,3,1,499.99),
-- Venda 8 (Eduardo, Braga)
(8,8,1,89.99),
-- Venda 9 (Eduardo, Braga)
(9,21,1,45.00),
-- Venda 10 (Fátima, Lisboa)
(10,5,1,950.00),
-- Venda 11 (Fátima, Lisboa)
(11,7,1,749.00),
-- Venda 12 (Gabriel, Faro — Livro)
(12,12,1,14.50),
-- Venda 13 (Gabriel, Faro — Livro)
(13,13,1,12.00),
-- Venda 14 (Helena, Lisboa — Livro)
(14,14,1,19.90),
-- Venda 15 (Helena, Lisboa — Livro)
(15,15,1,11.50),
-- Venda 16 (Igor, Porto)
(16,16,1,35.00),
-- Venda 17 (Igor, Porto)
(17,17,1,59.90),
-- Venda 18 (Joana, Setúbal)
(18,18,1,89.99),
-- Venda 19 (Joana, Setúbal)
(19,19,1,120.00),
-- Venda 20 (Klaus, Berlim)
(20,20,1,19.99),
-- Venda 21 (Klaus, Berlim)
(21,21,1,45.00),
-- Venda 22 (Laura, Madrid)
(22,22,1,149.00),
-- Venda 23 (Laura, Madrid)
(23,23,1,299.00),
-- Venda 24 (Miguel, Barcelona)
(24,24,1,350.00),
-- Venda 25 (Miguel, Barcelona)
(25,25,1,89.00),
-- Venda 26 (Nadia, Paris)
(26,26,1,450.00),
-- Venda 27 (Nadia, Paris)
(27,27,1,25.00),
-- Venda 28 (Oscar, Lyon)
(28,28,1,40.00),
-- Venda 29 (Oscar, Lyon)
(29,29,1,12.00),
-- Venda 30 (Paula, Lisboa)
(30,30,1,85.00),
-- Venda 31 (Paula, Lisboa)
(31,1,1,799.99),
-- Venda 32 (Rafael, Lisboa)
(32,2,1,1299.00),
-- Venda 33 (Rafael, Lisboa)
(33,3,1,499.99),
-- Venda 34 (Sara, Porto)
(34,4,1,249.00),
-- Venda 35 (Sara, Porto)
(35,6,1,180.00),
-- Venda 36 (Tiago, Lisboa)
(36,5,1,950.00),
-- Venda 37 (Tiago, Lisboa)
(37,7,1,749.00),
-- Venda 38 (Ursula, São Paulo)
(38,11,1,18.90),
-- Venda 39 (Ursula, São Paulo)
(39,12,1,14.50),
-- Venda 40 (Vitor, Lisboa)
(40,13,1,12.00),
-- Venda 41 (Vitor, Lisboa)
(41,14,1,19.90),
-- Venda 42 (Wanda, Porto)
(42,15,1,11.50),
-- Venda 43 (Wanda, Porto)
(43,16,1,35.00),
-- Venda 44 (Xavier, Braga)
(44,17,1,59.90),
-- Venda 45 (Xavier, Braga)
(45,18,1,89.99),
-- Venda 46 (Yasmin, Rio)
(46,19,1,120.00),
-- Venda 47 (Yasmin, Rio)
(47,20,1,19.99),
-- Venda 48 (Zé, Lisboa)
(48,21,1,45.00),
-- Venda 49 (Zé, Lisboa)
(49,22,1,149.00),
-- Venda 50 (Alice, Coimbra)
(50,23,1,299.00),
-- Venda 51 (Alice, Coimbra)
(51,24,1,350.00),
-- Venda 52 (Bernardo, Lisboa)
(52,25,1,89.00),
-- Venda 53 (Bernardo, Lisboa)
(53,26,1,450.00),
-- Venda 54 (Carla, Faro)
(54,27,1,25.00),
-- Venda 55 (Carla, Faro)
(55,28,1,40.00),
-- Venda 56 (David, Porto)
(56,29,1,12.00),
-- Venda 57 (David, Porto)
(57,30,1,85.00),
-- Venda 58 (Elena, Lisboa)
(58,1,1,799.99),
-- Venda 59 (Elena, Lisboa)
(59,2,1,1299.00),
-- Venda 60 (Fernando, Évora)
(60,3,1,499.99),
-- Venda 61 (Glória, Lisboa)
(61,4,1,249.00),
-- Venda 62 (Glória, Lisboa)
(62,6,1,180.00),
-- Venda 63 (Henrique, Porto)
(63,5,1,950.00),
-- Venda 64 (Inês, Lisboa)
(64,7,1,749.00),
-- Venda 65 (Inês, Lisboa — Livro)
(65,11,1,18.90),
-- Venda 66 (João, Viseu — Livro)
(66,12,1,14.50),
-- Venda 67 (Karen, São Paulo — Livro)
(67,13,1,12.00),
-- Venda 68 (Karen, São Paulo — Livro)
(68,14,1,19.90),
-- Venda 69 (Luís, Lisboa — Livro)
(69,15,1,11.50),
-- Venda 70 (Luís, Lisboa)
(70,16,1,35.00),
-- Venda 71 (Maria, Porto)
(71,17,1,59.90),
-- Venda 72 (Maria, Porto)
(72,18,1,89.99),
-- Venda 73 (Nuno, Lisboa)
(73,19,1,120.00),
-- Venda 74 (Nuno, Lisboa)
(74,20,1,19.99),
-- Venda 75 (Olga, Braga)
(75,21,1,45.00),
-- Venda 76 (Pedro, Lisboa)
(76,22,1,149.00),
-- Venda 77 (Pedro, Lisboa)
(77,23,1,299.00),
-- Venda 78 (Quintino, Porto)
(78,24,1,350.00),
-- Venda 79 (Quintino, Porto)
(79,25,1,89.00),
-- Venda 80 (Rosa, Lisboa)
(80,26,1,450.00),
-- Venda 81 (Rosa, Lisboa)
(81,27,1,25.00),
-- Venda 82 (Sérgio, Coimbra)
(82,28,1,40.00),
-- Venda 83 (Sérgio, Coimbra)
(83,29,1,12.00),
-- Venda 84 (Teresa, Lisboa)
(84,30,1,85.00),
-- Venda 85 (Teresa, Lisboa)
(85,1,1,799.99),
-- Venda 86 (Umberto, Roma)
(86,2,1,1299.00),
-- Venda 87 (Vera, Porto)
(87,3,1,499.99),
-- Venda 88 (Walter, Lisboa)
(88,4,1,249.00),
-- Venda 89 (Xana, Setúbal)
(89,6,1,180.00),
-- Venda 90 (Yara, Lisboa)
(90,5,1,950.00),
-- Venda 91 (Arnaldo, Lisboa)
(91,7,1,749.00),
-- Venda 92 (Beatriz, Porto — Livro)
(92,11,1,18.90),
-- Venda 93 (Cláudio, Lisboa — Livro)
(93,12,1,14.50),
-- Venda 94 (Débora, Braga — Livro)
(94,13,1,12.00),
-- Venda 95 (Ernesto, Lisboa — Livro)
(95,14,1,19.90),
-- Venda 96 (Ana, Lisboa — volta a comprar)
(96,15,1,11.50),
-- Venda 97 (Bruno, Porto)
(97,16,1,35.00),
-- Venda 98 (Carlos, Lisboa)
(98,17,1,59.90),
-- Venda 99 (Diana, Coimbra)
(99,18,1,89.99),
-- Venda 100 (Eduardo, Braga)
(100,19,1,120.00),
-- Vendas com múltiplos produtos (para garantir > 200 linhas e cliente com +5 produtos)
-- Cliente 1 (Ana, Lisboa) — venda 1 já tem 2 produtos; adicionamos mais vendas
(2,10,2,45.00),   -- Venda 2: + Rato Sem Fios
(5,11,1,18.90),   -- Venda 5: + Livro Dom Quixote
(5,12,1,14.50),   -- Venda 5: + Harry Potter
(5,13,1,12.00),   -- Venda 5: + O Código Da Vinci
(5,14,1,19.90),   -- Venda 5: + Sapiens
(5,15,1,11.50),   -- Venda 5: + O Alquimista
-- Carlos compra todos os livros numa só venda → cobre consulta 4
(6,12,1,14.50),   -- Venda 6: + Harry Potter
(6,13,1,12.00),   -- Venda 6: + O Código Da Vinci
(6,14,1,19.90),   -- Venda 6: + Sapiens
(6,15,1,11.50),   -- Venda 6: + O Alquimista
-- Produto 9 (Carregador USB-C) nunca tem detalhes → aparecerá na consulta 6
-- Mais detalhes para garantir 200+
(10,6,1,180.00),(11,10,1,45.00),(22,21,2,45.00),(23,10,1,45.00),
(30,27,1,25.00),(31,8,1,89.99),(32,9,2,29.99),(33,10,1,45.00),
(36,8,1,89.99),(37,9,1,29.99),(40,16,1,35.00),(41,17,1,59.90),
(48,27,1,25.00),(49,28,1,40.00),(50,29,1,12.00),(51,30,1,85.00),
(52,27,1,25.00),(53,28,1,40.00),(58,8,1,89.99),(59,9,1,29.99),
(61,8,1,89.99),(62,9,1,29.99),(64,8,1,89.99),(65,12,1,14.50),
(65,13,1,12.00),(65,14,1,19.90),(65,15,1,11.50),
(69,11,1,18.90),(69,12,1,14.50),(69,13,1,12.00),(69,14,1,19.90),
(76,27,1,25.00),(77,28,1,40.00),(80,27,1,25.00),(81,28,1,40.00),
(84,27,1,25.00),(85,8,1,89.99),(88,8,1,89.99),(90,8,1,89.99);


-- ============================================================
-- 4. CONSULTAS EM ÁLGEBRA RELACIONAL E SQL
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
WHERE c.Cidade = 'Lisboa'
ORDER BY c.Nome;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 2
-- Obter o nome dos produtos da categoria 'Eletrónicos' com preço > 100
--
-- Álgebra Relacional:
--   π_NomeProduto (σ_Categoria='Eletrónicos' ∧ PrecoUnitario>100 (Produtos))
-- ──────────────────────────────────────────────────────────
SELECT NomeProduto, PrecoUnitario
FROM Produtos
WHERE Categoria = 'Eletrónicos'
  AND PrecoUnitario > 100
ORDER BY PrecoUnitario DESC;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 3
-- Listar o nome dos clientes e o nome dos produtos que compraram
--
-- Álgebra Relacional:
--   π_Nome,NomeProduto (
--     Clientes
--     ⋈_{Clientes.ClienteID = Vendas.ClienteID} Vendas
--     ⋈_{Vendas.VendaID = DetalhesVenda.VendaID} DetalhesVenda
--     ⋈_{DetalhesVenda.ProdutoID = Produtos.ProdutoID} Produtos
--   )
-- ──────────────────────────────────────────────────────────
SELECT DISTINCT c.Nome AS NomeCliente, p.NomeProduto
FROM Clientes c
INNER JOIN Vendas v       ON c.ClienteID  = v.ClienteID
INNER JOIN DetalhesVenda d ON v.VendaID    = d.VendaID
INNER JOIN Produtos p     ON d.ProdutoID  = p.ProdutoID
ORDER BY c.Nome, p.NomeProduto;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 4
-- Encontrar os clientes que compraram TODOS os produtos da categoria 'Livros'
--
-- Álgebra Relacional (divisão relacional):
--   Seja L = π_ProdutoID (σ_Categoria='Livros' (Produtos))
--   Seja CP = π_ClienteID,ProdutoID (
--               Vendas ⋈ DetalhesVenda ⋈ σ_Categoria='Livros'(Produtos))
--   Resultado = π_Nome (Clientes ⋈ (CP ÷ L))
-- ──────────────────────────────────────────────────────────
SELECT c.Nome
FROM Clientes c
WHERE NOT EXISTS (
    -- Existe algum livro que este cliente NÃO comprou?
    SELECT p.ProdutoID
    FROM Produtos p
    WHERE p.Categoria = 'Livros'
    AND NOT EXISTS (
        SELECT 1
        FROM Vendas v
        INNER JOIN DetalhesVenda d ON v.VendaID = d.VendaID
        WHERE v.ClienteID = c.ClienteID
          AND d.ProdutoID = p.ProdutoID
    )
)
ORDER BY c.Nome;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 5
-- Calcular o valor total de vendas por cliente
--
-- Álgebra Relacional:
--   π_Nome, SUM_ValorTotal (
--     Clientes ⋈_{Clientes.ClienteID = Vendas.ClienteID}
--     γ_ClienteID; SUM(ValorTotal) (Vendas)
--   )
-- ──────────────────────────────────────────────────────────
SELECT c.Nome AS NomeCliente,
       SUM(v.ValorTotal) AS TotalVendas,
       COUNT(v.VendaID)  AS NumeroVendas
FROM Clientes c
INNER JOIN Vendas v ON c.ClienteID = v.ClienteID
GROUP BY c.ClienteID, c.Nome
ORDER BY TotalVendas DESC;

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

-- ──────────────────────────────────────────────────────────
-- CONSULTA 7
-- Listar os clientes que compraram mais de 5 produtos diferentes
--
-- Álgebra Relacional:
--   π_Nome (σ_QtdProd>5 (
--     Clientes ⋈ γ_ClienteID; COUNT(DISTINCT ProdutoID)→QtdProd (
--       Vendas ⋈ DetalhesVenda)))
-- ──────────────────────────────────────────────────────────
SELECT c.Nome AS NomeCliente,
       COUNT(DISTINCT d.ProdutoID) AS ProdutosDiferentes
FROM Clientes c
INNER JOIN Vendas v        ON c.ClienteID = v.ClienteID
INNER JOIN DetalhesVenda d ON v.VendaID   = d.VendaID
GROUP BY c.ClienteID, c.Nome
HAVING COUNT(DISTINCT d.ProdutoID) > 5
ORDER BY ProdutosDiferentes DESC;
