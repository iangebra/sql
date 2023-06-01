use master;
drop database if exists vodoinstalater;
go
create database vodoinstalater;
go
use vodoinstalater;

create table vodoinstalater(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	);


create table segrt(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	popravak int not null
);

create table popravak(
	sifra int not null primary key identity(1,1),
	datum datetime not null,
	segrtsudjeluje bit not null,
	vodoinstalater int not null
);

create table kvar(
	sifra int not null primary key identity(1,1),
	vrsta varchar(50) not null,
	brpopravaka int not null,
);

create table kvarpopravak (
   kvar int not null,
   popravak int not null
);


alter table segrt add foreign key (popravak) references popravak(sifra);
alter table popravak add foreign key (vodoinstalater) references vodoinstalater(sifra);
alter table kvarpopravak add foreign key (kvar) references kvar(sifra);
alter table kvarpopravak add foreign key (popravak) references popravak(sifra);