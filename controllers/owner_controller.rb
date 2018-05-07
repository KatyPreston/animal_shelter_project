require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("../models/owner")

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb(:"owners/show")
end

post '/owners/:id/delete' do # delete
  owner = Owner.find( params[:id] )
  owner.delete()
  redirect to '/owners'
end
