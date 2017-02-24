require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animals_controller')
# require_relative('controllers/victims_controller')
# require_relative('controllers/bitings_controller')

get '/' do
  erb( :index )
end