class CustomersPage < SitePrism::Page
    set_url '/customers'

    section :nav, Sections::NavBar, '#navbar'
    
    element :alert, '.alert-warning'

    element :insert_button, '#dataview-insert-button'
    element :name, 'input[name=name]'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :type, 'select[id=type-customer]'
    element :notes, 'textarea[name=note]'
    element :autorization, 'input[type=checkbox]'
    element :save_button, '#form-submit-button'

    element :search_field, '#dataview-search-input'
    element :search_button, '#dataview-search-button'
    element :view, 'table[id=dataview-table] tbody'

    elements :items, '#dataview-table tbody tr'

    element :modal_success, '.modal-dialog button[data-bb-handler=success]'
    

    def save(user)
        self.insert_button.click
        self.name.set user.name
        self.phone.set user.phone
        self.email.set user.email
        self.type.find('option', text: user.type).select_option
        self.notes.set user.notes

        self.autorization.click
        self.save_button.click
    end

    def search(target)
        self.search_field.set target
        self.search_button.click
    end
end


