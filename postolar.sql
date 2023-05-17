drop database if exists postolar;
create database postolar;
use postolar;
create table postolar(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar (60),
    oib char(11),
    korisnik int
);
create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    email varchar(50),
    obuca varchar(50)
);
create table obuca(
    sifra int not null primary key auto_increment,
    vrtsa varchar(50),
    postolar int not null,
    segrt varchar(50),
    popravak int not null,
    korisnik int not null
);
create table popravak(
    sifra int not null primary key auto_increment,
    postolar varchar(50),
    obuca varchar (50),
    datum datetime,
    segrt int 
);
create table segrt(
    sifra int not null primary key auto_increment,
    obuca varchar(50),
    popravak varchar(50),
    postolar int
);
alter table postolar add foreign key(korisnik) references korisnik(sifra);
alter table obuca add foreign key(postolar) references postolar(sifra);
alter table obuca add foreign key(popravak) references popravak(sifra);
alter table obuca add foreign key(korisnik) references korisnik(sifra);
alter table popravak add foreign key(segrt) references segrt(sifra);
alter table segrt add foreign key(postolar) references postolar(sifra);
