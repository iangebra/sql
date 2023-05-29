use master;
drop database if exists trgovackicentar;
go
create database trgovackicentar;
go
use trgovackicentar;


create table trgovina (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null
);

create table osoba (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11) not null
);

create table sef (
    sifra int not null primary key identity(1,1),
    osoba int not null,
	trgovina int not null
);

create table osobatrgovina (
    osoba int not null,
	trgovina int not null
);

alter table sef add foreign key (osoba) references osoba(sifra);
alter table sef add foreign key (trgovina) references trgovina(sifra);
alter table osobatrgovina add foreign key (osoba) references osoba(sifra);
alter table osobatrgovina add foreign key (trgovina) references trgovina(sifra);