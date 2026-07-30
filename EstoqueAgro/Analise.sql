USE EstoqueAgro;
GO

-- Identifica produtos que precisam de reposição e calcula a quantidade necessária para atingir o estoque mínimo.
SELECT
    nome,
    estoque_atual,
    estoque_minimo,
    estoque_minimo - estoque_atual AS quantidade_a_repor
FROM produtos
WHERE estoque_atual < estoque_minimo;

-- Lista os lotes de produtos e calcula a quantidade de dias restantes para o vencimento, ordenando dos mais próximos de vencer aos mais distantes.
SELECT
    p.nome AS produto,
    l.numero_lote,
    l.data_validade,
    DATEDIFF(DAY, GETDATE(), l.data_validade) AS dias_para_vencer
FROM lotes l
JOIN produtos p ON p.id_produto = l.id_produto
WHERE l.data_validade IS NOT NULL
ORDER BY l.data_validade ASC;

-- Calcula o total de entradas, saídas e o saldo final de cada produto por armazém.
SELECT
    a.nome AS armazem,
    p.nome AS produto,
    SUM(CASE WHEN m.tipo = 'entrada' THEN m.quantidade ELSE 0 END) AS total_entradas,
    SUM(CASE WHEN m.tipo = 'saida' THEN m.quantidade ELSE 0 END) AS total_saidas,
    SUM(CASE WHEN m.tipo = 'entrada' THEN m.quantidade ELSE -m.quantidade END) AS saldo
FROM movimentacoes_estoque m
JOIN armazens a ON a.id_armazem = m.id_armazem
JOIN produtos p ON p.id_produto = m.id_produto
GROUP BY a.nome, p.nome
ORDER BY a.nome, p.nome;

--Exibe o faturamento total gerado por categoria de produto em pedidos concluídos, do maior para o menor.
SELECT
    c.nome AS categoria,
    SUM(pi.quantidade * pi.preco_unitario) AS faturamento
FROM pedidos_itens pi
JOIN produtos p ON p.id_produto = pi.id_produto
JOIN categorias c ON c.id_categoria = p.id_categoria
JOIN pedidos pe ON pe.id_pedido = pi.id_pedido
WHERE pe.status = 'concluido'
GROUP BY c.nome
ORDER BY faturamento DESC;

--Ranking de vendedores por total vendido e quantidade de pedidos concluídos.
SELECT
    v.nome AS vendedor,
    COUNT(DISTINCT pe.id_pedido) AS qtd_pedidos,
    SUM(pi.quantidade * pi.preco_unitario) AS total_vendido
FROM pedidos pe
JOIN vendedores v ON v.id_vendedor = pe.id_vendedor
JOIN pedidos_itens pi ON pi.id_pedido = pe.id_pedido
WHERE pe.status = 'concluido'
GROUP BY v.nome
ORDER BY total_vendido DESC;

-- Ranking de clientes (e seu tipo) com base no total gasto e número de pedidos concluídos.
SELECT
    cl.nome AS cliente,
    cl.tipo,
    COUNT(DISTINCT pe.id_pedido) AS qtd_pedidos,
    SUM(pi.quantidade * pi.preco_unitario) AS total_comprado
FROM clientes cl
JOIN pedidos pe ON pe.id_cliente = cl.id_cliente
JOIN pedidos_itens pi ON pi.id_pedido = pe.id_pedido
WHERE pe.status = 'concluido'
GROUP BY cl.nome, cl.tipo
ORDER BY total_comprado DESC;

-- Exibe o faturamento total gerado pelos produtos de cada fabricante em pedidos concluídos.
SELECT
    f.nome AS fabricante,
    SUM(pi.quantidade * pi.preco_unitario) AS faturamento_gerado
FROM pedidos_itens pi
JOIN produtos p ON p.id_produto = pi.id_produto
JOIN fabricantes f ON f.id_fabricante = p.id_fabricante
JOIN pedidos pe ON pe.id_pedido = pi.id_pedido
WHERE pe.status = 'concluido'
GROUP BY f.nome
ORDER BY faturamento_gerado DESC;

--Agrupa e conta a quantidade total de pedidos realizados por mês/ano.
SELECT
    FORMAT(data_pedido, 'yyyy-MM') AS mes,
    COUNT(*) AS qtd_pedidos
FROM pedidos
GROUP BY FORMAT(data_pedido, 'yyyy-MM')
ORDER BY mes;

-- Calcula o volume total movimentado em cada armazém comparando com a sua capacidade total em m³.
SELECT
    a.nome AS armazem,
    a.capacidade_m3,
    SUM(m.quantidade) AS volume_movimentado
FROM movimentacoes_estoque m
JOIN armazens a ON a.id_armazem = m.id_armazem
GROUP BY a.nome, a.capacidade_m3
ORDER BY volume_movimentado DESC;