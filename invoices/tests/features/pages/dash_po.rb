class DashPage < SitePrism::Page
    section :nav, Sections::NavBar, '#navbar'
    
    element :view_title, '#page_title'
end