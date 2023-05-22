use master;
drop database if exists ordinacija;
go
create database ordinacija;
go
use ordinacija;


create table doktor (
    sifra int primary key identity (1,1) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table pacijent (
    sifra int primary key identity (1,1) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
	oib char(11) not null
);

create table medsestra (
    sifra int primary key identity (1,1) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table lijecenje (
    sifra int primary key identity (1,1) not null,
    doktor int not null,
    pacijent int  not null,
    medsestra int not null
);

alter table lijecenje add foreign key (doktor) references doktor(sifra);
alter table lijecenje add foreign key (pacijent) references pacijent(sifra);
alter table lijecenje add foreign key (medsestra) references medsestra(sifra);


insert into doktor(ime,prezime)
values ('vedran','horvat'),
('mirko','jukic'),
('pero','peric');

insert into pacijent(ime,prezime,oib)
values ('mara','maric',13346678101),
('stjepan','mihaljevic',82345668901),
('luka','crnkovic',42352678201);

insert into medsestra(ime,prezime)
values ('ivona','ivanovic'),
('antonija','vuk'),
('andrea','molnar');

insert into lijecenje(doktor,pacijent,medsestra)
values (2,1,3),
(3,2,1),
(1,3,2);