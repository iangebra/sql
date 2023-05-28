use master;
drop database if exists urar;
go
create database urar;
go
use urar;

create table urar(
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
	urar int not null
);

create table sat(
	sifra int not null primary key identity(1,1),
	vrsta varchar(50) not null,
	brpopravaka int not null,
	korisnik int not null
);

create table satpopravak (
   sat int not null,
   popravak int not null
);


alter table popravak add foreign key (urar) references urar(sifra);
alter table segrt add foreign key (popravak) references popravak(sifra);
alter table sat add foreign key (korisnik) references korisnik(sifra);
alter table satpopravak add foreign key (sat) references sat(sifra);
alter table satpopravak add foreign key (popravak) references popravak(sifra);