CREATE DATABASE EstoqueAgro;
GO

USE EstoqueAgro;
GO

CREATE TABLE fabricantes (
    id_fabricante INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    pais VARCHAR(60),
    telefone VARCHAR(20)
);

CREATE TABLE categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(60) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    id_categoria INT NOT NULL,
    id_fabricante INT NOT NULL,
    unidade_medida VARCHAR(10) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    estoque_atual DECIMAL(12,2) NOT NULL DEFAULT 0,
    estoque_minimo DECIMAL(12,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id_fabricante)
);

CREATE TABLE armazens (
    id_armazem INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(80),
    uf CHAR(2),
    capacidade_m3 DECIMAL(10,2)
);

CREATE TABLE lotes (
    id_lote INT IDENTITY(1,1) PRIMARY KEY,
    id_produto INT NOT NULL,
    numero_lote VARCHAR(30) NOT NULL,
    data_fabricacao DATE,
    data_validade DATE,
    quantidade_produzida DECIMAL(12,2),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE movimentacoes_estoque (
    id_movimentacao INT IDENTITY(1,1) PRIMARY KEY,
    id_produto INT NOT NULL,
    id_armazem INT NOT NULL,
    id_lote INT,
    tipo VARCHAR(10) NOT NULL,
    quantidade DECIMAL(12,2) NOT NULL,
    data_movimentacao DATE NOT NULL,
    origem VARCHAR(60),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_armazem) REFERENCES armazens(id_armazem),
    FOREIGN KEY (id_lote) REFERENCES lotes(id_lote)
);

CREATE TABLE vendedores (
    id_vendedor INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    regiao VARCHAR(60),
    telefone VARCHAR(20)
);

CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    tipo VARCHAR(30),
    cidade VARCHAR(80),
    uf CHAR(2),
    telefone VARCHAR(20)
);

CREATE TABLE pedidos (
    id_pedido INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'concluido',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

CREATE TABLE pedidos_itens (
    id_item INT IDENTITY(1,1) PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade DECIMAL(12,2) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
