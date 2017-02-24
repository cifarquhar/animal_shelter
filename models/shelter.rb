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

  def new_animal(animal_name,animal_training_status,animal_vet_status)
    timestamp = Time.new.to_s
    if animal_training_status == false && animal_vet_status == false
      animal_adoptable = true
    else
      animal_adoptable = false
    end
    new_animal = Animal.new({'name' => "#{animal_name}", 'admission_date' => timestamp, 'adoptable' => animal_adoptable, 'training_status' => animal_training_status, 'vet_status' => animal_vet_status})
    new_animal.save()
  end

  def new_owner(owner_name)
    new_owner = Owner.new({'name' => "#{owner_name}"})
    new_owner.save()
  end

  def assign_animal(owner,animal)
    owner.adopt_animal(animal) if animal.adoptable == true
  end

end