# EstoqueAgro - Banco de Dados

Banco de dados relacional em SQL Server para gestao de estoque e vendas de uma empresa de insumos agricolas (sementes, defensivos, fertilizantes e adjuvantes), com controle de lotes, armazens regionais e pedidos de clientes.

## Estrutura

- `fabricantes` / `categorias` / `produtos` - catalogo de produtos e seus fabricantes
- `armazens` / `lotes` / `movimentacoes_estoque` - controle fisico do estoque por armazem e lote
- `vendedores` / `clientes` / `pedidos` / `pedidos_itens` - processo comercial

## Como rodar

Executar na ordem, em uma instancia do SQL Server (SSMS ou Azure Data Studio):

1. `schema.sql` - cria o banco e as tabelas
2. `seed_data.sql` - popula com dados de exemplo
3. `analysis.sql` - consultas de analise sobre o banco

## Analises incluidas

- Produtos com estoque abaixo do minimo
- Lotes proximos do vencimento
- Saldo de estoque por armazem e produto
- Faturamento por categoria de produto
- Desempenho de vendas por vendedor
- Ranking de clientes por volume comprado
- Faturamento por fabricante
- Pedidos por mes
- Volume movimentado por armazem

## Observacoes

Nomes de fabricantes, armazens e clientes sao ficticios, montados para simular a operacao de uma distribuidora de insumos agricolas com centros de distribuicao em MG, PR, MT e BA.
