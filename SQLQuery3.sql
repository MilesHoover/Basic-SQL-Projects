use db_zoo;

/* All information from the habitat table */
select * from tbl_habitat;

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
SELECT tbl_species.species_name as "Species Name:", tbl_nutrition.nutrition_type as "Nutrition Type:"
FROM tbl_nutrition
INNER JOIN tbl_species ON tbl_species.species_nutrition=tbl_nutrition.nutrition_id;

/* From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table */
SELECT tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact
FROM tbl_species join tbl_care ON tbl_species.species_care = tbl_care.care_id
join tbl_specialist ON tbl_care.care_specialist = tbl_specialist.specialist_id
WHERE species_name = 'penguin'

-------------------------------------------------------------

/* Creating my own database */

CREATE DATABASE MyDatabase;
USE MyDataBase;

DROP TABLE IF EXISTS Animals;

DROP TABLE IF EXISTS Species;

-------------------------------------------------------------

CREATE TABLE Species(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Species varchar(50),
	FriendlyName varchar(50),
);

-------------------------------------------------------------

CREATE TABLE Animals(
	ID int IDENTITY(100,1),
	SpeciesID int FOREIGN KEY REFERENCES Species(ID),
	AnimalName varchar(50) NOT NULL
);

-------------------------------------------------------------

INSERT INTO Species (Species, FriendlyName)
VALUES 
	('Felis Catus', 'Cat'), 
	('Canis Lupus Familiaris', 'Dog');

-------------------------------------------------------------

INSERT INTO Animals (AnimalName, SpeciesID)
Values 
	('Benjamin', 1), 
	('Rodger', 1), 
	('Boots', 2), 
	('Hershey', 2);

-------------------------------------------------------------

select * from Species
select * from Animals