#enconding: utf-8

#DADO

Dado(/^Acessar Sistema$/) do
  login.load
end

Dado(/^que eu tenho um usuário adm com os seguintes atributos:$/) do |table|
    @user = table.rows_hash['Email']
    @pwd = table.rows_hash['Senha']
end

Dado(/^que sou "([^"]*)" do sistema$/) do |profile|
  @name = DATA['users'][profile]['name']
  @user = DATA['users'][profile]['email']
  @pwd = DATA['users'][profile]['password']
end

Dado(/^que eu tenho um "([^"]*)" e "([^"]*)"$/) do |email, password|
  @user = email
  @pwd = password
end

#QUANDO

Quando(/^faço login$/) do
    login.with(@user,@pwd)
end

#ENTAO
Então(/^vejo o dashboard logado com a mensagem de bem vindo$/) do
    expect(dash.view_title.text).to eql "Olá, #{@name}, seja bem vindo ao Invoices..."
    expect(dash.nav.user_menu.text).to eql @user
end

Então(/^vejo a mensagem "([^"]*)"$/) do |msg|
  expect(login.alert.text).to include msg
end


