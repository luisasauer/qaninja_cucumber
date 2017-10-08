                              
After('@logout') do
    dash.nav.user_menu.click
    dash.nav.logout_link.click

    login.load
end

Before ('@new_user') do
    
    @types = ['Gold','Prime','Platinum']

    @user = OpenStruct.new
    @user.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    @user.phone = "119#{Faker::Number.number(8)}"
    @user.email = Faker::Internet.free_email(@user.name)
    @user.type = @types.sample
    @user.notes = Faker::ChuckNorris.fact

    customers.save(@user)
    
end

After do |scenario|
    puts 'O teste falhou' if scenario.failed?
end