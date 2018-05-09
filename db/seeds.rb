require("pry")
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()

animal1 = Animal.new("name" => "Wolf", "type" => "Dog", "url" => "https://www.agila.de/images/magazin/full/tschechoslowakischer-wolfshund-full-818x522.jpg", "admission_date" => "September 2011", "adoptable" => "t", "adopted" => "t")

animal2 = Animal.new("name" => "Bear", "type" => "Dog", "url" => "https://i.pinimg.com/originals/69/6a/4a/696a4ae96cc36f80c91832d223fe5492.jpg" , "admission_date" => "June 2016", "adoptable" => "t", "adopted" => "t")

animal3 = Animal.new("name" => "Django", "type" => "Hamster", "url" => "http://absfreepic.com/absolutely_free_photos/small_photos/cute-hamster-with-yellow-hair-2516x1667_93382.jpg", "admission_date" => "December 2017", "adoptable" => "t", "adopted" => "t")

animal4 = Animal.new("name" => "Marky Mark", "type" => "Chinchilla", "url" =>  "https://static.boredpanda.com/blog/wp-content/uploads/2017/02/perfectly-round-chinchilla-camerons-chinchillas-15-58ad5374a8afb__700.jpg", "admission_date" => "May 2018", "adoptable" => "f", "adopted" => "f")

animal5 = Animal.new("name" => "Beyonce", "type" => "Giant Rabbit", "url" => "http://flemish-giant.com/wp-content/uploads/2015/10/Flemish-Giant-Rabbit-Light-Grey.jpg", "admission_date" => "April 2018", "adoptable" => "t", "adopted" => "f")

animal6 = Animal.new("name" => "Pinky", "type" => "Cat", "url" => "https://www.pets4homes.co.uk/images/breeds/23/large/3514efe61d990b82bbc37bed00eea52a.jpg", "admission_date" => "February 2018", "adoptable" => "t", "adopted" => "f")

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
