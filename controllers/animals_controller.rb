require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative('../models/shelter.rb')
require_relative('../models/bio.rb')



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
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

get '/animals/:id/edit_bio' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

get '/animals/:id/edit_vet' do
  @animal = Animal.find(params[:id])
  @shelter = Shelter.new
  @shelter.change_vet_status(@animal)
  redirect to "animals/#{@animal.id}"
end

get '/animals/:id/edit_training' do
  @animal = Animal.find(params[:id])
  @shelter = Shelter.new
  @shelter.change_training_status(@animal)
  redirect to "animals/#{@animal.id}"
end

post '/animals/:id' do
  @animal = Animal.find(params[:id])
  if @animal.show_bio == ""
    @animal.add_bio(params[:biography]) 
  else
    @animal.update_bio(params[:biography])
  end
  erb(:"animals/create_bio")
end

post '/animals/:id/delete' do
  animal = Animal.find(params[:id])
  animal_bio = Bio.find(animal.id)
  animal_bio.delete() if animal_bio
  animal.delete() 
  erb(:"animals/destroy")
end

get '/animals/:id/assign' do
  @animal = Animal.find(params[:id])
  if @animal.adoptable == 't'
    erb(:"animals/assign")
  else
    erb(:"animals/assign_fail")
  end
end

post '/animals/:id/assign' do
  animal = Animal.find(params[:id])
  owner = Owner.find(params[:owner_id])
  animal.assign_to_owner(owner)
  erb(:"animals/assign_confirm")
end