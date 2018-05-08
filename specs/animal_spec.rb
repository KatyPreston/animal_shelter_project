require("minitest/autorun")
require("minitest/rg")
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

class AnimalTest < Minitest::Test

  def setup
    @animal1 = Animal.new("name" =>"Monkey", "type" => "Guinea Pig", "admission_date" => "May 2018", "adoptable" => "t")
    @animal2 = Animal.new("name" =>"Edgar", "type" => "Rat", "admission_date" => "April 2018", "adoptable" => "t")
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


end
