# DISCOUNT-INSS

Este é um projeto desenvolvido em Ruby on Rails com o objetivo de fazer calculos de inss. Ele utiliza PostgreSQL como banco de dados, Redis e Sidekiq para processamento em background, e inclui bibliotecas para estilização, gráficos e paginação.

## Tecnologias Utilizadas

- **Ruby on Rails** >= 5.2.8
- **Ruby** 2.6.6
- **PostgreSQL** para o banco de dados
- **Bootstrap** 5.3
- **Chart.js** 0.1.7
- **Rubocop Rails**  1.33
- **Kaminari** 1.2
- **Redis** como store para o Sidekiq
- **Sidekiq** 4.0

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
```shel
POSTGRES_DB=nome do banco
POSTGRES_USER= usuario
POSTGRES_PASSWORD= senha
REDIS_URL= redis://redis:6379/1
RAILS_ENV=development
```
## Construir e Executar o projeto

```bash
docker compose build
docker compose up 
```

Seja feliz!!!
