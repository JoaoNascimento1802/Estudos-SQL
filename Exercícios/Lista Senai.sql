
#Exc 1:  Quais os países cadastrados?
select pais from pais;

#Exc 2:  Quantos países estão cadastrados?
select Count(*) pais from pais

#Exc 3: Quantos países que terminam com a letra "A" estão cadastrados?
select Count(*) pais 
from pais
where pais like 'A%';

#Exc 4:  Listar, sem repetição, os anos que houveram lançamento de filme
select distinct ano_de_lancamento
from filme

#Exc 5: Alterar o ano de lançamento (deixar igual a 2007) para filmes que iniciem com a Letra "B".
update filme
set ano_de_lancamento = 2007
where titulo like 'B%'

#Exc 6: Listar os filmes que possuem duração do filme maior que 100 e classificação igual a "G"
select titulo
from filme
where duracao_do_filme > 100 and classificacao = "G"

#Exc 7: Alterar o ano de lançamento igual 2008 para filmes que possuem duração da locação menor que 4 e classificação igual a "PG". 
update filme
set ano_de_lancamento = 2008
where duracao_da_locacao < 4 and classificacao = 'PG'

#Exc 8: Listar a quantidade de filmes que estejam classificados como "PG-13" e preço da locação maior que 2.40.
select distinct Count(*) filme
from filme
where classificacao = 'PG-13' and preco_da_locacao > 2.40

#Exc 9: Quais os idiomas que possuem filmes cadastrados? 
select * from idioma
select distinct idioma_id
from filme

#Exc 10: Alterar o idioma para "GERMAN" dos filmes que possuem preço da locação maior que 4
update filme 
set idioma_id = 6
where preco_da_locacao > 4

#Exc 11: Alterar o idioma para "JAPANESE" dos filmes que possuem preço da locação igual 0.99.
update filme 
set idioma_id = 3
where preco_da_locacao > 0.99	

#Exc 12: Listar a quantidade de filmes por classificação.
select classificacao , count(*) as clasificacao from filme
group by classificacao

#Exc 13: Listar, sem repetição, os preços de locação dos filmes cadastrados.
select distinct preco_da_locacao from filme

#Exc 14: Listar a quantidade de filmes por preço da locação.
select preco_da_Locacao , count(*) as preco_da_locacao from filme
group by preco_da_locacao 

#Exc 15: Listar os precos da locação que possuam mais de 340 filmes.
select preco_da_Locacao , count(*) as preco_da_locaca from filme
group by preco_da_locacao 
having preco_da_locaca >340

#Exc 16:  Listar a quantidade de atores por filme ordenando por quantidade de atores crescente.
select titulo , Count(*) quantidade_ator
from filme
group by titulo
order by quantidade_ator asc 

#Exc 17: Listar a quantidade de atores para os filmes que possuem mais de 5 atores ordenando por quantidade de atores decrescente.
select filme_id , Count(ator_id ) as quantidade_ator
from filme_ator
group by filme_id
having count(ator_id) > 5
order by quantidade_ator desc

#Exc 18:. Listar o título e a quantidade de atores para os filmes que possuem o idioma "JAPANESE" e mais de 10 atores ordenando por ordem alfabética de título e ordem crescente de quantidadede atores
SELECT f.filme_id, f.titulo, COUNT(fa.ator_id) AS quantidade_ator
FROM filme_ator fa
JOIN filme f ON fa.filme_id = f.filme_id
GROUP BY f.filme_id, f.titulo
HAVING COUNT(fa.ator_id) > 10
ORDER BY quantidade_ator DESC, f.titulo ASC;

#Exc 19: Qual a maior duração da locação dentre os filmes?
Select MAX(duracao_da_locacao) from filme

#Exc 20: Quantos filmes possuem a maior duração de locação?
select count(*) from filme
where duracao_da_locacao = 7
select * duracao

#Exc 21: Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de locação?
SELECT COUNT(*) 
FROM filme
WHERE duracao_da_locacao = 7 
AND (idioma_id = 3 OR idioma_id = 6);

#Exc 22: Qual a quantidade de filmes por classificação e preço da locação?
SELECT classificacao, preco_da_locacao, COUNT(*) AS quantidade_filme
FROM filme
GROUP BY classificacao, preco_da_locacao;

#Exc 23: Qual o maior tempo de duração de filme por categoria?
select max(duracao_do_filme), categoria.nome
from filme,categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and categoria.categoria_id=filme_categoria.categoria_id
group by categoria.categoria_id

#Exc 24: Listar a quantidade de filmes por categoria.
select count(*) as Quantidade, categoria.nome
from filme,categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and categoria.categoria_id=filme_categoria.categoria_id
group by categoria.categoria_id

#Exc 25: Listar a quantidade de filmes classificados como "G" por categoria.
select count(*) as Quantidade, categoria.nome
from filme,categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and categoria.categoria_id=filme_categoria.categoria_id
group by categoria.categoria_id

#Exc 27: Listar a quantidade de filmes por categoria e classificação.
select count(filme.filme_id), classificacao ,categoria_id from filme , filme_categoria,categoria
where filme.filme_id = filme_categoria.filme_id and filme_categoria.categoria_id= categoria.categoria_id
group by categoria.categoria_id,classificacao

#Exc 28: Qual a quantidade de filmes por Ator ordenando decrescente por quantidade?
SELECT COUNT(titulo), primeiro_nome , ultimo_nome from filme , ator , filme_ator
where ator.ator_id=filme_ator.ator_id and filme.filme_id=filme_ator.filme_id
group by filme_ator.ator_id
order by 1 desc;

#Exc 29: Qual a quantidade de filmes por ano de lançamento ordenando por quantidade crescente?
select count(ano_de_lancamento) 
from filme
group by ano_de_lancamento
order by 1 asc;

#Exc 30: Listar os anos de lançamento que possuem mais de 400 filmes?
SELECT ano_de_lancamento, COUNT(*) AS quantidade
FROM filme
GROUP BY ano_de_lancamento
HAVING quantidade > 400;

#Exc 31: Listar os anos de lançamento dos filmes que possuem mais de 100 filmes com preço da locação maior que a média do preço da locação dos filmes da categoria "Children"?
SELECT ano_de_lancamento AS ano_lanc
FROM filme
WHERE preco_da_locacao > (
    SELECT AVG(preco_da_locacao)
    FROM filme
    JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
    WHERE filme_categoria = 'Children'
)
GROUP BY ano_de_lancamento
HAVING COUNT(filme.filme_id) > 100;

#Exc 32: Quais as cidades e seu pais correspondente que pertencem a um país que inicie com a:
select cidade.cidade_id, cidade.pais_id, cidade.cidade , pais.pais
from cidade 
join pais on cidade.pais_id = pais.pais_id
where pais.pais like 'A%';

#Exc 33: Qual a quantidade de cidades por pais em ordem decrescente?
SELECT pais.pais, COUNT(cidade.cidade_id) AS numero_de_cidades
FROM cidade
JOIN pais ON cidade.pais_id = pais.pais_id
GROUP BY pais.pais
ORDER BY numero_de_cidades DESC;

#Exc 34: Qual a quantidade de cidades que iniciam com a Letra “A” por pais em ordem crescente?
SELECT pais.pais, cidade.cidade , COUNT(cidade.cidade_id) AS numero_de_cidades
from cidade 
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE cidade.cidade LIKE 'A%'
GROUP BY pais.pais
ORDER BY numero_de_cidades ASC;

#Exc 35: Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A”?
SELECT pais.pais , pais.pais_id , cidade.cidade , COUNT(cidade.cidade_id) AS numero_de_cidades
from cidade 
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE cidade.cidade LIKE 'A%' 
GROUP BY pais.pais
HAVING COUNT(cidade.cidade_id) > 3
ORDER BY numero_de_cidades ASC;

#Exc 36: Quais os países que possuem mais de 3 cidades que iniciam com a Letra “A” ou tenha "R"?
SELECT pais.pais , pais.pais_id , cidade.cidade , COUNT(cidade.cidade_id) AS numero_de_cidades
from cidade 
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE cidade.cidade LIKE 'A%' or cidade.cidade LIKE '%R%'
GROUP BY pais.pais
HAVING COUNT(cidade.cidade_id) > 3
ORDER BY numero_de_cidades ;

#Exc 37: Quais os clientes moram no país “United States”?
SELECT primeiro_nome , pais 
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE pais.pais = 'United States';

#Exc 38: Quantos clientes moram no país “Brazil”?
SELECT primeiro_nome , pais
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE pais.pais = 'Brazil'

#Exc 39: Qual a quantidade de clientes por pais?
SELECT pais.pais , COUNT(cliente_id) AS total_clientes
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
GROUP BY pais.pais
 
 #Exc 40: Quais países possuem mais de 10 clientes?
SELECT pais.pais , COUNT(cliente_id) AS total_clientes
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
GROUP BY pais.pais
HAVING COUNT(cliente.cliente_id) > 10

#Exc 41: Qual a média de duração dos filmes por idioma?
SELECT AVG(duracao_do_filme) , filme.idioma_id,idioma.nome 
FROM filme
JOIN idioma ON filme.idioma_id = idioma.idioma_id
GROUP BY idioma.nome 

#Exc 42: Qual a quantidade de atores que atuaram nos filmes do idioma “English”?

#Metodo 1 :
SELECT COUNT(ator_id) , idioma.nome
FROM idioma
JOIN ator ON ator_id = ator.ator_id
WHERE idioma.nome LIKE 'English'
GROUP BY idioma.nome

#Metodo 2 :
SELECT COUNT(DISTINCT fa.ator_id) AS numero_de_atores
FROM idioma i
JOIN filme f ON i.idioma_id = f.idioma_id
JOIN filme_ator fa ON f.filme_id = fa.filme_id
WHERE i.nome = 'English'; 

#Exc 43:  Quais os atores do filme “BLANKET BEVERLY”?
SELECT a.primeiro_nome
FROM ator a
JOIN filme_ator fa ON a.ator_id = fa.ator_id
JOIN filme f ON fa.filme_id = f.filme_id
WHERE f.titulo = 'BLANKET BEVERLY';

#44.Quais categorias possuem mais de 60 filmes cadastrados?

SELECT COUNT(titulo), nome FROM categoria c, filme f, filme_categoria fc
WHERE f.filme_id = fc.filme_id
AND   fc.categoria_id = c.categoria_id
GROUP BY c.nome
HAVING COUNT(titulo) > 60;

#45. Quais os filmes alugados (sem repetição) para clientes que moram na "Argentina"?
    
SELECT distinct f.titulo FROM  aluguel a, filme f, cliente c, endereco e, cidade ci, pais p, inventario inv
WHERE  a.cliente_id = c.cliente_id
AND    a.inventario_id = inv.inventario_id
AND    inv.filme_id = f.filme_id
AND    c.endereco_id = e.endereco_id
AND    e.cidade_id  = ci.cidade_id
AND    ci.pais_id  = p.pais_id
AND    p.pais = "Argentina";

#46. Qual a quantidade de filmes alugados por Clientes que moram na "Chile"?

SELECT COUNT( f.titulo ) as Quantidade FROM  aluguel a, filme f, cliente c, endereco e, cidade ci, pais p, inventario inv
WHERE  a.cliente_id = c.cliente_id
AND    a.inventario_id = inv.inventario_id
AND    inv.filme_id = f.filme_id
AND    c.endereco_id = e.endereco_id
AND    e.cidade_id  = ci.cidade_id
AND    ci.pais_id  = p.pais_id
AND    p.pais = "Chile";


#47. Qual a quantidade de filmes alugados por funcionário?
    
SELECT fun.funcionario_id, COUNT( f.titulo ) as Quantidade FROM  aluguel a, filme f, funcionario fun, endereco e, cidade ci, pais p, inventario inv
WHERE  a.funcionario_id = fun.funcionario_id
AND    a.inventario_id = inv.inventario_id
AND    inv.filme_id = f.filme_id
AND    fun.endereco_id = e.endereco_id
AND    e.cidade_id  = ci.cidade_id
AND    ci.pais_id  = p.pais_id
GROUP BY fun.funcionario_id;


#48. Qual a quantidade de filmes alugados por funcionário para cada categoria?
    
SELECT fun.funcionario_id, COUNT( f.titulo ) as Quantidade, ca.nome
FROM  aluguel a, filme f, funcionario fun, endereco e, cidade ci, pais p, inventario inv, categoria ca, filme_categoria fa
WHERE  a.funcionario_id = fun.funcionario_id
AND    a.inventario_id = inv.inventario_id
AND    inv.filme_id = f.filme_id
AND    fun.endereco_id = e.endereco_id
AND    e.cidade_id  = ci.cidade_id
AND    ci.pais_id  = p.pais_id
AND    f.filme_id = fa.filme_id
AND    fa.categoria_id = ca.categoria_id
GROUP BY fun.funcionario_id, ca.nome;


#.49 Quais Filmes possuem preço da Locação maior que a média de preço da locação?

SELECT titulo, preco_da_locacao FROM filme
WHERE preco_da_locacao > (SELECT AVG(preco_da_locacao) FROM filme WHERE preco_da_locacao IS NOT NULL); -- Dispensar no cálculo da média valores nulos (se tiver)

#50. Qual a soma da duração dos Filmes por categoria?

SELECT SUM(f.duracao_do_filme), a.nome FROM filme f, categoria a, filme_categoria fa
WHERE f.filme_id = fa.filme_id
AND   fa.categoria_id = a.categoria_id
GROUP BY a.nome;

# 51. Qual a quantidade de filmes locados mês a mês por ano?
    
SELECT DISTINCT MONTH(data_de_aluguel) AS mes, YEAR(data_de_aluguel) AS ano, COUNT(titulo) AS quantidade
FROM aluguel a, filme f, inventario inv
WHERE a.inventario_id = inv.inventario_id
AND   inv.inventario_id  = f.filme_id
GROUP BY MONTH(data_de_aluguel)
ORDER  BY MONTH(data_de_aluguel) ASC;
 
 #52. Qual o total pago por classificação de filmes alugados no ano de 2006?
     
SELECT SUM(valor), classificacao
FROM filme f, inventario inv, aluguel a, pagamento p
WHERE a.aluguel_id = p.aluguel_id
AND a.inventario_id = inv.inventario_id
AND inv.filme_id = f.filme_id
AND   a.data_de_aluguel LIKE "2006%"
GROUP BY f.classificacao;


#53. Qual a média mensal do valor pago por filmes alugados no ano de 2005?
    
SELECT DISTINCT MONTH(a.data_de_aluguel) AS mes, AVG(p.valor) AS valor_mes
FROM filme f, inventario inv, aluguel a, pagamento p
WHERE a.aluguel_id = p.aluguel_id
AND a.inventario_id = inv.inventario_id
AND inv.filme_id = f.filme_id
AND  a.data_de_aluguel LIKE "2005%"
GROUP BY MONTH(data_de_aluguel);

#54. Qual o total pago por filme alugado no mês de Junho de 2006 por cliente?
    
SELECT MONTH(a.data_de_aluguel) AS mes, AVG(p.valor) AS valor_mes, primeiro_nome
FROM filme f, inventario inv, aluguel a, pagamento p, cliente cl
WHERE a.aluguel_id = p.aluguel_id
AND a.inventario_id = inv.inventario_id
AND inv.filme_id = f.filme_id
AND a.cliente_id = cl.cliente_id
AND p.cliente_id = cl.cliente_id
AND  a.data_de_aluguel LIKE "2006%"
AND MONTH(a.data_de_aluguel) = 6
GROUP BY cl.primeiro_nome;

#Procedures , Triggers e Viewers :

#Exercícios View:
1:
CREATE VIEW vw_idioma as
SELECT i.idioma_id, nome, filme_id, titulo
FROM idioma i, filme f
WHERE i.idioma_id = f.idioma_id;

SELECT * FROM vw_idioma;
2:
CREATE VIEW vw_inventario as
SELECT i.inventario_id, aluguel_id, l.loja_id
FROM inventario i, loja l, aluguel a
WHERE i.inventario_id = a.inventario_id and i.loja_id = l.loja_id;

SELECT * FROM vw_inventario;
3:
CREATE VIEW vw_aluguel as
SELECT aluguel_id, data_de_aluguel, a.cliente_id, primeiro_nome, email
FROM aluguel a, cliente c
WHERE a.cliente_id = c.cliente_id 
ORDER BY primeiro_nome asc;

SELECT * FROM vw_aluguel

#Exercícios Procedure:
1:
DELIMITER //
CREATE PROCEDURE sp_pais_id (in id int)
BEGIN
	SELECT * FROM pais
    WHERE pais_id = id;
    END //
DELIMITER ;

CALL sp_pais_id(8)
    
2:
DELIMITER //
CREATE PROCEDURE sp_aluguel_id (in id int)
BEGIN
	SELECT * FROM aluguel
    WHERE aluguel_id = id;
    END //
DELIMITER ;

CALL sp_aluguel_id(4)

3:
DELIMITER //
CREATE PROCEDURE sp_ator_id (in id int)
BEGIN
	SELECT * FROM ator
    WHERE ator_id = id;
    END //
DELIMITER ;

CALL sp_ator_id(105)

#Exercicio Trigger:
1:	
DELIMITER $$
CREATE TRIGGER after_update_loja
AFTER UPDATE ON LOJA
FOR EACH ROW
BEGIN
INSERT INTO log_updates (descricao, data_atualizacao)
VALUES ('Loja atualizada', NOW());
END $$
DELIMITER ;


2:
	
DELIMITER $$
CREATE TRIGGER after_update_idioma
AFTER UPDATE ON idioma
FOR EACH ROW
BEGIN
INSERT INTO log_updates (descricao, data_atualizacao)
VALUES ('idioma atualizada', NOW());
END $$
DELIMITER ;

3:
DELIMITER $$
CREATE TRIGGER after_update_inventario
AFTER UPDATE ON inventario
FOR EACH ROW
BEGIN
INSERT INTO log_updates (descricao, data_atualizacao)
VALUES ('idioma atualizada', NOW());
END $$
DELIMITER ;
