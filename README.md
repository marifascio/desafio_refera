# # Desafio Refera
## Resposta para o desafio de SQL.
### Questões solucionadas
=================
<!--ts-->
  * Questão 1 - [Tecnologias utilizadas](#Tecnologias)
  * [Arquitetura de dados](#Arquitetura-de-Dados)
  * [Análise dos dados](#Análise-dos-dados)
    * [Item 1](#Item-1)
    * [Item 2](#Item-2)
    * [Item 3](#Item-3)
    * [Item 4](#Item-4)
  * [Libs instaladas](#Libs-instaladas)
 <!--te-->

### Tecnologias

As seguintes ferramentas foram usadas na resolução dos questionamentos:

- Dbeaver
- Docker
- Postgres
- Jupyter
- Anaconda
- Pandas
- Python
- Drawio
- Data Studio

### Arquitetura de Dados

![teste_mobi7_draw](https://github.com/marifascio/images/blob/main/Diagrama.drawio.png)

### Análise dos dados

```python
select vehicle_id, 
count(vehicle_id) as numero_de_viagens,
sum(total_distance) as distancia_percorrida,
sum(total_moving) as tempo_de_viagem,
sum(total_idle) as tempo_parado
FROM mobi7_code_interview.public.trip
group by vehicle_id

#criando nova tabela dentro do banco de dados utilizando o DBeaver

create table tb_resuldados_mariana
as select vehicle_id, 
count(vehicle_id) as numero_de_viagens,
sum(total_distance) as distancia_percorrida,
sum(total_moving) as tempo_de_viagem,
sum(total_idle) as tempo_parado
FROM mobi7_code_interview.public.trip
group by vehicle_id
```

# Item 1

### 1.	Script que processe os dados disponibilizados e consolide as informações mensalmente por veículo:
Utilizando SQL na ferramenta DBeaver, é possível extrair da tabela 'trip' as informações solicitadas por meio das querys:

#### a.	Total de viagens realizadas:
```python
select vehicle_id, 
count(vehicle_id) as numero_de_viagens
FROM mobi7_code_interview.public.trip
group by vehicle_id
```

#### b.	Total de quilômetros percorridos:
```python
select vehicle_id, 
sum(total_distance) as distancia_percorrida
FROM mobi7_code_interview.public.trip
group by vehicle_id
```

#### c.	Total de tempo em movimento:
```python
select vehicle_id, 
sum(total_moving) as tempo_de_viagem
FROM mobi7_code_interview.public.trip
group by vehicle_id
```

#### d.	Total tempo parado:
```python
select vehicle_id, 
sum(total_idle) as tempo_parado
FROM mobi7_code_interview.public.trip
group by vehicle_id
```

# Item 2 

### 2.	Os resultados devem ser gerados e enviados a uma tabela no próprio banco de dados. Portanto, é importante ter:
Utilizando o DBeaver, é possível criar uma nova tabela dentro do banco de dados do Postgres por meio da query descrita no item 'a', gerando o resultado exposto no item 'b'.

#### a.	Script para geração da(s) tabela(s) de armazenamento no banco de dados
```python
create table tb_resuldados_mariana
as select vehicle_id, 
count(vehicle_id) as numero_de_viagens,
sum(total_distance) as distancia_percorrida,
sum(total_moving) as tempo_de_viagem,
sum(total_idle) as tempo_parado
FROM mobi7_code_interview.public.trip
group by vehicle_id
```

#### b.	Resultados do script inseridos após execução do script
![nova_tabela_mobi7](https://github.com/marifascio/images/blob/main/tabela_resultados.png)

# Item 3 

### 3.	Como o cliente quer ter essa base por email, os dados consolidados devem também ser expurgado em um arquivo chamado resultados.csv, consolidado por veículo e por mês.

A automação foi desenvolvida utilizando a ferramenta Jupyter Notebook, na linguagem Python com importação da biblioteca psycopg2 para que fosse possível conectar com o Postgres para acessar os dados gerados e utilizando a biblioteca pandas para que fosse possível expurgar a tabela criada em um arquivo no formato csv, que é encaminhado automaticamente por e-mail para o cliente, possuindo, ainda, no corpo do e-mail o link de acesso para o dashboard criado no Google DataStudio, para que seja possível utilizar o programa, é necessário executar o arquivo ![arquivo_py_mobi7](https://github.com/marifascio/dataengineer/blob/main/automacao_query_email_mobi7.py) utilizando um Prompt, por exemplo, o Anaconda Prompt que foi o utilizado no teste.

![automacao_email_mobi7](https://github.com/marifascio/images/blob/main/automacao_query_email_mobi7.jpeg)

Resultado:

![email_mobi7](https://github.com/marifascio/images/blob/main/email_mobi7.png)
 
# Item 4 
### 4.	Os itens descritos acima mostrados em um dashboard.

O dashboard foi criado utilizando a ferramenta Google DataStudio.

https://datastudio.google.com/u/0/reporting/d61eb5f0-7c88-497a-93d0-8a6c8931e0a8/page/uVxzC?s=glY2rvHLXFQ

![dashboard_mobi7](https://github.com/marifascio/images/blob/main/dashboard.png)

# Libs instaladas

As seguintes libs foram instaladas:

- pandas
- pytz
- psycopg2
- smtplib
