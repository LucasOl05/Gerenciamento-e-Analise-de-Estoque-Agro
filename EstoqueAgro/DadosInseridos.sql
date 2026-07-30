USE EstoqueAgro;
GO

INSERT INTO fabricantes (nome, pais, telefone) VALUES
('AgroSyn Insumos', 'Brasil', '4132201100'),
('BioDefensivos LTDA', 'Brasil', '4332552200'),
('SementesPrime', 'Brasil', '5133224400'),
('NutriSolo Fertilizantes', 'Brasil', '5432119900'),
('CropField Internacional', 'Suica', '4122334455');

INSERT INTO categorias (nome) VALUES
('Sementes'),
('Defensivos Agricolas'),
('Fertilizantes'),
('Adjuvantes');

INSERT INTO produtos (nome, id_categoria, id_fabricante, unidade_medida, preco_unitario, estoque_atual, estoque_minimo) VALUES
('Semente de Soja RR 500', 1, 3, 'kg', 8.90, 12000.00, 3000.00),
('Semente de Milho Hibrido AG7098', 1, 3, 'kg', 14.50, 6000.00, 2000.00),
('Herbicida Glifosato 480', 2, 1, 'l', 32.00, 4500.00, 1500.00),
('Fungicida Triazol Plus', 2, 2, 'l', 78.00, 1800.00, 800.00),
('Inseticida Piretroide XT', 2, 2, 'l', 65.00, 2200.00, 1000.00),
('Fertilizante Foliar Boro', 3, 4, 'l', 22.00, 3000.00, 1000.00),
('Fertilizante NPK 04-14-08', 3, 4, 'kg', 3.40, 18000.00, 6000.00),
('Adjuvante Oleo Mineral', 4, 5, 'l', 19.50, 1200.00, 600.00),
('Adjuvante Espalhante Adesivo', 4, 5, 'l', 16.80, 900.00, 500.00);

INSERT INTO armazens (nome, cidade, uf, capacidade_m3) VALUES
('CD Central Uberlandia', 'Uberlandia', 'MG', 5000.00),
('CD Sul Cascavel', 'Cascavel', 'PR', 4200.00),
('CD Centro-Oeste Rondonopolis', 'Rondonopolis', 'MT', 6000.00),
('CD Nordeste Barreiras', 'Barreiras', 'BA', 3500.00);

INSERT INTO lotes (id_produto, numero_lote, data_fabricacao, data_validade, quantidade_produzida) VALUES
(1, 'SJ25-001', '2025-08-10', '2027-08-10', 8000.00),
(1, 'SJ25-002', '2025-09-05', '2027-09-05', 6000.00),
(2, 'ML25-001', '2025-07-20', '2027-07-20', 5000.00),
(3, 'HB25-014', '2025-06-01', '2028-06-01', 4500.00),
(4, 'FG25-009', '2025-05-15', '2027-05-15', 2000.00),
(5, 'IN25-021', '2025-06-10', '2027-06-10', 2500.00),
(6, 'FF25-003', '2025-07-01', '2026-07-01', 3200.00),
(7, 'NP25-011', '2025-08-01', '2028-08-01', 20000.00);

INSERT INTO movimentacoes_estoque (id_produto, id_armazem, id_lote, tipo, quantidade, data_movimentacao, origem) VALUES
(1, 1, 1, 'entrada', 8000.00, '2025-08-15', 'producao'),
(1, 1, 2, 'entrada', 6000.00, '2025-09-10', 'producao'),
(1, 1, NULL, 'saida', 2000.00, '2025-10-05', 'venda'),
(2, 3, 3, 'entrada', 5000.00, '2025-07-25', 'producao'),
(2, 3, NULL, 'saida', 800.00, '2025-11-01', 'venda'),
(3, 2, 4, 'entrada', 4500.00, '2025-06-05', 'producao'),
(3, 2, NULL, 'saida', 1200.00, '2025-09-15', 'venda'),
(4, 1, 5, 'entrada', 2000.00, '2025-05-20', 'producao'),
(4, 1, NULL, 'saida', 400.00, '2025-08-10', 'venda'),
(5, 3, 6, 'entrada', 2500.00, '2025-06-15', 'producao'),
(5, 3, NULL, 'saida', 600.00, '2025-10-20', 'venda'),
(6, 4, 7, 'entrada', 3200.00, '2025-07-05', 'producao'),
(6, 4, NULL, 'saida', 500.00, '2025-11-10', 'venda'),
(7, 2, 8, 'entrada', 20000.00, '2025-08-05', 'producao'),
(7, 2, NULL, 'saida', 4000.00, '2025-10-25', 'venda'),
(8, 1, NULL, 'entrada', 1500.00, '2025-09-01', 'compra'),
(8, 1, NULL, 'saida', 300.00, '2025-11-05', 'venda'),
(9, 4, NULL, 'entrada', 1200.00, '2025-09-10', 'compra'),
(9, 4, NULL, 'saida', 300.00, '2025-11-12', 'venda');

INSERT INTO vendedores (nome, regiao, telefone) VALUES
('Carlos Menezes', 'Triangulo Mineiro', '3499887766'),
('Patricia Nogueira', 'Oeste do Parana', '4599776655'),
('Rodrigo Faria', 'Centro-Oeste', '6699665544'),
('Juliana Castro', 'Oeste da Bahia', '7799554433');

INSERT INTO clientes (nome, tipo, cidade, uf, telefone) VALUES
('Cooperativa AgroVale', 'cooperativa', 'Uberlandia', 'MG', '3432001122'),
('Fazenda Rio Claro', 'produtor', 'Cascavel', 'PR', '4533002233'),
('Cooperativa Planalto Sul', 'cooperativa', 'Cascavel', 'PR', '4533004455'),
('Fazenda Sao Bento', 'produtor', 'Rondonopolis', 'MT', '6633005566'),
('Agropecuaria Oeste Baiano', 'revenda', 'Barreiras', 'BA', '7733006677');

INSERT INTO pedidos (id_cliente, id_vendedor, data_pedido, status) VALUES
(1, 1, '2025-10-05', 'concluido'),
(2, 2, '2025-11-01', 'concluido'),
(3, 2, '2025-09-15', 'concluido'),
(4, 3, '2025-10-25', 'concluido'),
(5, 4, '2025-11-12', 'concluido'),
(1, 1, '2025-11-20', 'pendente'),
(4, 3, '2025-08-10', 'concluido');

INSERT INTO pedidos_itens (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2000.00, 8.90),
(2, 2, 800.00, 14.50),
(3, 3, 1200.00, 32.00),
(4, 5, 600.00, 65.00),
(5, 6, 500.00, 22.00),
(6, 7, 3000.00, 3.40),
(7, 4, 400.00, 78.00);
