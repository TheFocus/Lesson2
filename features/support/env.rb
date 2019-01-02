require 'cucumber'
require 'capybara/rspec'
require 'capybara/cucumber'
require 'site_prism'
require 'require_all'
require_all 'pages'
require_relative 'feature_helper'
include FeatureHelper
$site_url = 'http://10.128.232.50/'
Capybara.app_host = $site_url

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
