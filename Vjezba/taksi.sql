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
    datum datetime not null,
    cijena decimal(18,2) not null,
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