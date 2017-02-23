class Owner

  attr_reader :id, :name
  attr_accessor :adopted_pets

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @adopted_pets = options['adopted_pets']
  end

end