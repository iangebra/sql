use master;
drop database if exists muzej;
go
create database muzej;
go
use muzej;

create table kustos(
	ime varchar(50),
	prezime varchar(50),
	sifrakustosa varchar(50),
	adresa varchar(50),
	mobitel varchar(100),
	mail varchar(50),
	
);

create table djelo(
	imeAutora varchar(50),
	prezimeAutora varchar(50),
	izlozba varchar(50),
	godinaIzrade varchar(50),
	
);

create table izlozba(
	naslov varchar(50),
	sifrakustosa varchar(50),
	datum date,
	vrijeme time,
	trajanje int,
	sponzor varchar(50)
);