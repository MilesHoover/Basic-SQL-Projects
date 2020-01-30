use db_zoo;

/* All information from the habitat table */
select * from tbl_nutrition;

/* Retrieve all names from the species_name column that have a species_order value of 3 */
select species_name, species_order
from tbl_species
where species_order = 3;

/* Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less */
select nutrition_type
from tbl_nutrition
where nutrition_cost <= 600.00;

/* Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table */
select species_name, nutrition_id
from tbl_species, tbl_nutrition
where nutrition_id between 2202 and 2206;

/* Retrieve all names within the species_name column using the alias "Species Name:" from the species table and 
their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table */
select species_name as 'Species Name:', nutrition_type as 'Nutrition Type:'
from tbl_species, tbl_nutrition;

/* From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table */
select specialist_fname, specialist_lname
from tbl_specialist
where specialist_id = 1;

/* Creating my own database */
CREATE DATABASE MyDatabase;
USE MyDataBase;

DROP TABLE IF EXISTS Animals;

DROP TABLE IF EXISTS Species;

CREATE TABLE Species(
	ID INT PRIMARY KEY IDENTITY,
	Species VARCHAR(50) NOT NULL UNIQUE,
	FriendlyName VARCHAR(50) NOT NULL
);

INSERT INTO Species (Species, FriendlyName)
VALUES ('Felis Catus', 'Cat'), ('Canis Lupus Familiaris', 'Dog');

CREATE TABLE Animals(
	ID INT PRIMARY KEY IDENTITY,
	AnimalName VARCHAR(50) NOT NULL,
	SpeciesID INT NOT NULL REFERENCES Species(ID),
);

INSERT INTO Animals
Values ('Benjamin', 1), ('Rodger', 1), ('Boots', 2), ('Hershey', 2);



select * from Species;
select * from Animals;

SELECT FriendlyName, AnimalName
FROM Species, Animals;