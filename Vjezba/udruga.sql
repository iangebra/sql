use master;
drop database if exists udruga;
go
create database udruga;
go
use udruga;


create table skrbnik (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null
	
);

create table zivotinja(
	sifra int not null primary key identity(1,1),
	imezivotinje varchar(50) not null,
	skrbnik int not null
	
);

create table prostor(
	sifra int not null primary key identity(1,1),
	naziv varchar(50),
	zivotinja int not null
);

alter table zivotinja add foreign key(skrbnik) references skrbnik(sifra);
alter table prostor add foreign key(zivotinja) references zivotinja(sifra);


insert into skrbnik(ime,prezime)
values ('ivan','horvat'),
('mirko','kovac'),
('ana','banana');

insert into zivotinja(imezivotinje,skrbnik)
values ('rex',1),
('tomi',2),
('ara',2),
('miki',3);


insert into prostor(naziv,zivotinja)
values ('prostorija1',1),
('prostorija2',2),
('prostorija3',3),
('prostorija4',4);