# Desafio: Pessoa Desenvolvedora Web Júnior

Este projeto consiste no desenvolvimento inicial de um sistema de mensagens que recebe e dispara um webhook, criando novos usuários e fornecendo autenticação via API.

## Funcionalidades
1. Autenticação de usuário (Devise);
2. Edição de dados do usuário;
3. Recebimento de dados via webhooks para criação de usuários;
4. Envio de e-mails com senha provisória (Letter Opener);
5. Autenticação BASIC AUTH com TOKEN.

## Tecnologias Utilizadas
- Ruby 3.3.0
- Rails 7.1.5
- PostgreSQL
- Tailwind CSS

---

## Inicialização do Projeto
1. Clone o repositório:
   
   ```
   git clone git@github.com:mateusinacioo/api-message-system.git
   cd api-message-system
   ```
2. Instale as dependências:
   
   ```
   bundle install
   ```
3. Crie o banco de dados:
   
   ```
   rails db:create db:migrate
   ```
4. Execute a aplicação:
   
   ```
   ./bin/dev
   ```
5. Acesse o navegado em:
   
   ```
   http://localhost:3000/
   ```

## Criar e Atualizar Usuários via API

O arquivo `.env` já consta a variável de ambiente `API_AUTH_TOKEN` com o TOKEN. Abaixo segue os comandos:

1. Criar Usuário via API pelo console. Após execução será aberta uma aba em seu navegador com o e-mail de Boas-vindas.
   
   ```
   curl -X POST http://localhost:3000/webhooks \
    -H "Content-Type: application/json" \
    -H "Authorization: Basic YXBpdXNlcjphcGlzZWNyZXQ=" \
    -d '{
      "user": {
        "email": "user@user.com",
        "full_name": "Joãozinho",
        "birth_date": "2000-05-15",
        "cpf": "33059114099"
      }
    }'
   ```
2. Para atualizar usuário utilize o seguinte comando e na URL adicione o `ID` do usuário a ser atualizado.
   
   ```
    curl -X PATCH http://localhost:3000/webhooks/ID \
      -H "Content-Type: application/json" \
      -H "Authorization: Basic YXBpdXNlcjphcGlzZWNyZXQ=" \
      -d '{
        "user": {
          "full_name": "Joãozinho da Silva",
          "status": false
        }
      }'
   ```
## Motivos das escolhas das tecnologias

- Tailwind CSS: Agilidade na criação de interfaces modernas.
- Devise: Facilita a implementação de autenticação.
- Letter Opener: Utilizado para simular o envio de e-mails durante o desenvolvimento e facilitando a visualização.
- i18n: Implementado para internacionalizar o Devise.
- dotenv: Gerencia variáveis de ambiente para utilizar a autenticação por tokens.
- Rails + PostgreSQL: Venho estudando há um tempo o Rails e o PostgreSQL por ser o banco de dados que mais tenho conhecimento.
