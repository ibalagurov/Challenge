# PageObject for Home page
class HomePage
  include PageObject

  page_url(BASE_URL)

  element(:page, css: '.b-home-page')
  expected_element_visible(:page)
end
