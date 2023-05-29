use master;
drop database if exists restoran;
go
create database restoran;
go
use restoran;



create table kategorija (
    sifra int not null primary key identity(1,1),
    naziv varchar(50) not null
);

create table hrana (
    sifra int not null primary key identity(1,1),
    naziv varchar(50) not null,
    cijena decimal not null,
    kategorija int not null
);

create table pice (
    sifra int not null primary key identity(1,1),
    naziv varchar(50) not null,
	cijena decimal not null,
    vrsta varchar(50) not null
    
);

create table hranapice (
    hrana int not null,
    pice int not null
);

alter table hrana add foreign key (kategorija) references kategorija(sifra);
alter table hranapice add foreign key (hrana) references hrana(sifra);
alter table hranapice add foreign key (pice) references pice(sifra);