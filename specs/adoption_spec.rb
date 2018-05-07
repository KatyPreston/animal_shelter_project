require("minitest/autorun")
require("minitest/rg")
require_relative("../models/adoption")
require_relative("../models/animal")
require_relative("../models/owner")

class AdoptionTest < Minitest::Test

  def setup
    @animal1 = Animal.new
    @owner1 = Owner.new

    @adoption = Adoption.new("animal_id" => @animal1_id, "owner_id" =>@owner1.id)
  end

end
