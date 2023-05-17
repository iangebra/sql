use master;
drop database if exists zoo;
go
create database zoo;
go
use zoo;

create table zivotinja(
	sifra int not null primary key identity(1,1),
	vrsta varchar(50) not null,
	ime varchar(50) not null,
	djelatnik int not null, 
	prostorija int not null,
	datum int
	);

	create table djelatnik(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	iban varchar(50) not null,
	);

	create table prostorija(
	sifra int not null primary key identity(1,1),
	dimenzije varchar(30) not null,
	maksbroj int not null,
	mjesto varchar(30) not null,
	);

	create table datum(
	sifra int not null primary key identity(1,1),
	drodenja datetime not null,
	ddolaska datetime not null,
	dsmrti datetime not null,
	);

	alter table zivotinja add foreign key (djelatnik) references djelatnik(sifra);
	alter table zivotinja add foreign key (prostorija) references prostorija(sifra);
	alter table zivotinja add foreign key (datum) references datum(sifra);

	

insert into djelatnik (ime,prezime,iban)
values
('ivan','horvat','12134134'),
('pero','peric','4242442'),
('marko','markovic','4235235');

insert into prostorija (dimenzije,maksbroj,mjesto)
values
('30x20x30',2,'mjesto1'),
('10x20x30',1,'mjesto2'),
('60x20x50',4,'mjesto3');

insert into datum (drodenja,ddolaska,dsmrti)
values
(2020-02-04,2021-02-05,2024-04-01),
(2021-04-27,2022-12-15,2026-07-07),
(2022-02-16,2023-11-21,2027-08-12);

insert into zivotinja (vrsta,ime,djelatnik,prostorija,datum)
values 
('lav','leo',1,1,1),
('zebra','vedrana',2,2,2),
('papiga','zoja',3,3,3);


select*from prostorija

update prostorija set
maksbroj=2
where sifra=2

update zivotinja set
ime='leon'
where sifra=1

update djelatnik set
prezime='markic'
where sifra=3

delete from zivotinja where sifra=2;
delete from djelatnik where sifra=2;
delete from prostorija where sifra=2;