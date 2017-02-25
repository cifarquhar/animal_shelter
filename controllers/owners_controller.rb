require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative('../models/shelter.rb')

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end