require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

get '/adoptions' do
  @adoptions = Adoption.all()
  erb ( :"adoptions/index" )
end

get '/adoptions/:id' do
  @adoption = Adoption.find(params['id'].to_i)
  erb(:"adoptions/show")
end
