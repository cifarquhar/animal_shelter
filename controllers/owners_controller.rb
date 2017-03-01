require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative('../models/shelter.rb')
require_relative('../models/animal.rb')

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/new' do
  erb(:"owners/new")
end

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb(:"owners/show")
end

post '/owners' do
  @owner = Owner.new(params)
  @owner.save
  erb(:"owners/create")
end

post '/owners/:id/delete' do
  owner = Owner.find(params[:id])
  animals = Animal.all
  shelter = Owner.find_by_name("Shelter")
  animals_owned = animals.find_all {|animal| animal.owner_id == owner.id}
  animals_owned.each do |animal|
    animal.assign_to_owner(shelter)
    animal.adoptable = "t"
  end
  owner.delete() 
  erb(:"owners/destroy")
end