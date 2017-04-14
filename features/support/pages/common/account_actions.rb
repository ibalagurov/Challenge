# PageObject for alert messages
class AccountActions
  include PageObject
  include PagesHelper

  element(:page, css: '#account')
  expected_element_visible(:page)

  elements(:actions, css: '#account [href]')
  element(:console, css: '[data-target="#consoleModal"]')
  element(:my_account, css: "[href$='#{ACCOUNT_RESOURSE}']")
  element(:log_out, css: "[href$='#{SIGN_OUT_RESOURSE}']")
  element(:sign_in, css: "[href$='#{SIGN_IN_RESOURSE}']")
  element(:sign_up, css: "[href$='#{SIGN_UP_RESOURSE}']")

  def amount
    has_expected_element_visible?
    actions_elements.count(&:present?)
  end

  def elems_visibility(elems)
    has_expected_element_visible?
    elems.map { |name| elem_with_name(name).present? }
  end
end
