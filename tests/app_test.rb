ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

class MainAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # GET /
  def test_api_root
    get '/'
    assert last_response.ok?
    assert_equal 'Welcome to my API!', last_response.body
  end

  # POST /review/:id
  def test_post_review
    post '/review', review: {
      name: "Joe",
      text: "Hello"
    }
    assert_equal 201, last_response.status
  end
  
  # GET /reviews
  def test_get_reviews
    get 'reviews'
    assert_equal 200, last_response.status
  end

  # GET /review/:id
  def test_get_review_by_id
    #get 'review' , params: {id: 1}
    get "/review/1" #, :id => 1
    assert_equal 200, last_response.status
    assert_includes last_response.content_type, 'application/json'
    assert_includes last_response.body, 'Joe'

    # assert last_response.ok?
    # response = JSON.parse(last_response.body)
    # assert_equal 5, response.count

  end

  # PUT /review/:id
  def test_put_review
    put '/review/1', review: {
      name: "Jim",
      text: "Hello"
    }
    assert_equal 200, last_response.status
  end

  # DELETE /review/:id
  def test_delete_review
    delete '/review/1'
    assert_equal 200, last_response.status
  end
  

  # def test_it_says_hello_to_a_person
  #   get '/', :name => 'Simon'
  #   assert last_response.body.include?('Simon')
  # end
end