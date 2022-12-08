--Dentre os top 16 filmes mais alugados, qual o nome completo do ator mais presente nesses filmes?
--Saída esperada: 1 coluna e 1 linha com o nome completo.

--# Selecionando as colunas necessárias de cada tabela, criando uma nova tabela.

WITH tb_filmes AS (
  SELECT film_id, title FROM `big-data-demonstration.desafio_refera.film`),

tb_inventory as (
  SELECT inventory_id, film_id, last_update FROM `big-data-demonstration.desafio_refera.inventory`),

tb_rental as (
  SELECT rental_id, rental_date, inventory_id, customer_id, return_date FROM `big-data-demonstration.desafio_refera.rental`),


--# Selecionando as colunas necessárias para solução da demanda, criando novas tabelas e utilizando o LEFT JOIN para retornar registros,
--## De tabelas distintas

tb_filmes_inventory AS (
  SELECT
         a.film_id,
         a.title,
         b.inventory_id,
         b.last_update
  FROM tb_filmes AS a
    LEFT JOIN tb_inventory AS b
    ON a.film_id = b.film_id),

tb_filmes_inventory_rental AS (
  SELECT
         a.film_id,
         a.title,
         b. rental_date
  FROM tb_filmes_inventory AS a
    LEFT JOIN tb_rental AS b
    ON a.inventory_id = b.inventory_id),

--# Selecionando as colunas necessárias de cada tabela, criando uma nova tabela.

tb_film_actor AS (
  SELECT actor_id, film_id FROM `big-data-demonstration.desafio_refera.film_actor`),

tb_info_actor AS (
  SELECT actor_id, first_name, last_name FROM `big-data-demonstration.desafio_refera.actor`),

--# Selecionando as colunas necessárias para solução da demanda, criando novas tabelas e utilizando o LEFT JOIN para retornar registros,
--## De tabelas distintas

tb_film_actor_info AS (
  SELECT
         a.actor_id,
         a.film_id,
         b.first_name,
         b.last_name
  FROM tb_film_actor AS a
    LEFT JOIN tb_info_actor AS b
    ON a.actor_id = b.actor_id),

--# Utilização do Distinct com o count para eliminar as repetições e contar a quantidade de vezes que o filme foi alugado,
--## Utilização do Group By para agrupar os filmes por título e Order By para ordenar de acordo com a quantidade de vezes que foram alugados, 
--### Por fim usando o LIMIT para retornar os 16 filmes mais alugados

top_film_mais_alugados AS (
  SELECT 
   DISTINCT(title) as nm_filme, 
   COUNT(film_id) as qtd_aluguel,
   film_id
  FROM tb_filmes_inventory_rental
  GROUP BY title,film_id
  ORDER BY qtd_aluguel DESC
  LIMIT 16),

--# Selecionando as colunas necessárias para solução da demanda, criando novas tabelas e utilizando o LEFT JOIN para retornar registros,
--## De tabelas distintas

tb_top_actor AS (
  SELECT
         b.nm_filme,
         a.actor_id,
         a.film_id,
         a.first_name,
         a.last_name
  FROM tb_film_actor_info AS a
    LEFT JOIN top_film_mais_alugados AS b
    ON a.film_id = b.film_id),

--# Utilização do count e do DISTINCT para verificar a quantidade de vezes que o filme aparece sem repetições,
--## A função CONCAT para unir os valores de duas colunas em uma só, sendo o primeiro nome e o último, para formar o nome completo do ator
--### Group by para agrupar pelo nome completo do ator e o Order by para organizar e deixar em primeiro na tabela o nome que mais aparecesse
--### Limit para limitar a exibição em apenas uma linha e exibir o ator mais presente nos 16 filmes, conforme solicitado.

tb_top_actor_mais_alugados AS (
SELECT 
    count(DISTINCT(nm_filme)) as qtd_filme,
    CONCAT(rtrim(ltrim(first_name)),' ',rtrim(ltrim(last_name))) AS actor_full_name,
    actor_id
FROM tb_top_actor
GROUP BY actor_full_name, actor_id
order by qtd_filme DESC)

SELECT actor_full_name FROM tb_top_actor_mais_alugados
LIMIT 1