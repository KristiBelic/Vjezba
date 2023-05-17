drop database if exists udruga_za_zastitu_zivotinja;
create database udruga_za_zastitu_zivotinja;
use udruga_za_zastitu_zivotinja;
create table udruga(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	oib char(11) not null
);
create table sticenik(
	sifra int not null primary key auto_increment,
	zivotinja int,
	udruga varchar(50) not null,
	prostor int,
	osoba int
);
create table zivotinja(
	sifra int not null primary key auto_increment,
	ime varchar(100)not null,
	vrsta varchar(60) not null,
	udruga int
);
create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(60) not null,
	prezime varchar(60) not null,
	udruga int
);
create table prostor(
	sifra int not null primary key auto_increment,
	sticenik int,
	datum_dolaska datetime
);
alter table osoba add foreign key(udruga)references udruga(sifra);
alter table zivotinja add foreign key(udruga) references udruga(sifra);
alter table sticenik add foreign key(zivotinja) references zivotinja(sifra);
alter table prostor add foreign key(sticenik) references sticenik(sifra);
alter table sticenik add foreign key(osoba) references osoba(sifra);

insert into udruga(sifra,naziv,oib)
values (null,'Šapica',12435698542);

insert into zivotinja(sifra,ime,vrsta,udruga)
values (null,'Riki','Hrčak',1), (null,'Cicko', 'Mačka',1),
(null,'Jack', 'Pas',1),(null,'Goldy', 'zlatna ribica',1);

insert into osoba(sifra,ime,prezime,udruga)
values(null,'Kristijan','Skender',1),(null,'Franjo','Nenadić',1),(null,'Gea','Jukić',1),
(null,'Rafael','Božer',1);

insert into sticenik(sifra,zivotinja,udruga,prostor,osoba)
values (null,1,1,'blok 1',3),(null,2,1,'blok 1',2),(null,3,1,'blok 1',1),(null,4,1,'blok 1',4);

insert into prostor(sifra,sticenik,datum_dolaska)
values(null,1,14-05-2021),(null,2,19-03-2022),(null,3,27-10-2022),(null,4,03-07-2022);



