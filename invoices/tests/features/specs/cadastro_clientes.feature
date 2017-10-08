#language: pt

Funcionalidade: Cadastro de Clientes
    Sendo um usuário do Invoices
    Posso cadastrar meus Clientes
    Para lançar faturas

@atual
Cenario: Página de Clientes
    * Usuário acessa página de clientes
@atual
Esquema do Cenario: Novo Cliente

    Dado que eu tenho um cliente do <tipo>
    Quando faço o cadastro desse cliente
    Entao vejo esse cliente na lista de clientes

    Exemplos:
    | tipo        |
    | "Gold"      |
    | "Prime"     |
    | "Platinum"  |

@lista
Cenario: Nova lista de clientes

    Dado que eu tenho uma lista de 5 clientes
    Quando faço o cadastro desses clientes
    Então vejo esses clientes na lista




