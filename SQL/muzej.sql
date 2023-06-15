drop database if exists muzej;
create database muzej;
use muzej;
create table muzej(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar (50),
    obi char(11),
    izlozba varchar(60)
);
create table izlozba(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    autor varchar(50),
    muzej int,
    kustos int,
    sponzor int
);
create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    izlozba varchar(50)
);
create table djela(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    autor varchar(50),
    izlozba int
);
create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    izlozba varchar(50)
);
alter table izlozba add foreign key(muzej) references muzej(sifra);
alter table izlozba add foreign key(sponzor) references sponzor(sifra);
alter table izlozba add foreign key(kustos) references kustos(sifra);
alter table djela add foreign key(izlozba) references izlozba(sifra);