# Steps helpers
module StepsHelper
  def prepare(name)
    name.to_s.split(' ').map(&:capitalize).join('')
  end

  # make class from string "data alert" => DataAlert
  def page_by_name(name)
    Object.const_get(prepare(name))
  rescue NoMethodError
    raise NameError, "Undefined '#{name}' page object name"
  end

  # make class from string "Login" => LoginPage
  def page_with_url_by_name(name)
    Object.const_get(prepare(name) + 'Page')
  rescue NoMethodError
    raise NameError, "Undefined '#{name}' page name"
  end

  def zip_for_print(names, states)
    names.zip(states).map { |name, state| "#{name} - #{state}" }.join("\n")
  end
end
