drop database if exists urar_silvija;
create database urar_silvija;
use urar_silvija;
create table urar(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null
);
create table popravak(
    sifra int not null primary key auto_increment,
    vrsta varchar (60) not null,
    sat int not null,
    korisnik int not null,
    segrt varchar (50)
);
create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    sat varchar(50)
);
create table sat(
    sifra int not null primary key auto_increment,
    urar int not null,
    korisnik varchar(50) not null,
    popravak int not null,
    segrt int not null
);
create table segrt(
    sifra int not null primary key auto_increment,
    sat varchar(50),
    popravak varchar(50),
    postolar varchar(50) not null
);
alter table popravak add foreign key(sat) references sat(sifra);
alter table popravak add foreign key(korisnik) references korisnik(sifra);
alter table sat add foreign key(urar) references urar(sifra);
alter table sat add foreign key(popravak) references popravak(sifra);
alter table sat add foreign key(segrt) references segrt(sifra);

