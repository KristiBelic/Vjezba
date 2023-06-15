drop database if exists djecji_vrtic;
create database djecji_vrtic;
use djecji_vrtic;
create table vrtic(
	sifra int not null primary key auto_increment,
	naziv varchar (60) not null,
	adresa varchar(60) not null
);
create table skupina(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	odgajateljica int,
	vrtic int
);
create table djeca(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime  varchar(50),
	oib char(11),
	skupina int,
	odgajateljica varchar(50)
);
create table odgajateljica(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib char(11),
	vrtic varchar(50),
	skupina varchar(50),
	strucna_sprema int
);
create table strucna_sprema(
	sifra int not null primary key auto_increment,
	naziv varchar(50),
	odgajateljica varchar(50)
);

alter table odgajateljica add foreign key(strucna_sprema)references strucna_sprema(sifra);
alter table skupina add foreign key(odgajateljica)references odgajateljica(sifra);
alter table skupina add foreign key(vrtic)references vrtic(sifra);
alter table djeca add foreign key(skupina)references skupina(sifra);


insert into strucna_sprema(sifra,naziv,odgajateljica)
values(null,'VSS','Antonela'),(null,'VSS','Katja'),(null,'VSS','Marla'),(null,'VSS','Jasmina'),(null,'VSS','Petra');

insert into odgajateljica(sifra,ime,prezime,oib,vrtic,skupina,strucna_sprema)
values(null,'Antonela','Jukin',13265498652,'Bambi','Pčelice','1'),
(null,'Katja','Bognar',12453265987,'Bambi','Pčelice','2'),
(null,'Marla','Katarin',45798659432,'Bambi','Šapice','3'),
(null,'Jasmina','Kolar',13265498625,'Bambi','Šapice','4'),
(null,'Petra','Ban',14579655863,'Bambi','Mravići','5');

insert into vrtic(sifra,naziv,adresa)
values(null,'Dječji vrtić Bambi','Ive Lole Ribara 6 Ladimirevci'),
(null,'Dječji vrtić Maza','J.J. Strossmayera 14 Valpovo'),
(null,'Dječji vrtić Maslačak','Braće Radića 85 Belišće');

insert into skupina(sifra,naziv,odgajateljica,vrtic)
values (null,'Pčelice',1,1),(null,'Pčelice',2,1),(null,'Mravići',5,1),
(null,'Šapice',3,1),(null,'Šapice',4,1);

insert into djeca(sifra,ime,prezime,oib,skupina,odgajateljica)
values (null,'Irina','Markić',null,1,1),
(null,'Nola','Bečka',null,1,4),
(null,'Lora','Brown',null,2,3),
(null,'Lea','Mandić',null,3,5);
