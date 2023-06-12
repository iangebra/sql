use master;
drop database if exists kolokvij_vjezba_1;
go
create database kolokvij_vjezba_1;
go
use kolokvij_vjezba_1;

create table punac(
	sifra int not null primary key identity(1,1),
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null
);

create table cura(
sifra int not null primary key identity(1,1),
	novcica decimal(16,5) not null,
	gustoca decimal(18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar(36),
	punac int,
);

create table muskarac(
	sifra int not null primary key identity(1,1),
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal(14,5) not null,
	zena int not null,
);

create table mladic(
	sifra int not null primary key identity(1,1),
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiputa datetime,
	asocijalno bit,
	ekstroventno bit not null,
	dukserica varchar(48) not null,
	muskarac int

);

create table zena(
sifra int not null primary key identity(1,1),
	treciputa datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(39) not null,
	haljina varchar(44),
	sestra int not null
);

create table sestra(
	sifra int not null primary key identity(1,1),
	introvertno bit,
	haljina varchar(31) not null,
	maraka decimal(16,6),
	hlace varchar(46) not null,
	narukvica int not null
);

create table svekar(
	sifra int not null primary key identity(1,1),
	bojaociju varchar(40) not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal(13,8),
	eura decimal(12,7),
	majica varchar(35)
);

create table sestra_svekar(
	sifra int not null primary key identity(1,1),
	sestra int not null,
	svekar int not null
);

alter table cura add foreign key (punac) references punac(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table zena add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

insert into sestra(introvertno,haljina,maraka,hlace,narukvica)
values (0,'bijela',100,'sive',1),
(1,'plava',200,'jeans',2),
(1,'zelena',400.33,'kratke',3);


insert into svekar(bojaociju,prstena,dukserica,lipa,eura,majica)
values ('crna',1,'crna',55,19.99,'dugacka'),
('plava,',2,'zuta',21,5,'dolcevita'),
('smedja',3,'crvena',15,75.43,'kratka');

insert into zena(treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values ('2022-04-15','kratke','plava',48703210541,'plava','bijela',1),
('2023-02-11','jeans','crvena',63595313852,'crna','crvena',2),
('2022-10-17','yoga','zelena',87435842124,'smedja','zelena',3);

insert into muskarac (bojaociju,hlace,modelnaocala,maraka,zena)
values ('plava','jeans','gucci',50,1),
('smedja','kratke','ray-ban',127.56,2),
('zelena','trenirka','armani',199.99,3);

insert into sestra_svekar(sestra,svekar)
values (1,2),
(2,1),
(3,3);

update cura set gustoca = 15.77;

delete from mladic where kuna > 15.78;

select kratkamajica from zena where hlace like '%ana%'

select a.haljina, a.maraka
from sestra a left join sestra_svekar b 
on b.sestra = a.sifra;

select a.dukserica, f.asocijalno, e.hlace
from svekar a inner join sestra_svekar b 
on b.svekar=a.sifra
inner join sestra c	
on b.sestra=c.sifra
inner join zena d 
on d.sestra=c.sifra
inner join muskarac e 
on e.zena=d.sifra
inner join mladic f	
on f.muskarac=e.sifra
where d.hlace like 'a%' and c.haljina like '%ba%'
order by 2;