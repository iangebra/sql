use master;
drop database if exists srednjaskola;
go
create database srednjaskola;
go
use srednjaskola;


create table razred (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
);

create table ucenik (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
	prezime varchar(50) not null,
	razred int not null,
);

create table profesor (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
	prezime varchar(50) not null,
);

create table razredprofesor (
    razred int not null,
    profesor int not null,
);

alter table ucenik add foreign key (razred) references razred(sifra);
alter table razredprofesor add foreign key (razred) references razred(sifra);
alter table razredprofesor add foreign key (profesor) references profesor(sifra);