require 'capybara/rspec'
require 'site_prism'
require 'rest-client'
require 'require_all'
require_all 'pages'
require_relative '../spec/support/feature_helper'
require_relative '../spec/support/api_helper'
include FeatureHelper
include ApiHelper

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

