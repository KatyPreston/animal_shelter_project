require_relative("../db/sql_runner")

class Owner

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT into owners
    (name)
    VALUES ($1)
    RETURNING *"
    values = [@name]
    owner_data = SqlRunner.run(sql, values)
    @id = owner_data[0]["id"].to_i
  end

  def update()
    sql = "UPDATE owners
    SET
    name =
    $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def adopt_animal()
    sql = "SELECT animals.*
    FROM animals
    INNER JOIN adoptions
    ON adoptions.animal_id = animals.id
    WHERE owner_id = $1"
    values = [@id]
    animal_data = SqlRunner.run(sql, values)
    return Animal.map_items(animal_data)
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owner_data = SqlRunner.run(sql)
    owners = map_items(owner_data)
    return owners
  end

  def self.map_items(owner_data)
    return owner_data.map { |owner| Owner.new(owner) }
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    owner = Owner.new(result)
    return owner
  end

end
