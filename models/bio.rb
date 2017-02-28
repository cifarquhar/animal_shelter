require_relative('../db/sql_runner')
require_relative('animal')

class Bio

  attr_reader :id, :animal_id
  attr_accessor :biography

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @biography = options['biography']
  end

  def self.map_bios(sql)
    bios = SqlRunner.run(sql)
    return bios.map {|bio| Bio.new(bio)}   
  end

  def save()
    sql = "INSERT INTO bios (animal_id,biography) VALUES (#{@animal_id},'#{@biography}') RETURNING *"
    new_bio = SqlRunner.run(sql)
    @id = new_bio[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM bios"
    SqlRunner.run(sql)
  end


end