# # Desafio Refera
## Resposta para o desafio de SQL.

A ferramenta escolhida para resolução do desafio foi o BigQuery dentro do Google Cloud Plataform. Optei pela utilização de subqueries tendo em vista a utilização de diversas tabelas para a resolução dos problemas apresentados.

### Questões solucionadas
=================
<!--ts-->
  * Questão 1 - Qual foi os top 2 filmes mais alugados de todos os tempos?
              - Saída esperada: 2 colunas(título do filme, quantidade) e 2 linhas.
           
   Arquivo SQL com a query: 
   [Arquivo SQL](https://github.com/marifascio/desafio_refera/blob/main/1_answer_mariana_fascio.sql)
   
   Solução:
   ![teste_refera_q_1](https://github.com/marifascio/images1/blob/main/QUERY_1_RESULT.png)
  
  * Questão 2 - Dentre os top 16 filmes mais alugados, qual o nome completo do ator mais presente nesses filmes?
              - Saída esperada: 1 coluna e 1 linha com o nome completo.
           
   Arquivo SQL com a query: 
   [Arquivo SQL](https://github.com/marifascio/desafio_refera/blob/main/2_answer_mariana_fascio.sql)
   
   Solução:
   ![teste_refera_q_2](https://github.com/marifascio/images1/blob/main/QUERY_2_RESULT.png)
   
  * Questão 2 - Quantos clientes novos a empresa adquiriu por mês? 
              - Considere a data de início de um novo cliente como sendo a data do primeiro filme que esse cliente alugou.
              - Saída esperada: 2 colunas ( mês_entrada_cliente:date | quantidade_de_clientes:int ) e 3 linhas.
           
   Arquivo SQL com a query: 
   [Arquivo SQL](https://github.com/marifascio/desafio_refera/blob/main/3_answer_mariana_fascio.sql)
   
   Solução:
   ![teste_refera_q_3](https://github.com/marifascio/images1/blob/main/QUERY_3_RESULT.png)
