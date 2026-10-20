# EstoqueAgro - Banco de Dados

Banco de dados relacional em SQL Server para gestao de estoque e vendas de uma empresa de insumos agricolas (sementes, defensivos, fertilizantes e adjuvantes), com controle de lotes, armazens regionais e pedidos de clientes.

## Estrutura

- `fabricantes` / `categorias` / `produtos` - catalogo de produtos e seus fabricantes
- `armazens` / `lotes` / `movimentacoes_estoque` - controle fisico do estoque por armazem e lote
- `vendedores` / `clientes` / `pedidos` / `pedidos_itens` - processo comercial

## Como rodar

Executar na ordem, em uma instancia do SQL Server (SSMS ou Azure Data Studio):

1. `Tabelas.sql` - cria o banco e as tabelas
2. `DadosInseridos.sql` - Coloca os dados 
3. `Analises.sql` - consultas de analise sobre o banco

## Analises incluidas

Usei alguns codigos para buscar informações que costumam serem muito necessarias para gerenciar um estoque mas da pra fazer muitos outros.

- Produtos com estoque abaixo do minimo
- Lotes proximos do vencimento
- Saldo de estoque por armazem e produto
- Faturamento por categoria de produto
- Desempenho de vendas por vendedor
- Ranking de clientes por volume comprado
- Faturamento por fabricante
- Pedidos por mes
- Volume movimentado por armazem


