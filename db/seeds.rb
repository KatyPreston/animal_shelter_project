require("pry")
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()

animal1 = Animal.new("name" => "Wolf", "type" => "Dog", "admission_date" => "September 2011", "adoptable" => "t")

animal2 = Animal.new("name" => "Bear", "type" => "Dog", "admission_date" => "June 2016", "adoptable" => "t")

animal3 = Animal.new("name" => "Django", "type" => "Hamster", "admission_date" => "December 2017", "adoptable" => "t")

animal4 = Animal.new("name" => "Marky Mark", "type" => "Chinchilla", "admission_date" => "May 2018", "adoptable" => "f")

animal5 = Animal.new("name" => "Beyonce", "type" => "Giant Rabbit", "admission_date" => "April 2018", "adoptable" => "t")

animal6 = Animal.new("name" => "Pinky", "type" => "Cat", "admission_date" => "February 2018", "adoptable" => "t")

animal1.save()
animal2.save()
animal3.save()
animal4.save()
animal5.save()
animal6.save()


owner1 = Owner.new("name" => "Frank")
owner2 = Owner.new("name" => "Steve")
owner3 = Owner.new("name" => "Katy")
owner4 = Owner.new("name" => "Anita")
owner5 = Owner.new("name" => "Bob")

owner1.save()
owner2.save()
owner3.save()
owner4.save()
owner5.save()

adoption1 = Adoption.new("animal_id" => animal1.id, "owner_id" => owner1.id)
adoption2 = Adoption.new("animal_id" => animal2.id, "owner_id" => owner2.id)
adoption3 = Adoption.new("animal_id" => animal3.id, "owner_id" => owner3.id)

adoption1.save()
adoption2.save()
adoption3.save()


binding.pry
nil
