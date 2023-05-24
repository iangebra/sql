use master;
drop database if exists fakultet;
go
create database fakultet;
go
use fakultet;

create table student (
    sifra int not null primary key identity(1,1),
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null
);

create table rok (
    sifra int not null primary key identity(1,1),
    datum datetime null,
);
    

create table kolegij (
    sifra int not null primary key identity(1,1),
    naziv varchar(50) not null,
);

create table ispit (
    student int not null,
    rok int not null,
    kolegij int not null
);

alter table ispit add foreign key (student) references student(sifra);
alter table ispit add foreign key (rok) references rok(sifra);
alter table ispit add foreign key (kolegij) references kolegij(sifra);

insert into student (ime, prezime, oib) 
values ('luka','lukic','75378943613'),
('ivana','ivanic','21378944681'),
('tea','tomic','15328963284');

insert into rok (datum)
values ('2023-02-18'),
('2023-03-11'),
('2023-05-17');

insert into kolegij (naziv)
values ('matematika'),
('informatika'),
('fizika');

insert into ispit (student, rok, kolegij)
values (1,3,2),
(3,2,1),
(2,1,3);