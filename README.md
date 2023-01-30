# Desafio Pokécoin

O objetivo desse desafio é montar uma carteira digital de Pokémons que possuem seus próprios valores em Bitcoin.

## Especificações do projeto

Esse projeto foi feito utilizando Ruby 3.0.3 com o framework Ruby on Rails 7.0.4.1.
Para obter os dados dos Pokémons, foi utilizada a API https://pokeapi.co/docs/v2.
Para obter a cotação do Bitcoin em dólares, foi utilizada a API https://blockchain.info/.

## Acessando o sistema na nuvem

Esse sistema foi hospedado em um domínio da [Fly.io](https://fly.io) e pode ser acessado por [aqui](https://pokecoin.fly.dev/).

## Executando localmente

Para executar o sistema localmente, é necessário seguir os passos abaixo.

Na raíz do projeto, executar os seguintes passos após ter o Ruby e o Rails instalados em sua máquina:

```bundle install```  
O comando acima irá instalar todas as dependências do projeto.

```rails db:create```  
Para criar os bancos de dados de desenvolvimento e de teste.

```rails db:migrate```  
Para executar as migrações do banco e criar os modelos desse projeto.

```rails db:seed```  
Para popular o banco de dados com os Pokémons obtidos na API https://pokeapi.co/docs/v2. A execução desse comando pode ser um pouco demorada pois mais de 800 pokémons são recuperados via API.

```rails s```  
Para executar o servidor na porta 3000.
