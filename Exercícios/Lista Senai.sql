
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

#Ex 19: Qual a maior duração da locação dentre os filmes?
Select MAX(duracao_da_locacao) from filme

#Ex 20: Quantos filmes possuem a maior duração de locação?
select count(*) from filme
where duracao_da_locacao = 7
select * duracao

#Ex21: Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de locação?
SELECT COUNT(*) 
FROM filme
WHERE duracao_da_locacao = 7 
AND (idioma_id = 3 OR idioma_id = 6);

#Ex22: Qual a quantidade de filmes por classificação e preço da locação?
SELECT classificacao, preco_da_locacao, COUNT(*) AS quantidade_filme
FROM filme
GROUP BY classificacao, preco_da_locacao;

#Ex23: Qual o maior tempo de duração de filme por categoria?
select max(duracao_do_filme), categoria.nome
from filme,categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and categoria.categoria_id=filme_categoria.categoria_id
group by categoria.categoria_id

#Ex24: Listar a quantidade de filmes por categoria.
select count(*) as Quantidade, categoria.nome
from filme,categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and categoria.categoria_id=filme_categoria.categoria_id
group by categoria.categoria_id

#Ex25: Listar a quantidade de filmes classificados como "G" por categoria.
select count(*) as Quantidade, categoria.nome
from filme,categoria, filme_categoria
where filme.filme_id = filme_categoria.filme_id
and categoria.categoria_id=filme_categoria.categoria_id
group by categoria.categoria_id

#Exc27: Listar a quantidade de filmes por categoria e classificação.
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
SELECT YEAR(ano_de_lancamento) AS ano_lanc
FROM filme
WHERE preco_da_locacao > (
    SELECT AVG(preco_da_locacao)
    FROM filme
    JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
    WHERE filme_categoria.nome = 'Children'
)
GROUP BY YEAR(ano_de_lancamento)
HAVING COUNT(filme.filme_id) > 100;

#Exc 32: Quais as cidades e seu pais correspondente que pertencem a um país que inicie com a:
select cidade 
