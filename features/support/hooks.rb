# methods executable before \ after each or special test
Before do
  @browser = Watir::Browser.new(:chrome)
  @browser.window.maximize
end

After do
  @browser.close
end
