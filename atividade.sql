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



