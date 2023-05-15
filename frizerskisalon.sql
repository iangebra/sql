use master;
drop database if exists frizerskisalon;
go
create database frizerskisalon;
go
use frizerskisalon;

create table djelatnica(
	sifra int not null primary key identity (1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11),
);

create table korisnik(
	sifra int not null primary key identity (1,1),
	spol varchar(50) not null,
	duzinakose int,
	);

	create table usluga(
	sifra int not null primary key identity (1,1),
	naziv varchar(50) not null,
	cijena dec not null,
	trajanje time
	);

	create table termin(
	sifra int not null primary key identity (1,1),
	datum date not null,
	korisnik int, 
	usluga int, 
	djelatnica int
	);

	alter table termin add foreign key (korisnik) references korisnik (sifra);
	alter table termin add foreign key (usluga) references usluga (sifra);
	alter table termin add foreign key (djelatnica) references djelatnica (sifra);
