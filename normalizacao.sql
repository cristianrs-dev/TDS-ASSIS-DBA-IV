use uc4atividades;

/*VIEW CRIADA PARA REPRESENTAR A SOLUCAO DA TABELA VENDA*/
select * from venda;
select * from item_venda;
select * from produto;

create view status_venda as select v.id idVenda, v.data_pagamento, v.data_envio, v.status from venda as v;
select * from status_venda;


/*VIEW CRIADA COMO SOLUCAO PARA TABELA ITEM_VENDA*/


create view qtdProduto_por_venda as select p.id idProduto,v.id idVenda,iv.valor_unitario, iv.quantidade 
from produto as p inner join venda as v inner join item_venda as iv
on iv.produto_id=p.id and iv.venda_id=v.id
group by p.id;

create view Subtotal_produtoPorVenda as select v.id venda_id,p.id idProduto,p.nome,(iv.valor_unitario* iv.quantidade)subtotal
from venda as v inner join produto as p inner join item_venda as iv
on iv.venda_id=v.id and iv.produto_id=p.id
group by p.nome;

select * from qtdProduto_por_Venda;
select * from Subtotal_produtoPorVenda;