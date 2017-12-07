ENV['RACK_ENV'] = 'test'


require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

class MainAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_api_root
    get '/'
    assert last_response.ok?
    assert_equal 'Welcome to my API!', last_response.body
  end

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end