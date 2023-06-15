

# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\galerija.sql


drop database if exists galerija;
create database galerija;
use galerija;
create table galerija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    nadredena int,
    autor int
);
create table autor(
    sifra int not null primary key auto_increment,
    ime varchar (50),
    prezime varchar(50)
);
create table slika(
    sifra int not null primary key auto_increment,
    galerija int,
    putanja varchar(100)
);
create table oznaka(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);
create table slika_oznaka(
    slika int,
    oznaka int
);
alter table galerija add foreign key (nadredena) references galerija(sifra);
alter table galerija add foreign key (autor) references autor(sifra);
alter table slika add foreign key(galerija) references galerija(sifra);
alter table slika_oznaka add foreign key(slika) references slika(sifra);
alter table slika_oznaka add foreign key(oznaka) references oznaka(sifra);

insert into autor(sifra,ime,prezime)
values (null,'Antonija','Hemetek'),(null,'Benjamin','Javor'),(null,'Kristina','Pušić');

insert into galerija(sifra,naziv,nadredena,autor)
values (null,'Ljeto',null,1),(null,'Proljeće',null,2),(null,'Zima',null,3);

insert into slika(sifra,galerija,putanja)
values(null,null,'C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI'),(null,null,'C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI'),
(null,null,'C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI');

insert into oznaka(sifra,naziv)
values(null,'Prva'),(null,'Druga'),(null,'Treća');

insert into slika_oznaka (slika,oznaka)
values (null,1),(null,2),(null,3);

update galerija  set naziv='jesen' where sifra=3;
update autor set prezime='Paulić' where sifra=1;

delete from slika_oznaka where oznaka=1;
delete from oznaka where sifra=1;