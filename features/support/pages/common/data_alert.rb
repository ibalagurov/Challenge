# PageObject for alert messages
class DataAlert
  include PageObject

  element(:page, css: '[data-alert]')
  expected_element_visible(:page)

  element(:close_button, css: '[data-dismiss="alert"]')

  def text
    has_expected_element_visible?
    page
  end

  def close
    has_expected_element_visible?
    close_button_element.when_present.click
  end
end
