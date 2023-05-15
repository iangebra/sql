use master;
drop database if exists isvu;
go
create database isvu;
go
use isvu;

create table student(
	id int not null primary key identity (1,1),
	first_name varchar (51) not null,
	last_name varchar (50) not null,
	jmbag char (11) not null,
);

create table course(
	id int not null primary key identity (1,1),
	name varchar(50) not null,
	ects int not null,
	description varchar(50) not null
);

create table student_course(
	id int not null primary key identity (1,1),
	student int not null,
	course int not null,
	date_of_enrollment date not null,
	academic_year int not null,
	);

create table academic_year(
	id int not null primary key identity (1,1),
	name varchar(50) not null,
	start_date date,
	end_date date,
	);

	alter table student_course add foreign key (student) references student(id)
	alter table student_course add foreign key (course) references course(id)
	alter table student_course add foreign key (academic_year) references academic_year(id)