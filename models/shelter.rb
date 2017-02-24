require_relative('animal')
require_relative('owner')

class Shelter

  def initialize()
  end

  def list_animals()
    Animal.all()
  end

  def list_owners()
    Owner.all()
  end

  def new_animal(animal_name,animal_adoptable,animal_training_status,animal_vet_status)
    timestamp = Time.new.to_s
    trimmed_timestamp = 6.times do timestamp.chop! end
    new_animal = Animal.new({'name' => "#{animal_name}", 'admission_date' => timestamp, 'adoptable' => animal_adoptable, 'training_status' => animal_training_status, 'vet_status' => animal_vet_status})
    new_animal.save()
  end

end