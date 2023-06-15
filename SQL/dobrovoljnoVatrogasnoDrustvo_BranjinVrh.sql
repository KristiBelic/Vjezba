
# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\dobrovoljnoVatrogasnoDrustvo_BranjinVrh.sql

drop database if exists dobrovoljnoVatrogasnoDrustvo_BranjinVrh;
create database dobrovoljnoVatrogasnoDrustvo_BranjinVrh;
use dobrovoljnoVatrogasnoDrustvo_BranjinVrh;

create table dobrovoljnoVatrogasnoDrustvo(
    id int not null primary key auto_increment,
    naziv varchar(10),
    zupanija varchar(60) not null,
    opcina varchar(60) not null,
    mjesto varchar(60) not null,
    adresa varchar(60) not null,
    oib char(11),
    email varchar(60)
);
create table osoba(
   id int not null primary key auto_increment,
   ime varchar(60) not null,
   prezime varchar(60) not null,
   oib char(11) not null,
   kontakt varchar(60),
   status_u_DVD varchar(80) 
);
create table dogadaj(
    id int not null primary key auto_increment,
    naziv varchar(10) not null,
    opis varchar(200) not null,
    datum date,
    gost int,
    dobrovoljnoVatrogasnoDrustvo int
);
create table vijesti(
    id int not null primary key auto_increment,
    naslov varchar(60) not null,
    opis varchar(60) not null,
    gost int,
    dobrovoljnoVatrogasnoDrustvo int
);
create table gost(
    id int not null primary key auto_increment,
    nadimak varchar(70),
    komentar varchar(200)
);
create table clan(
    id int not null primary key auto_increment,
    osoba int,
    funkcija varchar(70),
    dobrovoljnoVatrogasnoDrustvo int
);
create table operater(
    id int not null primary key auto_increment,
    email varchar(70) not null,
    oib char (11) not null,
    ime varchar(60) not null,
    prezime varchar(70),
    lozinka varchar(70)
);
 alter table clan add foreign key(osoba) references osoba(id);
 alter table clan add foreign key(dobrovoljnoVatrogasnoDrustvo) references dobrovoljnoVatrogasnoDrustvo(id);
 alter table dogadaj add foreign key(dobrovoljnoVatrogasnoDrustvo) references dobrovoljnoVatrogasnoDrustvo(id);
 alter table dogadaj add foreign key(gost) references gost(id);
 alter table vijesti add foreign key(gost) references gost(id);




