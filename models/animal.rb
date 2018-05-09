require_relative("../db/sql_runner")

class Animal

  attr_reader(:id)
  attr_accessor(:name, :type, :url, :admission_date, :adoptable, :adopted)

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @type = options["type"]
    @url = options["url"]
    @admission_date = options["admission_date"]
    @adoptable = options["adoptable"] == "t"
    @adopted = options["adopted"] == "t"
  end

  def save()
    sql = "INSERT into animals
    (name, type, url, admission_date, adoptable, adopted)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *"
    values = [@name, @type, @url, @admission_date, @adoptable, @adopted]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data[0]["id"].to_i
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      type,
      url,
      admission_date,
      adoptable,
      adopted
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @type, @url, @admission_date, @adoptable, @adopted, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def get_adopted()
    @adopted = true
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal) }
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    animal = Animal.new(result)
    return animal
  end

  def self.ready_for_adoption
    sql = "SELECT * FROM animals WHERE adoptable = 't' AND adopted = 'f'"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

  def self.unadoptable
    sql = "SELECT * FROM animals WHERE adoptable = 'f'"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

end
