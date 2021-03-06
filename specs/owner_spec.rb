require("minitest/autorun")
require("minitest/rg")
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

class OwnerTest < Minitest::Test

  def setup
    @animal1 = Animal.new("name" =>"Monkey", "type" => "Guinea Pig", "url" => "https://www.petmd.com/sites/default/files/guide-to-guinea-pigs.jpg", "admission_date" => "May 2018", "adoptable" => true)
    @owner1 = Owner.new("name" => "Laura")

    @adoption = Adoption.new("animal_id" => @animal1_id, "owner_id" =>@owner1.id)
  end

  def test_owner_name()
    assert_equal("Laura", @owner1.name())
  end


end
