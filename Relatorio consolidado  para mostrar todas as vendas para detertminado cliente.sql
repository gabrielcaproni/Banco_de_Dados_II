# Relatorio consolidado  para mostrar todas as vendas para detertminado cliente 

SELECT v.codVenda, DATE_FORMAT(v.dataHora ,"%d/%m/%Y %H:%i:%s") as dataHora, c.nome from venda AS v INNER JOIN cliente AS c
ON v.CLIENTE_codCliente = c.codCliente ORDER BY v.codVenda;

#configura na sessao de forma geral para o formato brasileiro 
SET lc_time_names = pt_br;

#configura de forma geral para o formato brasileiro 
SET GLOBAL lc_times_names = pt_br;