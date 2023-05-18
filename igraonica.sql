

# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\igraonica.sql


drop database if exists igraonica;
create database igraonica;
use igraonica;
create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    ime_roditelja varchar(50),
    prezime varchar(50),
    telefon_roditelja varchar(50)
);
create table posjeta(
    sifra int not null primary key auto_increment,
    datum_vrijeme_dolaska datetime not null,
    datum_vrijeme_odlaska datetime not null,
    napomena varchar(100),
    djelatnik_sifra int
);
create table dijete_posjeta(
    sifra int not null primary key auto_increment,
    dijete int not null,
    posjeta int not null
);
create table usluga_posjeta(
    sifra int not null primary key auto_increment,
    usluga int not null,
    posjeta int not null
);
create table usluga(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2) not null,
    jedinica_mjere varchar(50),
    kolicina decimal(18,2) not null,
    naziv varchar(50)
);
create table djelatnik(
    sifra int not null primary key auto_increment,
    iban varchar(50) not null,
    ime varchar(50) not null,
    oib char (11) not null,
    prezime varchar(50),
    radno_mjesto varchar(50)
);
create table operater(
    sifra int not null primary key auto_increment,
    email varchar(50),
    ime varchar(50) not null,
    lozinka varchar(50),
    oib char(11) not null,
    prezime varchar(50)
);

alter table dijete_posjeta add foreign key(dijete) references dijete(sifra);
alter table dijete_posjeta add foreign key(posjeta) references posjeta(sifra);
alter table usluga_posjeta add foreign key(usluga) references usluga(sifra);
alter table usluga_posjeta add foreign key(posjeta) references posjeta(sifra);
alter table posjeta add foreign key(djelatnik_sifra) references djelatnik(sifra);

insert into dijete(sifra,ime,ime_roditelja,prezime,telefon_roditelja)
values (null,'Jan','Katarina','Markić',098323659),
	(null,'Marta','Josipa','Lukić',091425785),
	(null,'Karlo','Jana','Ban',095124562);	

insert into djelatnik(sifra,iban,ime,oib,prezime,radno_mjesto)
values (null,'HR15443132465','Antonia',1236549857,'Lozar','animatorica'),
		(null,'HR1479465132','Lora',21659865497,'Jančikić','animatorica'),
		(null,'HR14963528174','Jona',14523659875,'Vichta','animator');

insert into posjeta(sifra,datum_vrijeme_dolaska,datum_vrijeme_odlaska,napomena,djelatnik_sifra)
values(null,'2023-04-22 11:30:00','2023-04-22 12:30:00','',1),
(null,'2023-04-30 13:00:00','2023-04-30 14:00:00','',2),
(null,'2023-05-02 18:00:00','2023-05-02 19:00:00','',3);

insert into usluga(sifra,cijena,jedinica_mjere,kolicina,naziv)
values (null,25.00,'sat',1.00,'igraonica iznad 5 godina'),(null,30.00,'sat',1.00,'igraonica i playstation'),
(null,30.00,'sat',1.00,'igraonica ispod 5 godina');

insert into dijete_posjeta(sifra,dijete,posjeta)
values (null,1,3),(null,3,2),(null,2,1);

insert into usluga_posjeta(sifra,usluga,posjeta)
values(null,2,1),(null,3,2),(null,1,3);

insert into operater(sifra,email,ime,lozinka,oib,prezime)
values(null,'janjic@gmail.com','Zvonko','zvjanjic','12546985647','Janjić'),
      (null,'bumbar@gmail.com','Alen','alenko123','98564326578','Bumbar'),
      (null,'mirena@gmail.com','Mirena','mira456','12365986594','Nađ');

update djelatnik set ime='Tonka' where sifra=1;
update operater set lozinka='zvjanjic123' where sifra=1;
update operater set prezime='Vonić' where sifra=2;

delete from usluga_posjeta where usluga=1;
delete from usluga_posjeta where posjeta=1;
delete from dijete_posjeta where dijete=1;