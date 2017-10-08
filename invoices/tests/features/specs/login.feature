#language: pt

Funcionalidade: Login
    Sendo um usuário do Invoices
    Posso fazer Login
    Para acessar minha conta e meus clientes

@atual
Cenario: Acessar Sistema
    * Acessar Sistema

@atual
@logout
Cenário: Adm faz login

    Dado que sou "admin" do sistema
    Quando faço login
    Então vejo o dashboard logado com a mensagem de bem vindo


@inv
Esquema do Cenario: Tentativa de login

    Dado que eu tenho um <email> e <senha>
    Quando faço login
    Então vejo a mensagem <msg>

    Exemplos:

      | email                        | senha     | msg                        |
      | "kato.danzo@qaninja.com.br"  | "secret1" | "Senha inválida."          |
      | "kato1.danzo@qaninja.com.br" | "secret " | "Usuário não cadastrado."  |
      | "teste@"                     | "secret"  | "Informe um email válido." |
