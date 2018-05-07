require_relative("../db/sql_runner")

class Adoption

  attr_reader(:id, :animal_id, :owner_id)

  def initialize(options)
    @id = options["id"].to_i
    @animal_id = options["animal_id"].to_i
    @owner_id = options["owner_id"].to_i
  end

  def save()
    sql = "INSERT into adoptions
    (animal_id, owner_id)
    VALUES ($1, $2)
    RETURNING *"
    values = [@animal_id, @owner_id]
    adoption_data = SqlRunner.run(sql, values)
    @id = adoption_data[0]["id"].to_i
  end

  def animal()
    sql = "SELECT *
    FROM animals
    WHERE id = $1"
    values = [@animal_id]
    animal = SqlRunner.run(sql, values).first
    return Animal.new(animal)
  end

  def owner()
    sql = "SELECT *
    FROM owners
    WHERE id = $1"
    values = [@owner_id]
    owner = SqlRunner.run(sql, values).first
    return Owner.new(owner)
  end

  def delete()
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    adoption_data = SqlRunner.run(sql)
    adoptions = map_items(adoption_data)
    return adoptions
  end

  def self.map_items(adoption_data)
    return adoption_data.map { |adoption| Adoption.new(adoption) }
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    adoption = Adoption.new(result)
    return adoption
  end

end
