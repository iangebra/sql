use master;
drop database if exists taksisluzba;
go
create database taksisluzba;
go
use taksisluzba;

create table vozilo (
    sifra int not null primary key identity(1,1),
    vrsta varchar(20) not null,
);

create table vozac (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
    prezime varchar(50) not null,
    vozilo int not null,
);

create table voznja (
	sifra int not null primary key identity(1,1),
	cijena decimal not null,
	datum datetime not null,
	vozac int not null,
);

create table putnik (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
    prezime varchar(50) not null,
    broj_telefona varchar(50) not null
);

create table voznjaputnik (
    voznja int not null,
    putnik int not null
);

alter table vozac add foreign key (vozilo) references vozilo(sifra);
alter table voznja add foreign key (vozac) references vozac(sifra);
alter table voznjaputnik add foreign key (voznja) references voznja(sifra);
alter table voznjaputnik add foreign key (putnik) references putnik(sifra);

insert into vozilo (vrsta)
values ('mercedes'),
('skoda'),
('fiat');

insert into vozac (ime,prezime,vozilo)
values ('ivan','anic','3'),
('mirko','lanic','1'),
('pero','maric','2');

insert into voznja (cijena,datum,vozac)
values (30.16,'2023-05-21',2),
(25,'2023-05-20',1),
(22.5,'2023-05-15',3);

insert into putnik (ime,prezime,broj_telefona)
values ('ivana','mosic','09912345'),
('vedran','horvat','09812134'),
('mihael','petrovic','09135425');

insert into voznjaputnik (voznja, putnik)
values (2,3),
(1,2),
(3,1);