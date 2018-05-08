require("minitest/autorun")
require("minitest/rg")
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

class AnimalTest < Minitest::Test

  def setup
    @animal1 = Animal.new("name" =>"Monkey", "type" => "Guinea Pig", "url" => "https://www.petmd.com/sites/default/files/guide-to-guinea-pigs.jpg", "admission_date" => "May 2018", "adoptable" => "t")
    @animal2 = Animal.new("name" =>"Edgar", "type" => "Rat", "url" => "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fjudystone%2Ffiles%2F2018%2F02%2Fhantavirus-mouse-cdc.jpg", "admission_date" => "April 2018", "adoptable" => "t")
    @animal3 = Animal.new("name" =>"Monty", "type" => "Chameleon", "url" => "https://i.ytimg.com/vi/-DXpfHNn7V4/maxresdefault.jpg", "admission_date" => "March 2018", "adoptable" => "f")

    @owner1 = Owner.new("name" => "Laura")

    @adoption = Adoption.new("animal_id" => @animal1_id, "owner_id" =>@owner1.id)
  end

  def test_animal_name
    assert_equal("Monkey", @animal1.name)
  end

  def test_animal_type
    assert_equal("Guinea Pig", @animal1.type)
  end

  def test_admission_date
    assert_equal("May 2018", @animal1.admission_date)
  end

  def test_adoptable
    assert_equal(true, @animal1.adoptable)
  end

  def test_adoptable_animals
    animals = [@animal1, @animal2]
    assert_equal([@animal1, @animal2], Animal.adoptable_animals(animals))
  end

  def test_unadoptable_animals
    animals = [@animal1, @animal2, @animal3]
    assert_equal([@animal3], Animal.unadoptable(animals))
  end


end
