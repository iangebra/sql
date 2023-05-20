use master;
drop database if exists djecjivrtic;
go
create database djecjivrtic;
go
use djecjivrtic;

create table odgojnaskupina(
	sifra int not null primary key identity(1,1),
	naziv varchar(50),
	odgajateljica int not null,
	);

create table odgajateljica(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	strucnasprema varchar(50) not null
);

create table dijete (
    sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	odgojnaskupina int not null
);

alter table odgojnaskupina add foreign key (odgajateljica) references odgajateljica(sifra);
alter table dijete add foreign key (odgojnaskupina) references odgojnaskupina(sifra);


insert into odgajateljica(ime,prezime,strucnasprema)
values ('teta','violeta','srednja'),
       ('teta','margareta','visa'),
	   ('teta','pasteta','visoka');
	   

insert into odgojnaskupina(naziv,odgajateljica)
values ('skupina-A',2),		
       ('skupina-B',1),
	   ('skupina-C',3);
	   

insert into dijete(ime,prezime,odgojnaskupina)
values ('marko','markovic',1),
       ('ena','horvat',2),
	   ('ivan','tomic',1),
	   ('vedran','lukic',3),
	   ('maja','anic',3),
	   ('luka','kovacevic',1);