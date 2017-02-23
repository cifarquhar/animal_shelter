require('pry')
require_relative('../models/animal')
require_relative('../models/owner')

animal1 = Animal.new({'name' => "Ringo",'admission_date' => '2017-02-23 15:00:00', 'adoptable' => true, 'training_status' => false, 'vet_status' => false})
animal2 = Animal.new({'name' => "Fudge",'admission_date' => '2016-12-10 16:00:00', 'adoptable' => false, 'training_status' => true, 'vet_status' => true})

animal1.save()
animal2.save()