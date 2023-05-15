use master;
drop database if exists hijerarhija;
go
create database hijerarhija;
go
use hijerarhija;

create table zaposlenik(
	sifra int not null primary key identity (1,1),
	ime varchar(50) not null,
	prezime varchar (50) not null,
	placa int not null,
	nadredeni int not null,
	);

	alter table zaposlenik add foreign key (nadredeni) references zaposlenik(sifra)

