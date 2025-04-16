

Create database Loja;

-- Tabela de Vendedores
CREATE TABLE Vendedores (
  IDVendedor INT IDENTITY(1,1) PRIMARY KEY,
  Nome VARCHAR(50)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
  IDProduto INT IDENTITY(1,1) PRIMARY KEY,
  Produto VARCHAR(100),
  Preco NUMERIC(10,2)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
  IDCliente INT IDENTITY(1,1) PRIMARY KEY,
  Cliente VARCHAR(50),
  Estado CHAR(2),
  Sexo CHAR(1),
  Status VARCHAR(50)
);

-- Tabela de Vendas
CREATE TABLE Vendas (
  IDVenda INT IDENTITY(1,1) PRIMARY KEY,
  IDVendedor INT FOREIGN KEY REFERENCES Vendedores(IDVendedor),
  IDCliente INT FOREIGN KEY REFERENCES Clientes(IDCliente),
  Data DATE,
  Total NUMERIC(10,2)
);

-- Tabela de Itens da Venda
CREATE TABLE ItensVenda (
  IDProduto INT NOT NULL,
  IDVenda INT NOT NULL,
  Quantidade INT,
  ValorUnitario DECIMAL(10,2),
  ValorTotal DECIMAL(10,2),
  Desconto DECIMAL(10,2),
  PRIMARY KEY (IDProduto, IDVenda),
  CONSTRAINT FK_ItensVenda_Produto FOREIGN KEY (IDProduto) 
    REFERENCES Produtos(IDProduto) ON DELETE NO ACTION, -- RESTRICT em SQL Server
  CONSTRAINT FK_ItensVenda_Venda FOREIGN KEY (IDVenda) 
    REFERENCES Vendas(IDVenda) ON DELETE CASCADE
);



INSERT INTO Produtos (Produto, Preco) VALUES 
('Notebook', 3200.00), 
('Mouse', 90.00), 
('Monitor', 1250.00);

INSERT INTO Clientes (Cliente, Estado, Sexo, Status) VALUES 
('Maria Silva', 'SP', 'F', 'Ativo'),
('Paulo Oliveira', 'RJ', 'M', 'Ativo'),
('Ana Souza', 'MG', 'F', 'Inativo');


