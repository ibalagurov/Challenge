# PageObject for Account page
class AccountPage
  include PageObject

  page_url(BASE_URL + ACCOUNT_RESOURSE)
  
  element(:page, css: '#manage-account')
  expected_element_visible(:page)
end
