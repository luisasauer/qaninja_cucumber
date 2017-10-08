class LoginPage < SitePrism::Page
    set_url '/login'

    section :nav, Sections::NavBar, '#navbar'
    
    element :username, 'input[id=email]'
    element :password, 'input[type=password]'
    element :sig_in, '.login-button'
    element :alert, '.alert-warning'
    
    def with(u,p)
       self.username.set '' 
       self.username.set u
       self.password.set '' 
       self.password.set p
       self.sig_in.click
    end
end