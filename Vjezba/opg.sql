use master;
drop database if exists opg;
go
create database opg;
go
use opg;

create table djelatnik (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null
);	

create table proizvod (
    sifra int not null primary key identity(1,1),
    naziv varchar(50) not null,
    cijena decimal not null,
    djelatnik int not null
);

create table sirovina (
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null
);


create table proizvodsirovina (
    proizvod int not null,
    sirovina int not null
);


alter table proizvod add foreign key (djelatnik) references djelatnik(sifra);
alter table proizvodsirovina add foreign key (proizvod) references proizvod(sifra);
alter table proizvodsirovina add foreign key (sirovina) references sirovina(sifra);