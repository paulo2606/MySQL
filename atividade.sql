select * from tb_vendas;

#UPDATE
#ex01
select * from tb_vendas where id_produto = 136 and nome_cliente = "Cliente 47";
update tb_vendas set desconto = preco_unitario * 0.20 where id_produto = 136 and nome_cliente = "Cliente 47"; 

#ex02
select * from tb_vendas where id_cliente = 22 and id_produto = 142;
update tb_vendas set descricao_produto = "Monitor Full HD Samsung" where id_cliente = 22 and id_produto = 142;

#ex03
select * from tb_vendas where id_cliente = 6 and id_produto = 126;
update tb_vendas set preco_unitario = 300.00 where id_cliente = 6 and id_produto = 126;

#ex04
select * from tb_vendas where id_cliente = 2 and id_produto = 130;
update tb_vendas set quantidade = 5 where id_cliente = 2 and id_produto = 130;

#ex05
select * from tb_vendas where id_cliente = 42 and id_produto = 107 and data_venda = "2024-07-18";
update tb_vendas set forma_pagamento = "Pix" where id_cliente = 42 and id_produto = 107 and data_venda = "2024-07-18";

#UPDATE e DELETE
#ex06
select * from tb_vendas where categoria = "Eletrônicos";
update tb_vendas set preco_unitario = 3000.00 where categoria = "Eletrônicos";

#ex07
select * from tb_vendas where data_venda between "2025-01-01" and "2025-01-31";
update tb_vendas set desconto = 200.00 where data_venda between "2025-01-01" and "2025-01-31";

#ex08
select * from tb_vendas where status_venda = "Pendente";
update tb_vendas set status_venda = "Finalizada" where status_venda = "Pendente";
select * from tb_vendas where status_venda = "Finalizada";

#ex09
select * from tb_vendas where quantidade = 0 or "Teste";

#ex10
select * from tb_vendas where status_venda = "Cancelada";
delete from tb_vendas where status_venda = "Cancelada"; 

#SELECT com cálculos

#ex11 Relatório de Vendas Detalhado
select 
  nome_cliente as cliente,
  categoria,
  quantidade,
  preco_unitario,
  desconto,
  taxa_imposto,
  data_venda,
  (quantidade * preco_unitario) as valor_bruto,
  ((quantidade * preco_unitario) - desconto) as valor_com_desconto,
  (((quantidade * preco_unitario) - desconto) * (taxa_imposto / 100)) as imposto_aplicado
from tb_vendas 
order by data_venda desc;

#ex12 Total de vendas por Vendedor
select 
    vendedor,
    sum(quantidade) as total_itens_vendidos,
    sum(quantidade * preco_unitario) as valor_bruto_total,
    sum(quantidade * preco_unitario - desconto) as valor_com_desconto,
    sum(taxa_imposto) as imposto_total 
from 
    tb_vendas
group by 
    vendedor
order by 
    valor_bruto_total desc;
    
#ex13 Total de vendas por Categoria
select 
  categoria,
  sum(quantidade) as quantidade_total_vendida,
  sum(quantidade * preco_unitario) as valor_total_bruto,
  sum((quantidade * preco_unitario) - desconto) as valor_total_com_desconto,
  sum(((quantidade * preco_unitario) - desconto) * (taxa_imposto / 100)) as imposto_total_arrecadado
from tb_vendas
group by categoria;

#ex14 Comparativo por Forma de Pagamento
select 
    forma_pagamento,
    count(*) as total_vendas,
    sum(quantidade * preco_unitario - desconto) as valor_com_desconto,
    sum(taxa_imposto) as total_imposto
from 
    tb_vendas
group by
    forma_pagamento;

#ex15 Evolução de Vendas por Mês e Ano
select 
  year(data_venda) as ano,
  month(data_venda) as mes,
  sum(quantidade * preco_unitario) as valor_bruto_total,
  sum((quantidade * preco_unitario) - desconto) as valor_com_desconto_total
from tb_vendas
group by ano, mes
order by ano asc, mes asc;


