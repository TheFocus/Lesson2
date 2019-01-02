require 'capybara/rspec'
require 'site_prism'
require 'require_all'
require_all 'pages'
require_relative '../spec/support/feature_helper'
include FeatureHelper

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

