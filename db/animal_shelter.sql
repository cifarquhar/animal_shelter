DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE animals(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255) not null,
admission_date DATE,
adoptable BOOLEAN,
owner VARCHAR(255),
training_status BOOLEAN,
vet_status BOOLEAN
);

CREATE TABLE owners(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255) not null,
adopted_pets VARCHAR(255) []
);