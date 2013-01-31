require 'rspec'
require 'mongoid_markdown'
require 'mongoid'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end
