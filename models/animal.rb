class Animal

  attr_reader :id, :name, :admission_date
  attr_accessor :owner, :training_status, :vet_status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @admission_date = options['admission_date']
    @owner = options['owner']
    @training_status = options['training_status']
    @vet_status = options['vet_status']
  end


end