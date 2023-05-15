use master;
drop database if exists salon;
go
create database salon;
go
use salon;

create table djelatnica(
	sifra int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	oib char (11),
	);

	