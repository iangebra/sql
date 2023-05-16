use master;
drop database if exists beautysalon;
go
create database beautysalon;
go
use beautysalon;

create table djelatnica(
	sifra int not null primary key identity (1,1),
	ime varchar(50),
	prezime varchar(50),
	adresa varchar(50)
	
);

create table korisnik(
	sifra int not null primary key identity (1,1),
	ime varchar(51),
	prezime varchar(50),
	spol varchar(50),
	mobitel varchar(100),
	mail varchar(50),
	
	);

create table usluga(
	sifra int not null primary key identity (1,1),
	naziv varchar(50) not null,
	cijena decimal, 
		trajanje int,
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

	insert into djelatnica (ime,prezime,adresa)
values ('ivana','peric','neka ulica 12'),
('maja','suput','druga ulica 2'),
('zdenka','burekcic','treca ulica 23');

insert into korisnik (ime,prezime,spol,mobitel,mail)
values ('vedrana','horvat','zensko','09912314','vedranahorvat@mail.com'),
('john','doe','musko','09215344','johndoe@mail.com'),
('martina','markic','zensko','09213134','martinamarkic@yahoo.com');

insert into usluga (naziv,cijena,trajanje)
values ('manikura',15.5,25),
('tretman lica',25,50),
('depilacija',16,20);

insert into termin (datum,korisnik,usluga,djelatnica)
values ('2023-05-22 15:00:00',1,2,3),
('2023-05-28 12:30:00',2,1,3),
('2023-05-26 18:45:00',3,2,1);