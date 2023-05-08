use master;
drop database if exists beautysalon;
go
create database beautysalon;
go
use beautysalon;

create table djelatnica(
	ime varchar(50),
	prezime varchar(50),
	sifradjelatnice varchar(50),
	adresa varchar(50)
	
);

create table korisnik(
	ime varchar(50),
	prezime varchar(50),
	spol varchar(50),
	mobitel varchar(100),
	mail varchar(50),
	sifrakorisnika varchar(50),
	adresa varchar(50),
	vrstausluge varchar,
);

create table usluga(
	vrstausluge varchar(50),
	cijena decimal, 
	sifradjelatnice varchar(50),
	trajanje int,
);

create table termin(
    	datumtermina date,
    	sifrakorisnika varchar(10),
);
