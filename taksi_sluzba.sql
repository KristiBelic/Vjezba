drop database if exists taksi_sluzba;
create database taksi_sluzba;
use taksi_sluzba;
create table sluzba(
    sifra int not null primary key auto_increment,
    naziv varchar (50) not null,
    vlasnik varchar(50) not null,
    oib char(11) not null
);
create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(60),
    vozilo int,
    voznja varchar(50)
);
create table vozilo(
    sifra int not null primary key auto_increment,
    model varchar(60) not null,
    vozac varchar(60),
    sluzba int not null
);
create table putnik(
    sifra int not null primary key auto_increment,
    voznja int,
    vozac varchar(50),
    vrijeme int
);
create table voznja(
    sifra int not null primary key auto_increment,
    vrijeme datetime,
    vozilo varchar (50),
    vozac varchar(50),
    putnik int
);
alter table vozilo add foreign key(sluzba) references sluzba(sifra);
alter table vozac add foreign key(vozilo) references vozilo(sifra);
alter table voznja add foreign key(putnik) references putnik(sifra);
alter table putnik add foreign key(voznja) references voznja(sifra);