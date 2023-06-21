use master;
drop database if exists kolokvij_vjezba_3;
go
create database kolokvij_vjezba_3;
go
use kolokvij_vjezba_3;

create table cura (
	sifra int not null primary key identity(1,1),
	dukserica varchar (49),
	maraka decimal (13,7),
	drugiputa datetime,
	majica varchar (49),
	novcica decimal (15,8),
	ogrlica int not null
);

create table svekar (
	sifra int not null primary key identity(1,1),
	novcica decimal (16,8) not null,
	suknja varchar (44) not null,
	bojakose varchar (36),
	prstena int,
	narukvica int not null,
	cura int not null
);

create table brat (
	sifra int not null primary key identity(1,1),
	jmbag char (11),
	ogrlica int not null,
	ekstroventno bit not null
);

create table prijatelj_brat (
	sifra int not null primary key identity(1,1),
	prijatelj int not null,
	brat int not null
);

create table prijatelj (
	sifra int not null primary key identity(1,1),
	kuna decimal (16,10),
	haljina varchar (37),
	lipa decimal (13,10),
	dukserica varchar (31),
	indiferentno bit not null
);

create table ostavljena (
	sifra int not null primary key identity(1,1),
	kuna decimal (17,5),
	lipa decimal (15,6),
	majica varchar (36),
	modelnaocala varchar (31) not null,
	prijatelj int
);

create table snasa (
	sifra int not null primary key identity(1,1),
	introvertno bit,
	kuna decimal (15,6) not null,
	eura decimal (12,9) not null,
	treciputa datetime,
	ostavljena int not null
);

create table punica (
	sifra int not null primary key identity(1,1),
	asocijalno bit,
	kratkamajica varchar (44),
	kuna decimal (13,8) not null,
	vesta varchar (32) not null,
	snasa int
);

alter table svekar add foreign key (cura) references cura(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);

insert into brat (jmbag,ogrlica,ekstroventno)
values ('42156316336',1,2),
('62757527853',2,1),
('12456437437',3,3);
	
insert into prijatelj (kuna,haljina,lipa,dukserica,indiferentno)
values ('55.2','plava','23.42','zelena','1'),
('15.2','crvena','13.41','bijela','0'),
('152154.44','siva','125.12','crna','1');

insert into prijatelj_brat (prijatelj,brat)
values (1,1),
(2,2),
(3,3);

insert into ostavljena (kuna,lipa,majica,modelnaocala,prijatelj)
values ('17.32','743.21','kratka','gucci',1),
('525.74','0.55','dugacka','ray-ban',2),
('63.86','101.55','vesta','versace',3);


insert into snasa (introvertno,kuna,eura,treciputa,ostavljena)
values ('0','743.43','12.54','2022-11-21',1),
('1','854.43','312.65','2023-06-21',2),
('0','11.22','22.11','2021-05-27',3);	
	
update svekar set suknja='Osijek';
delete from punica where kratkamajica='AB';
select majica from ostavljena where lipa not in ('9','10','20','30','35');

select a.ekstroventno, f.vesta, e.kuna
from brat a
inner join prijatelj_brat b 
on a.sifra=b.brat
inner join prijatelj c 
on b.prijatelj=c.sifra
inner join ostavljena d 
on d.prijatelj=c.sifra
inner join snasa e 
on d.sifra=e.ostavljena
inner join punica f 
on e.sifra=f.snasa
where d.lipa!='91' and c.haljina like '%ba%'
order by e.kuna desc;

select a.haljina,a.lipa from prijatelj a
left join prijatelj_brat b on a.sifra=b.sifra;