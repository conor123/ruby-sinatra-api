# app.rb

require 'sinatra'
require 'sinatra/json'
require 'bundler'
Bundler.require
require 'review'

#DataMapper.setup(:default, 'sqlite::memory:') 
DataMapper.setup(:default, 'sqlite:///Users/cr/dev_tests/ruby/sinatra-rest-api/data/data.db')
DataMapper.finalize
DataMapper.auto_migrate!

get '/' do
  'Welcome to my API!'
end

# POST

post '/review' do
    review = Review.new params[:review]
    if review.save
        status 201
    else
        status 500
        json review.errors.full_messages
    end
end

# GET

get '/review/:id' do
    content_type :json
    review = Review.get params[:id]
    review.to_json
end

get '/reviews' do
    content_type :json
    reviews = Review.all
    reviews.to_json
end

# PUT

put '/review/:id' do 
    review = Review.get params[:id]
    if review.update params[:review]
        status 200
        json "Review Entered/Updated"
    else
        status 500
        json review.errors.full_messages
    end
end
# DELETE
delete '/review/:id' do 
    review = Review.get params[:id]
    if review.destroy 
        status 200
        json "Review Deleted"
    else
        status 500
        json review.errors.full_messages
    end
end





