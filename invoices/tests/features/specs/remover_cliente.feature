#language: pt

Funcionalidade: Remover Cliente


Cenario: Página de Clientes
    * Usuário acessa página de clientes

@new_user
Cenario: Remover um Cliente

    Quando removo um Cliente
    Então esse cliente não deve ser exibido na lista
