drop database if exists doktorska_ordinacija;
create database doktorska_ordinacija;
use doktorska_ordinacija;
create table ordinacija(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    adresa varchar(60) not null,
    oib char(11) not null,
    doktor varchar(70) not null
);
create table doktor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(60) not null,
    oib char(11) not null,
    medicinska_sestra int,
    ordinacija int
);
create table pacijent(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    mbo char(15),
    doktor int not null
);
create table medicinska_sestra(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    doktor int not null,
    pacijent varchar(60)
);
alter table doktor add foreign key(medicinska_sestra) references medicinska_sestra(sifra);
alter table doktor add foreign key(ordinacija) references ordinacija(sifra);
alter table pacijent add foreign key(doktor) references doktor(sifra);
alter table medicinska_sestra add foreign key(doktor) references doktor(sifra);
