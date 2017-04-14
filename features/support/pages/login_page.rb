# PageObject for login page
class LoginPage
  include PageObject

  page_url(BASE_URL + SIGN_IN_RESOURSE)

  element(:page, css: '#new_account')
  expected_element_visible(:page)

  element(:email, css: '#account_email')
  element(:password, css: '#account_password')
  element(:submit, css: '[type=submit]')

  def fill_form(email, password)
    has_expected_element_visible?
    email_element.send_keys(email)
    password_element.send_keys(password)
  end

  def click_submit_button
    has_expected_element_visible?
    submit_element.click
  end
end
