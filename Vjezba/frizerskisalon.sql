use master;
drop database if exists frizerskisalon;
go
create database frizerskisalon;
go
use frizerskisalon;

create table djelatnica(
	sifra int not null primary key identity (1,1),
	ime varchar(50) not null,
	prezime varchar(51) not null,
	oib char(11),
);

create table korisnik(
	sifra int not null primary key identity (1,1),
	ime varchar(50) not null,
	prezime varchar(51) not null,
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


	insert into djelatnica (ime,prezime,oib)
values ('ana','anic','123456'),
('lana','lanic','123356'),
('mara','maric','193456');

insert into korisnik (ime,prezime,spol,duzinakose)
values ('ivan','anic','musko',5),
('ivana','ivanic','zensko',15),
('pero','peric','musko',4);

insert into usluga (naziv,cijena,trajanje)
values ('sisanje',10,'00:20'),
('pranje',5,'00:15'),
('farbanje',15,'00:50');

insert into termin (datum,korisnik,usluga,djelatnica)
values ('2023-05-26 11:00:00',2,3,1),
('2023-05-27 13:00:00',1,2,3),
('2023-05-22 10:00:00',3,1,2);