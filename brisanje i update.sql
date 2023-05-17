--use edunovawp1;
--use master;

select * from grupa;

-- ne izvoditi update bez where dijela update naredbe

update smjer set naziv='Web programiranje'
where sifra=1;

-- promjeni cijenu serviseru na 1200 eur i upisninu na 50 eur

update smjer set
cijena=1200,
upisnina=50
where sifra=3

update grupa set smjer = 11 where sifra=1;

--zadatak

select * from polaznik;

update polaznik set
prezime='Herc'
where sifra=18

update polaznik set
email='lbicak@ht.hr',
oib='12345678910'
where sifra=10


--BRISANJE PODATAKA
select * from clan;

delete from smjer where sifra=1;

delete from grupa where smjer=1;

delete from clan where grupa=1;

