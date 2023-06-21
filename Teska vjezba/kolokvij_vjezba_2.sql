use master;
drop database if exists kolokvij_vjezba_2;
go
create database kolokvij_vjezba_2;
go
use kolokvij_vjezba_2;

create table brat (
	sifra int not null primary key identity(1,1),
	suknja varchar (47),
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null
);

create table neprijatelj (
	sifra int not null primary key identity(1,1),
	majica varchar (32),
	haljina varchar (43) not null,
	lipa decimal (16,8),
	modelnaocala varchar (49) not null,
	kuna decimal (12,6) not null,
	jmbag char (11),
	cura int
);

create table cura (
	sifra int not null primary key identity(1,1),
	haljina varchar (33) not null,
	drugiputa datetime not null,
	suknja varchar (38),
	narukvica int,
	introvertno bit,
	majica varchar (40) not null,
	decko int
);

create table decko (
	sifra int not null primary key identity(1,1),
	indiferentno bit,
	vesta varchar (34),
	asocijalno bit not null
);

create table decko_zarucnica (
	sifra int not null primary key identity(1,1),
	decko int not null,
	zarucnica int not null
);

create table zarucnica (
	sifra int not null primary key identity(1,1),
	narukvica int,
	bojakose varchar (37) not null,
	novcica decimal (15,9),
	lipa decimal (15,8) not null,
	indiferentno bit not null
);

create table prijatelj (
	sifra int not null primary key identity(1,1),
	modelnaocala varchar (37),
	treciputa datetime not null,
	ekstroventno bit not null,
	prviputa datetime,
	svekar int not null
);

create table svekar (
	sifra int not null primary key identity(1,1),
	stilfrizura varchar (48),
	ogrlica int not null,
	asocijalno bit not null
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);

insert into decko (indiferentno,vesta,asocijalno)
values ('1','zuta','0'),
	('0','plava','1'),
	('1','vunena','0');

insert into zarucnica (narukvica,bojakose,novcica,lipa,indiferentno)
values (1,'ljubicasta','101','36','1'),
	(2,'zelena','1.99','21','0'),
	(3,'plava','99.45','5.12','1');

insert into decko_zarucnica (decko,zarucnica)
values (1,3),
	(2,2),
	(3,1);

insert into cura (haljina,drugiputa,suknja,narukvica,introvertno,majica,decko)
values ('plava','2021-12-11','zelena',1,'1','zuta',1),
	('crvena','2022-04-25','bijela',2,'0','roze',2),
	('siva','2022-01-16','crna',3,'1','ljubicasta',3);

insert into neprijatelj (majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values ('bijela','crvena','1.23','gucci','55.52','58266368321',1),
	('plava','zuta','2.57','ray-ban','1200.46','68326937315',2),
	('siva','zelena','6.11','versace','5.78','18250638352',3);

update prijatelj set treciputa='2020-04-30';
delete from brat where ogrlica !='14';
select suknja from cura where drugiputa is null;

select a.novcica, f.neprijatelj, e.haljina
from zarucnica a
inner join decko_zarucnica b 
on a.sifra=b.zarucnica
inner join decko c 
on c.sifra=b.decko
inner join cura d 
on c.sifra=d.decko
inner join neprijatelj e 
on e.cura=d.sifra
inner join brat f 
on f.neprijatelj=e.sifra
where d.drugiputa is not null and c.vesta like '%ba%'
order by e.haljina desc;

select a.vesta,a.asocijalno from decko a 
left join decko_zarucnica b on a.sifra=b.sifra;