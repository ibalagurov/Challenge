# Page Object helpers
module PagesHelper
  def elem_name(name)
    name.to_s.downcase.tr(' ', '_')
  end

  def elem_with_name(name)
    send("#{elem_name(name)}_element")
  rescue NoMethodError
    raise NameError, "Undefined '#{name}' element for #{self.class} page"
  end
end
