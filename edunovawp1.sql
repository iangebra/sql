-- ovo je komentar i ne�e se izvesti
use master;
drop database if exists edunovawp1;
go
create database edunovawp1;
go
use edunovawp1;

create table smjer(
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
	trajanje int not null,
	cijena decimal(18,2) null, --ako je null ne treba se pisati null
	upisnina decimal(18,2),
	verificiran bit
);

create table polaznik(
	sifra int not null primary key identity(1,1),
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11),
	email varchar(100)
);

create table grupa(
	sifra int not null primary key identity(1,1),
	naziv varchar(50) not null,
	smjer int not null, 
	datumpocetka datetime
);

create table clan(
	grupa int not null,
	polaznik int not null
);


-- veze izme�u tablica

alter table grupa add foreign key (smjer) references smjer(sifra);
alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);


-- najlo�iji na�in
-- 1
insert into smjer
values ('Web programiranje ��',250,1473.82,73,1);

-- malo bolji na�in
-- 2
insert into smjer (naziv,trajanje)
values ('Java programiranje',130);

-- dobra praksa
-- 3
insert into smjer (naziv,trajanje,cijena,upisnina,verificiran)
values ('Serviser',150,null,null,0);


-- 1
insert into grupa (naziv,smjer,datumpocetka)
values ('WP1',1,'2023-04-26 17:00:00');
-- 2
insert into grupa (naziv,smjer,datumpocetka)
values ('JP28',2,'2023-04-26 19:00:00');


-- 1 do 25
insert into polaznik(ime,prezime,oib,email)
values 
('Luka','Bu�i�',null,'busic.luka1@gmail.com'),
('Domagoj','Markovi�',null,'markovicdomagoj1995@gmail.com'),
('Andrija','Kruhoberec',null,'akruhoberec1@outlook.com'),
('Vedran','D�anko',null,'vedran.dzanko@gmail.com'),
('Antonio','Maji�', null, 'antonio.majich@gmail.com'),
('Lana','Jeleni�',null,'lana.jelenic@gmail.com'),
('Jasenka','Augustinovi�',null,'jaugustinovic85@gmail.com'),
('Domagoj','Ljubi�i�',null,'dljubicic2@gmail.com'),
('Leo','Lovenjak',null,'leo.lovenjak107@gmail.com'),
('Leon','Bi�ak',null,'lbicak96@gmail.com'),
('Katarina','Pavli�evi�',null,'katarina.pavlicevic5@gmail.com'),
('Darko','Ku�an',null,'dkucan61@gmail.com'),
('Patrik','Gomer�i�',null,'patrik.gomercic3@gmail.com'),
('Antonio','�ubari�',null,'antonio.subaric98@gmail.com'),
('Sr�an','Filipovi�',null,'srdjanfilipovic991@gmail.com'),
('Jakob','Brki�',null,'jakobbrkic97@gmail.com'),
('Alen','Oroz',null,'alen.oroz1@gmail.com'),
('Ivor','�eli�',null,'ivorcelic@gmail.com'),
('Anja','Andonovski',null,'andonovski.anja@gmail.com'),
('Bruno','Bu�i�',null,'brunobusic20@gmail.com'),
('Karlo','Peri�',null,'karlocar25@gmail.com'),
('Kristijan','Beri�a',null,'k_berisa@hotmail.com'),
('Valentin','Mijatovi�',null,'mijatovic.valentin123@gmail.com'),
('Ivan','Angebrandt',null,'ivan.angebrandt@gmail.com'),
('Luka','Mr�a',null,'luka.mrda@yahoo.com');





insert into clan(grupa,polaznik)
values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),
(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),
(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),
(1,21),(1,22),(1,23),(1,24),(1,25);

insert into smjer (naziv,trajanje,cijena,upisnina,verificiran)
values ('PHP programiranje',110,1000.95,50,1);
insert into grupa (naziv,smjer,datumpocetka)
values('PP17',4,'2023-05-01 19:00:00');
insert into grupa (naziv,smjer,datumpocetka)
values('PP18',4,'2023-05-05 21:00:00');
insert into polaznik(ime,prezime,oib,email)
values
('pero','peric',null,'peroperic@gmail.com'),
('ivan','ivanovic',null,'ivanivanovic@gmail.com'),
('marko','markovic',null,'markomarkovic@outlook.com');

insert into clan (grupa, polaznik)
values (4,26),(4,27),(4,28);



-- vje�banje:
-- 1. Unijeti smjer PHP programiranje
-- 2. Na PHP pregoramiranje definirati dvije grupe (PP17 i PP18)
-- 3. Na PP18 postaviti 3 polaznika (koje ste prethodno unijeli)


-- Doma�a zada�a:
-- U sve baze koje ste kreirali na osnovu zadatka ERA osnovno unijeti u svaku tablicu po 3 - 5 redova