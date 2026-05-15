require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module FinalTodo
# Added comments for explanation
  class Application < Rails::Application
    config.load_defaults 7.1
  end
end