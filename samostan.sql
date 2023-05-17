drop database if exists samostan;
create database samostan;
use samostan;
create table samostan(
    sifra int not null primary key auto_increment,
    naziv varchar(100) not null,
    adresa varchar(50) not null,
    nadredeni_svecenik varchar(50)
);
create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar (60) not null,
    oib char(11) not null,
    samostan int not null,
    vrijeme int,
    nadredeni_svecenik int
);
create table nadredeni_svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    svecenik varchar(50)
);
create table posao(
    sifra int not null primary key auto_increment,
    vrsta varchar(60),
    svecenik int not null,
    vrijeme datetime
);
create table vrijeme(
    sifra int not null primary key auto_increment,
    svecenik varchar(50),
    posao int
);
alter table svecenik add foreign key(samostan) references samostan(sifra);
alter table svecenik add foreign key(vrijeme) references vrijeme(sifra);
alter table svecenik add foreign key(nadredeni_svecenik) references nadredeni_svecenik(sifra);
alter table posao add foreign key(svecenik) references svecenik(sifra);
alter table vrijeme add foreign key(posao) references posao(sifra);
