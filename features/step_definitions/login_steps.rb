include StepsHelper

Given(/^I am on the "([^"]*)" page$/) do |page_name|
  page = page_with_url_by_name(page_name)
  visit(page)
end

When(/^I login with "([^"]*)" email and "([^"]*)" password$/) do |email, password|
  on(LoginPage).fill_form(email, password)
  on(LoginPage).click_submit_button
end

When(/^I login as default user$/) do
  step %(I login with "#{EMAIL}" email and "#{PASSWORD}" password)
end

Then(/^I should see "([^"]*)" text at "([^"]*)"$/) do |expected_text, page_name|
  page = page_by_name(page_name)
  actual_text = on(page).text

  unless actual_text.include?(expected_text)
    raise "Wrong text in #{page}:\n'#{actual_text}'\n"\
          "Should contain:\n'#{expected_text}'"
  end
end

Then(/^I should see "([^"]*)" page$/) do |page_name|
  page = page_with_url_by_name(page_name)
  on(page).has_expected_element_visible?
end

Then(/^I should see( only)? "([^"]*)" account actions$/) do |only, action_names|
  actions = action_names.split(',').map(&:downcase).map(&:strip)

  visibility_array = on(AccountActions).elems_visibility(actions)

  unless visibility_array.all?
    raise "Not all expected account actions visible:\n"\
          "#{zip_for_print(actions, visibility_array)}"
  end

  if only
    raise "Wrong amount" unless on(AccountActions).amount == actions.size
  end
end
