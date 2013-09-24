require 'coveralls'
Coveralls.wear!
ENV['RACK_ENV'] = 'test'
require_relative '../app'
require 'minitest/autorun'
require 'rack/test'

class MiniTest::Spec
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file(File.dirname(__FILE__) + '/../config.ru').first
  end
end
