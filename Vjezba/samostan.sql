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

create table nadredeni (
    sifra int primary key identity (1,1) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
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
alter table svecenik add foreign key (nadredeni) references nadredeni(sifra);


insert into nadredeni(ime,prezime)
values ('pero','peric'),
('igor','horvat'),
('mihael','markovic');

insert into svecenik(ime,prezime,nadredeni)
values ('luka','lukic',1),
('marko','mihaljevic',3),
('ivan','ivanovic',2);

insert into posao(naziv)
values ('posao 1'),
('posao 2'),
('posao 3');

insert into svecenikposao(svecenik,posao)
values (1,2),
(2,1),
(3,2);