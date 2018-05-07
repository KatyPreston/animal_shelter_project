require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("../models/animal")


get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

get '/animals/:id' do
  @animal = Animal.find(params['id'].to_i)
  erb(:"animals/show")
end

# edit
get '/animals/:id/edit' do
  @animal = Animal.find(params[:id] )
  erb(:"animals/edit" )
end

post '/animals/:id' do
  Animal.new(params).update
  redirect to '/animals'
end
