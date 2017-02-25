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

get '/animals/:id' do
  @animal = Animal.find(params[:id])[0]
  print @animal
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])[0]
  erb(:"animals/edit")
end


post '/animals/:id' do
  @animal = Animal.find(params[:id])[0]
  @shelter = Shelter.new
  @shelter.change_vet_status(@animal)
  @shelter.change_training_status(@animal)
  redirect to "animals/#{animal.id}"
end