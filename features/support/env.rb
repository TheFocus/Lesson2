require 'cucumber'
require 'capybara/rspec'
require 'capybara/cucumber'
require 'site_prism'
require 'rest-client'
require 'require_all'
require_all 'pages'

$site_url = 'http://10.128.232.50/'
Capybara.app_host = $site_url


require_relative 'feature_helper'
require_relative 'api_helper'

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

include FeatureHelper
include ApiHelper