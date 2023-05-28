use master;
drop database if exists osnovnaskola;
go
create database osnovnaskola;
go
use osnovnaskola;


create table radionica (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
    uciteljica int not null,
);

create table uciteljica (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
	prezime varchar(50) not null,
);

create table dijete (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
	prezime varchar(50) not null,
);

create table dijeteradionica (
    dijete int not null,
    radionica int not null,
);

alter table radionica add foreign key (uciteljica) references uciteljica(sifra);
alter table dijeteradionica add foreign key (dijete) references dijete(sifra);
alter table dijeteradionica add foreign key (radionica) references radionica(sifra);