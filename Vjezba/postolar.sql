use master;
drop database if exists postolar;
go
create database postolar;
go
use postolar;

create table postolar(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	);

create table korisnik(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	mobitel varchar(20) not null,
);

create table segrt(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	popravak int not null
);

create table popravak(
	sifra int not null primary key identity(1,1),
	datum datetime not null,
	segrtsudjeluje bit not null,
	postolar int not null
);

create table obuca(
	sifra int not null primary key identity(1,1),
	vrsta varchar(50) not null,
	brpopravaka int not null,
	korisnik int not null
);

create table obucapopravak (
   obuca int not null,
   popravak int not null
);


alter table popravak add foreign key (postolar) references postolar(sifra);
alter table segrt add foreign key (popravak) references popravak(sifra);
alter table obuca add foreign key (korisnik) references korisnik(sifra);
alter table obucapopravak add foreign key (obuca) references obuca(sifra);
alter table obucapopravak add foreign key (popravak) references popravak(sifra);