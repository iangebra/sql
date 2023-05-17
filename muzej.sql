use master;
drop database if exists muzej;
go
create database muzej;
go
use muzej;

create table kustos(
	sifra int not null primary key identity(1,1),
	ime varchar(50),
	prezime varchar(50),
	mobitel varchar(100),
	
);

create table izlozba(
	sifra int not null primary key identity(1,1),
	naslov varchar(50),
	datum date,
	trajanje int,
	sponzor varchar(50)
);

create table djelo(
	sifra int not null primary key identity(1,1),
	naslov varchar(50),
	kustos int,
	izlozba int,
	godinaIzrade varchar(50)
		
);


alter table djelo add foreign key (kustos) references kustos (sifra);
alter table djelo add foreign key (izlozba) references izlozba (sifra);
	

insert into kustos (ime,prezime,mobitel)
values ('ana','anic','09123456'),
('lana','lanic','092123356'),
('mara','maric','0983456');

insert into izlozba (naslov,datum,trajanje,sponzor)
values ('izlozba 1','2020-06-01',180,'coca cola'),
('izlozba 2','2021-08-01',50,'nike'),
('izlozba 3','2022-04-04',120,'HEP');

insert into djelo (naslov,kustos,izlozba,godinaIzrade)
values ('djelo1',1,1,1999),
('djelo2',2,1,2022),
('djelo3',3,2,2015);
