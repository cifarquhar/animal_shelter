require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative('../models/shelter.rb')
require_relative('../models/owner.rb')



get '/search' do
  erb ( :"search/new" )
end

post '/search' do
  name_to_search = params[:name].downcase
  animals = Animal.all
  searched_animal = animals.find {|animal| animal.name.downcase == name_to_search}
  redirect to "animals/#{searched_animal.id}"
end