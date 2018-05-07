DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE owners (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL4 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  admission_date VARCHAR(255),
  adoptable BOOLEAN
);

CREATE TABLE adoptions (
  id SERIAL4 PRIMARY KEY,
  animal_id INT4 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT4 REFERENCES owners(id) ON DELETE CASCADE
);
