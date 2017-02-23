require_relative('../db/sql_runner')

class Animal

  attr_reader :id, :name, :admission_date
  attr_accessor :owner, :training_status, :vet_status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @admission_date = options['admission_date']
    @adoptable = options['adoptable']
    @owner = options['owner'] if options['owner']
    @training_status = options['training_status']
    @vet_status = options['vet_status']
  end

  def save()
    sql = "INSERT INTO animals (name,admission_date,adoptable,training_status,vet_status) VALUES ('#{@name}',#{@admission_date},#{@adoptable},#{@training_status},#{@vet_status}) RETURNING id"
    animals = SqlRunner.run(sql)
    @id = animals[0]['id'].to_i
  end


end