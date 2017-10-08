#enconding: utf-8

#DADO

Dado(/^Usuário acessa página de clientes$/) do
  login.load
  login.with('kato.danzo@qaninja.com.br','secret')

  dash.nav.customers.click
end

Dado(/^que eu tenho um cliente do "([^"]*)"$/) do |type|
    @user = OpenStruct.new
    @user.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    @user.phone = "119#{Faker::Number.number(8)}" 
    @user.email = Faker::Internet.free_email(@user.name)
    @user.notes = Faker::ChuckNorris.fact
    @user.type = type
end

Dado(/^que eu tenho uma lista de (\d+) clientes$/) do |total|
  @arr = (0..total.to_i)
  @users = Array.new

  @types = ['Gold','Prime','Platinum']

  @arr.each do |item|
    u = OpenStruct.new
    u.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    u.phone = "119#{Faker::Number.number(8)}"
    u.email = Faker::Internet.free_email(u.name)
    u.type = @types.sample
    u.notes = Faker::ChuckNorris.fact
    @users.push(u)
  end
end


#QUANDO

Quando(/^faço o cadastro desse cliente$/) do
  customers.save(@user)
end

Quando(/^faço o cadastro desses clientes$/) do
  @users.each do |u|
    customers.save(u)
  end
end

Quando(/^removo um Cliente$/) do
  customers.wait_for_items(10)

  customers.items.each do |tr|
    if tr.text.include?(@user.email)
      tr.find('.fa-trash-o').click
      customers.modal_success.click
    end
  end
end


#ENTAO
Entao(/^vejo esse cliente na lista de clientes$/) do
  customers.search(@user.email)
  expect(customers.view.text).to include @user.name
  expect(customers.view.text).to include @user.phone
  expect(customers.view.text).to include @user.email
end

Então(/^vejo esses clientes na lista$/) do
  @users.each do |u|
    customers.search(u.email)
    expect(customers.view.text).to include u.name
    expect(customers.view.text).to include u.phone
    expect(customers.view.text).to include u.email
  end
end

Então(/^esse cliente não deve ser exibido na lista$/) do
  customers.search(@user.email)
  expect(customers.alert.text).to eql "\"#{@user.email}\" não encontrado."
end

