require_relative('../db/sql_runner')
require_relative('owner')
require_relative('bio')

class Animal

  attr_reader :id, :name, :admission_date, :type
  attr_accessor :adoptable, :owner_id, :training_status, :vet_status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @admission_date = options['admission_date']
    @adoptable = options['adoptable']
    @owner_id = options['owner_id'].to_i if options['owner_id']
    @training_status = options['training_status']
    @vet_status = options['vet_status']
  end

  def save()
    sql = "INSERT INTO animals (name,admission_date,type,adoptable,training_status,vet_status) VALUES ('#{@name}','#{@admission_date}','#{@type}',#{@adoptable},#{@training_status},#{@vet_status}) RETURNING id"
    animals = SqlRunner.run(sql)
    @id = animals[0]['id'].to_i
  end

  def self.map_animals(sql)
    animals = SqlRunner.run(sql)
    return animals.map {|animal| Animal.new(animal)}   
  end

  def self.all()
    sql = "SELECT * FROM animals"
    self.map_animals(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE @id = #{id}"
    self.map_animals(sql)[0]
  end

  def update()
    sql = "UPDATE animals SET (adoptable,training_status,vet_status) = (#{@adoptable},#{@training_status},#{@vet_status}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def assign_to_owner(owner)
    @owner_id = nil
    sql = "UPDATE animals SET (owner_id) = (#{owner.id}) WHERE id = #{@id}"
    SqlRunner.run(sql)
    @owner_id = owner.id
  end

  def owner()
    sql = "SELECT o.* FROM owners o INNER JOIN animals a ON a.owner_id = o.id WHERE o.id = #{@owner_id}"
    animal_owner = Owner.map_owners(sql)
    return animal_owner[0].name
  end

  def add_bio(bio)
    new_bio = Bio.new({'animal_id' => @id, 'biography' => bio})
    new_bio.save
  end

  def update_bio(bio)
    animal_bio = Bio.find(@id)
    animal_bio.biography = bio
    animal_bio.update
  end

  def show_bio()
    sql = "SELECT b.* FROM bios b INNER JOIN animals a ON a.id = b.animal_id WHERE b.animal_id = #{@id}"
    bio = Bio.map_bios(sql)[0]
    if bio
      return bio.biography
    else
      return ""
    end
  end


end