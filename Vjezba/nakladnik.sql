use master;
drop database if exists nakladnik;
go
create database nakladnik;
go
use nakladnik;

create table mjesto (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
);

create table nakladnik (
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	mjesto int not null	
);

create table djelo (
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
);

create table nakladnikdjelo (
	nakladnik int not null,	
	djelo int not null	
);

alter table nakladnik add foreign key (mjesto) references mjesto (sifra);
alter table nakladnikdjelo add foreign key (nakladnik) references nakladnik (sifra);
alter table nakladnikdjelo add foreign key (djelo) references djelo (sifra);