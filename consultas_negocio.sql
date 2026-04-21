-- ALGUMAS DAS QUERIES USADAS NO PROJETO ...

SELECT  
	SUM(quantidade * preco_unitario) AS faturamento_total 
FROM itens_pedido; 

-- Usada para mostrar quanto foi vendido no total 

 

SELECT  

    p.nome AS produto, 

    SUM(i.quantidade * i.preco_unitario) AS faturamento 

FROM produtos p 

JOIN itens_pedido i 

    ON p.id_produto = i.id_produto 

GROUP BY p.nome 

ORDER BY faturamento DESC; 

-- Mostra quais produtos mais geram receita (ótimo gráfico no Power Bi) 



SELECT  

    DATE_FORMAT(p.data_pedido, '%Y-%m') AS mes, 

    SUM(i.quantidade * i.preco_unitario) AS faturamento 

FROM pedidos p 

JOIN itens_pedido i 

    ON p.id_pedido = i.id_pedido 

GROUP BY mes 

ORDER BY mes; 

-- Total de venda por mês, ótimo para gráfico em linha (evolução do negócio) 



SELECT 
    c.nome_categoria,
    SUM(i.quantidade) AS total_vendido
FROM categorias c
JOIN produtos p
    ON c.id_categoria = p.id_categoria
JOIN itens_pedido i
    ON p.id_produto = i.id_produto
GROUP BY c.nome_categoria
ORDER BY total_vendido DESC;

-- Mostra quais categorias tem mais volume de vendas



SELECT 
    SUM(i.quantidade * i.preco_unitario) / COUNT(DISTINCT p.id_pedido) AS ticket_medio
FROM pedidos p
JOIN itens_pedido i
    ON p.id_pedido = i.id_pedido;

-- Indica quanto, em média, cada cliente gasta por pedido
