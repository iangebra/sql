use master;
drop database if exists odvjetnik;
go
create database odvjetnik;
go
use odvjetnik;


create table odvjetnik (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null
	
);

create table klijent (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null
	
);

create table suradnik (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null
	
);

create table obrana (
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
	datum datetime not null,
	odvjetnik int not null,
	klijent int not null	
);

create table suradnikobrana (
	suradnik int not null,
	obrana int not null
);

alter table obrana add foreign key (odvjetnik) references odvjetnik (sifra);
alter table obrana add foreign key (klijent) references klijent (sifra);
alter table suradnikobrana add foreign key (suradnik) references suradnik (sifra);
alter table suradnikobrana add foreign key (obrana) references obrana (sifra);