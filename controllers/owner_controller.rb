require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("../models/owner")

get '/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id] )
  erb(:"owners/edit")
end

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb(:"owners/show")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update()
  redirect to ("/owners")
end

post '/owners' do
  owner = Owner.new(params)
  owner.save()
  redirect to("/owners")
end

post '/owners/:id/delete' do
  owner = Owner.find(params[:id] )
  owner.delete()
  redirect to ("/owners")
end
