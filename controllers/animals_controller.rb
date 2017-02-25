require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative('../models/shelter.rb')



get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

get '/animals/new' do
  erb(:"animals/new")
end

post '/animals' do
  @shelter = Shelter.new
  @shelter.new_animal(params[:name],params[:type],params[:training_status],params[:vet_status])
  erb(:"animals/create")
end