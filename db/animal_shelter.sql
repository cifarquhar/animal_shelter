DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255) not null
);

CREATE TABLE animals(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255) not null,
type VARCHAR(255) not null,
admission_date TIMESTAMP,
adoptable BOOLEAN,
owner_id INT4 REFERENCES owners(id),
training_status BOOLEAN,
vet_status BOOLEAN
);
