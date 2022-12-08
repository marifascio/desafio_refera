-- Qual foi os top 2 filmes mais alugados de todos os tempos?
-- Saída esperada: 2 colunas(título do filme, quantidade) e 2 linhas.

-- # Selecionando as colunas necessárias de cada tabela, criando uma nova tabela.

WITH tb_filmes AS (
  SELECT film_id, title FROM `big-data-demonstration.desafio_refera.film`),

tb_inventory as (
  SELECT inventory_id, film_id, last_update FROM `big-data-demonstration.desafio_refera.inventory`),

tb_rental as (
  SELECT rental_id, rental_date, inventory_id, customer_id, return_date FROM `big-data-demonstration.desafio_refera.rental`),

-- # Selecionando as colunas necessárias para solução da demanda, criando novas tabelas e utilizando o LEFT JOIN para retornar registros,
-- ## De tabelas distintas

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
    ON a.inventory_id = b.inventory_id)

-- # Utilização do Distinct com o count para eliminar as repetições e contar a quantidade de vezes que o filme foi alugado,
-- ## Utilização do Group By para agrupar os filmes por título e Order By para ordenar de acordo com a quantidade de vezes que foram alugados, 
-- ### Por fim usando o LIMIT retornar o top 2, conforme solicitado

SELECT 
  DISTINCT(title) as nm_filme, 
  count(film_id) as qtd_aluguel FROM tb_filmes_inventory_rental
GROUP BY title
ORDER BY qtd_aluguel DESC
LIMIT 2