require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative('../models/shelter.rb')
require_relative('../models/owner.rb')



get '/search/animal' do
  erb ( :"search/new" )
end

post '/search' do
  name_to_search = params[:name].downcase
  type_to_search = params[:type].downcase
  animals_to_search = Animal.all
  if name_to_search != ""
    searched_animal = animals_to_search.find {|animal| animal.name.downcase == name_to_search}
    redirect to "animals/#{searched_animal.id}"
  else
    @animals = animals_to_search.find_all {|animal| animal.type.downcase == type_to_search}
    erb(:"animals/index")
  end
end
