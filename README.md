# DISCOUNT-INSS

Este é um projeto desenvolvido em Ruby on Rails com o objetivo de fazer calculos de inss. Ele utiliza PostgreSQL como banco de dados, Redis e Sidekiq para processamento em background, e inclui bibliotecas para estilização, gráficos e paginação.

## Tecnologias Utilizadas

- **Ruby on Rails** >= 5.2.8
- **Ruby** 2.6.6
- **PostgreSQL** para o banco de dados
- **Bootstrap** para estilização front-end
- **Chart.js** para visualização de dados em gráficos
- **Rubocop Rails** para análise de estilo e padrões de código
- **Kaminari** para paginação de registros
- **Redis** como store para o Sidekiq
- **Sidekiq** para processamento de jobs em background

## Pré-requisitos

Certifique-se de que você possui as seguintes ferramentas instaladas:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Configuração

### Passo 1: Clonar o Repositório

```bash
git clone https://github.com/seu-usuario/nome-do-projeto.git
cd nome-do-projeto
```
### Configure as variaveis de ambiente do banco de dados
Crie um arquivo ```.env```