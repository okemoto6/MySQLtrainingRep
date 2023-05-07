create database my_beers_db;


create table batches_details (
	BatchID INT auto_increment primary key,
	BrewDate date not null,
	BatchStyle varchar(3) not null,
	BatchName varchar(100) not null,
	GristSum_KG decimal(3,1) not null,
	Equipment int not null,
	Color_EBC decimal(4,1) not null,
	HopsSum_KG decimal(3,2) not null,
	Yeast int not null,
	OG_Brix decimal(3,1) not null,
	FG_Brix decimal(3,1) not null,
	FermentationStart date not null,
	FermentationEnd date not null,
	FermentationSize decimal(3,1),
	FinalSize decimal(3,1),
	ABV_perc decimal(3,1) not null,
	Bitterness_IBU int not null,
	notes varchar(300)
	);
	
create table BJCP_Guideline ( 
	style_id varchar(4) primary key,
	bjcp_category varchar(60),
	style_name varchar(80),
	style_origin varchar(50)
	);
	
create table equipment (
	ID int auto_increment primary key,
	eq_type varchar(50) not null,
	note varchar(200)
	);

create table yeast (
	ID int auto_increment primary key,
	YeastType varchar(6),
	Laboratory varchar(100),
	YeastName varchar(100),
	FermTempMin_C decimal(3,1),
	FermTempMax_C decimal(3,1),
	AlcTolerance int,
	AttMin int,
	AttMax int,
	Flocculation varchar(6) -- as low/medium/high
	);
