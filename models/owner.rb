require_relative('../db/sql_runner')

class Owner

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def get_name()
    return @name
  end

  def save()
    sql = "INSERT INTO owners (name) VALUES ('#{@name}') RETURNING id"
    owners = SqlRunner.run(sql)
    @id = owners[0]['id'].to_i
  end

  def self.map_owners(sql)
    ownerss = SqlRunner.run(sql)
    return ownerss.map {|owner| Owner.new(owner)}   
  end

  def self.all()
    sql = "SELECT * FROM owners"
    self.map_owners(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE @id = #{id}"
    self.map_owners(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def adopt_animal(animal)
    sql = "UPDATE animals SET (owner_id) = (#{@id}) WHERE id = #{animal.id}"
    SqlRunner.run(sql)
    animal.owner_id = @id
  end

  def animals()
    sql = "SELECT a.* FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE a.owner_id = #{@id}"
    animals = Animal.map_animals(sql)
    animals.map {|animal| animal.name}
  end

end