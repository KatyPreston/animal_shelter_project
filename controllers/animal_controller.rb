require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("../models/animal")


get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

get '/animals/show_adoptable' do
  animals = Animal.all
  @animals = Animal.adoptable_animals(animals)
  erb ( :"animals/show_adoptable" )
end

get '/animals/new' do
  @animals = Animal.all
  erb(:"animals/new")
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
  animal = Animal.new(params).update
  redirect to '/animals'
end

post '/animals' do
  animal = Animal.new(params)
  animal.save
  redirect to("/animals")
end

post '/animals/:id/delete' do
  animal = Animal.find( params[:id] )
  animal.delete()
  redirect to '/animals'
end
