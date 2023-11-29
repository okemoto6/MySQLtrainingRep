-- As this is a test project in a sandbox version of BQ, DML queries are not executable and all tables were added manualy from prepared csv files. In full version, creating and manipilating table should use queries below:

CREATE TABLE `my-beers-project.my_beers.bjcp-guidelines`(
    style_id int64,
    bjcp_category int64,
	  style_name int64,
    style_family int64,
	  style_origin int64,
    abv_min float64,
    abv_max float64,
    ibu_min float64,
    ibu_max float64,
    srm_min float64,
    srm_max float64,
    );

INSERT INTO `my-beers-project.my_beers.bjcp-guidelines`
VALUES('01A', 'Standard American Beer', 'American Light Lager', 'Pale Lager', 'United States', 2.8, 4.2, 8, 12, 2, 3),
        ('01B', 'Standard American Beer', 'American Lager', 'Pale Lager', 'United States', 4.2, 5.3, 8.0, 18.0, 2.0, 4.0),

--and so on with all styles

-- adding constraints to relevant columns:
-- primary keys
ALTER TABLE `my-beers-project.my_beers.bjcp-guidelines`
ADD PRIMARY KEY(style_id) NOT ENFORCED;

ALTER TABLE `my-beers-project.my_beers.yeast`
ADD PRIMARY KEY(id) NOT ENFORCED;

ALTER TABLE `my-beers-project.my_beers.equipment`
ADD PRIMARY KEY(id) NOT ENFORCED

-- foreign keys
ALTER TABLE `my-beers-project.my_beers.batches`
ADD CONSTRAINT style_fk FOREIGN KEY(batch_style)
REFERENCES `my-beers-project.my_beers.bjcp_guidelines`(style_id) NOT ENFORCED;

ALTER TABLE `my-beers-project.my_beers.batches`
ADD CONSTRAINT yeast_fk FOREIGN KEY(yeast)
REFERENCES `my-beers-project.my_beers.yeast`(id) NOT ENFORCED;

ALTER TABLE `my-beers-project.my_beers.batches`
ADD CONSTRAINT eqp_fk FOREIGN KEY(eqp)
REFERENCES `my-beers-project.my_beers.equipment`(id) NOT ENFORCED;

--final check of added constraints:

SELECT *
FROM my-beers-project.my_beers.INFORMATION_SCHEMA.TABLE_CONSTRAINTS;


--adding some description to the columns in the main table:
ALTER TABLE `my-beers-project.my_beers.batches`
ALTER COLUMN eqp
SET OPTIONS (
  description='Type of equipment used - brew kettle, pot or brew in a bag'
),
ALTER COLUMN srm
SET OPTIONS (
  description = 'wort color in SRM scale'
),
ALTER COLUMN ferm_size
SET OPTIONS (
  description = 'size of wort pitched; in liters'
),
ALTER COLUMN final_size
SET OPTIONS (
  description = 'size of beer bottled; in liters'
) 
