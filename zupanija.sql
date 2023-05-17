drop database if exists zupanija;
create database zupanija;
use zupanija;
create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupan int
);
create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar (50),
    prezime varchar (50)
);
create table opcina(
    sifra int not null primary key auto_increment,
    zupanija int,
    naziv varchar(70)
);
create table mjesto(
    sifra int not null primary key auto_increment,
    opcina int,
    naziv varchar(60)
);
alter table zupanija add foreign key(zupan) references zupan(sifra);
alter table opcina add foreign key(zupanija) references zupanija(sifra);
alter table mjesto add foreign key(opcina) references opcina(sifra);

insert into zupan(sifra,ime,prezime)
values (null,'Ivan','Anušić'),(null,'Damir','Dekanić'),
(null,'Danijel','Marušić');

insert into zupanija(sifra,naziv,zupan)
values (null,'Osječko-baranjska',1),(null,'Vukovarsko-srijemska',2),
(null,'Brodsko-posavka',3);

# Osjecko-baranjska

insert into opcina(sifra,zupanija,naziv)
values(null,1,'Bizovac'),(null,1,'Petrijevci'),
(null,1,'Antunovac'),(null,1,'Čepin'),(null,1,'Dadra'),(null,1,'Vuka');

# Vukovarsko-srijemska

insert into opcina(sifra,zupanija,naziv)
values(null,2,'Borovo'),(null,2,'Gunja'),
(null,2,'Ivankovo'),(null,2,'Nuštar'),(null,2,'Jarmina'),(null,2,'Tovarnik');

# Brodsko-posavska

insert into opcina(sifra,zupanija,naziv)
values(null,3,'Cernik'),(null,3,'Davor'),
(null,3,'Donji Andrijevci'),(null,3,'Gornja Vrba'),(null,3,'Gudinci'),(null,3,'Klakar');

insert into mjesto(sifra,opcina,naziv)
values (null,1,'Bizovac'),(null,1,'Petrijevci'),(null,1,'Antunovac'),(null,1,'Čepin'),(null,1,'Darda'),(null,1,'Vuka'),
(null,2,'Borovo'),(null,2,'Gunja'),(null,2,'Ivankovo'),(null,2,'Nuštar'),(null,2,'Jarmina'),(null,2,'Tovarnik'),
(null,3,'Cernik'),(null,3,'Davor'),(null,3,'Donji Andrijevcvi'),(null,3,'Gornja Vrba'),(null,3,'Gudinci'),(null,3,'Klakar');


