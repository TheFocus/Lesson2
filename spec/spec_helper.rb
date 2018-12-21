require 'capybara/rspec'
require 'site_prism'
require 'require_all'
require_all 'pages'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end