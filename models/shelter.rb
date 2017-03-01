require_relative('animal')
require_relative('owner')

class Shelter

  def initialize()
  end


  def new_animal(animal_name,animal_type,animal_training_status,animal_vet_status)
    timestamp = Time.new.to_s

    animal_adoptable = false

    animal_adoptable = true if animal_training_status == "false" && animal_vet_status == "false"
  
    new_animal = Animal.new({'name' => "#{animal_name.capitalize}", 'type' => "#{animal_type.capitalize}", 'admission_date' => timestamp, 'adoptable' => animal_adoptable, 'training_status' => animal_training_status, 'vet_status' => animal_vet_status})
    new_animal.save()
    shelter = Owner.find_by_name("Shelter")
    new_animal.assign_to_owner(shelter)
  end


  def check_adoptable_status(animal)
    if animal.vet_status == false && animal.training_status == false
      animal.adoptable = true
    elsif animal.vet_status == true || animal.training_status == true
      animal.adoptable = false
    end
  end

  def change_vet_status(animal)
    if animal.vet_status == 't'
      animal.vet_status = false
    elsif animal.vet_status == 'f'
      animal.vet_status = true
    end
    if animal.training_status == 't'
      animal.training_status = true
    elsif animal.training_status == 'f'
      animal.training_status = false
    end
    check_adoptable_status(animal)
    animal.update
  end

  def change_training_status(animal)
    if animal.training_status == 't'
      animal.training_status = false
    elsif animal.training_status == 'f'
      animal.training_status = true
    end
    if animal.vet_status == 't'
      animal.vet_status = true
    elsif animal.vet_status == 'f'
      animal.vet_status = false
    end
    check_adoptable_status(animal)
    animal.update
  end

end