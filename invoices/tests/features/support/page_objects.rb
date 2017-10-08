require_relative '../pages/sections'

module Pages
    def login; LoginPage.new; end
    def dash; DashPage.new; end
    def customers; CustomersPage.new; end
end                
    