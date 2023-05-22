use master;
drop database if exists samostan;
go
create database samostan;
go
use samostan;

create table svecenik (
    sifra int primary key identity (1,1) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    nadredeni int not null
);

create table posao (
    sifra int primary key identity (1,1) not null,
    naziv varchar(50) not null
);

create table svecenikposao (
    svecenik int not null,
    posao int not null
);

alter table svecenikposao add foreign key (svecenik) references svecenik(sifra);
alter table svecenikposao add foreign key (posao) references posao(sifra);
alter table svecenik add foreign key (nadredeni) references svecenik(sifra);