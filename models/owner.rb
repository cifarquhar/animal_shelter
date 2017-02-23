require_relative('../db/sql_runner')

class Owner

  attr_reader :id, :name
  attr_accessor :adopted_pets

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @adopted_pets = options['adopted_pets']
  end

  def save()
    sql = "INSERT INTO owners (name) VALUES ('#{@name}') RETURNING id"
    owners = SqlRunner.run(sql)
    @id = owners[0]['id'].to_i
  end

end