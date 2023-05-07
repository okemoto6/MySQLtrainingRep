insert into batches (yeast, BJCP_style, Brew_date)
values
	(18, '21A', '2021-01-01'),
	(41, '18B', '2021-01-06'); -- remaining data imported from csv file (DBeaver) 

insert into batches_details (BrewDate, BatchStyle, BatchName, GristSum_KG, equipment, Color_EBC, HopsSum_KG, Yeast, OG_Brix, FG_Brix, FermentationStart, FermentationEnd, FermentationSize, FinalSize, ABV_perc, Bitterness_IBU)
values
	('2021-01-01', '21A', 'New Years IPA', 6.5, 3, 79, 0.15, 18, 15.00, 3.00, '2021-01-02', '2021-01-15', 22.5, 19.5, 6, 63),
	('2021-01-06', '18B', 'APA#666', 4.5, 3, 40, 0.12, 41, 13.00, 2.4, '2021-01-07', '2021-01-17', 23.0, 22.0, 5.5, 73); -- remaining data imported from csv file (DBeaver)

insert into bjcp_guideline (style_id, bjcp_category, style_name, style_origin)
values
	('01A', 'Standard American Beer', 'American Light Lager', 'United States'),
	('01B',	'Standard American Beer', 'American Lager', 'United States'); -- remaining data imported from csv file (DBeaver) 

	
insert into equipment (eq_type, note)
values
	('BIAB', NULL),
	('pot', 'simple enamel pot, 30 l'),
	('kettle', 'Brewster Beacon 40 l');
	
insert into yeast (YeastType, Laboratory, YeastName, FermTempMin_C, FermTempMax_C, AlcTolerance, AttMin, AttMax, Flocculation)
values
	('Ale', 'Lallemand Brewing', 'Lalbrew Abbaye' , 17.0, 25.0, 14, 77, 83, 'medium'),
	('Ale', 'Lallemand Brewing', 'Lalbrew BRY-97', 15.0, 22.0, 13, 78, 84, 'high'); -- remaining data imported from csv file (DBeaver) 
