use master;
drop database if exists kulturnoumjetnickodrustvo;
go
create database kulturnoumjetnickodrustvo;
go
use kulturnoumjetnickodrustvo;


create table clan (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	broj_telefona varchar(50) not null
);

create table mjesto (
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
);

create table nastup (
	sifra int not null primary key identity(1,1),
	datum datetime not null,
	mjesto int not null,
);

create table clannastup (
	clan int not null,
	nastup int not null,
);

alter table nastup add foreign key (mjesto) references mjesto(sifra);
alter table clannastup add foreign key (clan) references clan(sifra);
alter table clannastup add foreign key (nastup) references nastup(sifra);