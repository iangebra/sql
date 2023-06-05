use master;
drop database if exists djecjaigraonica;
go
create database djecjaigraonica;
go
use djecjaigraonica;


create table dijete (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
);

create table teta (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
);

create table skupina (
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
	teta int not null,
);

create table dijeteskupina (
	dijete int not null,
	skupina int not null,
);

alter table skupina add foreign key (teta) references teta(sifra);
alter table dijeteskupina add foreign key (dijete) references dijete(sifra);
alter table dijeteskupina add foreign key (skupina) references skupina(sifra);