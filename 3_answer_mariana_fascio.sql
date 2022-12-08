--Quantos clientes novos a empresa adquiriu por mês? Considere a data de início de um novo cliente como sendo a data do primeiro filme que esse cliente alugou.
--Saída esperada: 2 colunas ( mês_entrada_cliente:date | quantidade_de_clientes:int ) e 3 linhas.

--# Utilização da função MIN para retornar a menor data, para descobrir a data de início do novo cliente e a GROUP BY para agrupar pelo id do cliente.

WITH tb_clients AS (
 SELECT 
    MIN(rental_date) as min_rental_date,
    customer_id
 FROM `big-data-demonstration.desafio_refera.rental`
 GROUP BY customer_id),

--#Utilização das funções CAST e EXTRACT para conventer de data para string o ano e o mês, e agrupar com o GROUP BY pelo id e pela data mínima.

tb_clients_modified AS (
 SELECT 
    CAST(EXTRACT(YEAR FROM min_rental_date) AS STRING) AS year,
    CAST(EXTRACT(MONTH FROM min_rental_date) AS STRING) AS month, 
    customer_id
 FROM tb_clients
 GROUP BY customer_id, min_rental_date)

--# Utilizand rtrim para retirar os espaços em branco e o ltrim para retornar uma sequência de caracteres no mesmo tipo de dados que a string de entrada
--## Count e DISTINCT para conferir a quantidade de clientes e agrupar por mês de entrada utilizando o GROUP BY

SELECT 
  CONCAT(rtrim(ltrim(year)),'-0',rtrim(ltrim(month))) AS mes_entrada_cliente, 
  COUNT(DISTINCT customer_id) AS quantidade_de_clientes
FROM tb_clients_modified
GROUP BY mes_entrada_cliente