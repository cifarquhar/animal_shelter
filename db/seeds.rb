require('pry')
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/shelter')

Animal.delete_all
Owner.delete_all

shelter = Shelter.new

animal1 = Animal.new({'name' => "Ringo", 'type' => "Tortoise", 'admission_date' => '2017-02-23 15:00:00', 'adoptable' => true, 'training_status' => false, 'vet_status' => false})
animal2 = Animal.new({'name' => "Milly", 'type' => "Cat", 'admission_date' => '2016-12-10 16:00:00', 'adoptable' => false, 'training_status' => true, 'vet_status' => true})

animal1.save()
animal2.save()

owner1 = Owner.new({'name' => "Colin"})
owner2 = Owner.new({'name' => "Vicky"})

owner1.save()
owner2.save()




binding.pry
nil