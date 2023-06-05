use master;
drop database if exists klubcitatelja;
go
create database klubcitatelja;
go
use klubcitatelja;


create table citatelj (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	broj_telefona varchar(50) not null
);

create table knjiga (
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
	posudba int not null
);

create table posudba (
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,	
	datumposudbe datetime not null,
	citatelj int not null
);

alter table knjiga add foreign key (posudba) references posudba(sifra);
alter table posudba add foreign key (citatelj) references citatelj(sifra);