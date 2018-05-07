require("minitest/autorun")
require("minitest/rg")
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

class AnimalTest < Minitest::Test

  def setup
    @animal1 = Animal.new("name" =>"Monkey", "type" => "Guinea Pig", "admission_date" => "May 2018", "adoptable" => true)
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


end
