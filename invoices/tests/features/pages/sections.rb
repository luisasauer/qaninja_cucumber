
module Sections
    class NavBar < SitePrism::Section
        element :customers,'#menu a[href$=customers]'
        element :user_menu, '#menu a[data-toggle=dropdown]'
        element :logout_link, 'a[href$=logout]'
    end
end



