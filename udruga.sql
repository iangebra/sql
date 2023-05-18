use master;
drop database if exists udruga;
go
create database udruga;
go
use udruga;


create table skrbnik (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	
);

create table zivotinja(
	sifra int not null primary key identity(1,1),
	imezivotinje varchar(50) not null,
	skrbnik int not null,
	prostor int not null,
	
);

create table prostor(
	sifra int not null primary key identity(1,1),
	naziv varchar(50)
);

alter table zivotinja add foreign key(skrbnik) references skrbnik(sifra);
alter table zivotinja add foreign key(prostor) references prostor(sifra);