# app.rb


require 'sinatra'
require 'sinatra/json'
require 'bundler'
#require 'json'
Bundler.require
require 'review'
#require 'data_mapper'


#DataMapper.setup(:default, 'sqlite::memory:') 
DataMapper.setup(:default, 'sqlite:///Users/cr/dev_tests/ruby/sinatra-rest-api/data/data.db')
DataMapper.finalize
DataMapper.auto_migrate!

get '/' do
  'Welcome to Sinatra!'
end

get '/reviews' do
    content_type :json
    reviews = Review.all
    reviews.to_json
end

post '/reviews' do
    review = Review.new params[:review]
    if review.save
    	status 201
    else
    	status 500
    	json review.errors.full_messages
    end
end