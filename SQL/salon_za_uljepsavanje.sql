drop database if exists salon;
create database salon;
use salon;

create table salon(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	oib char(11) not null,
	vlasnik varchar(100) not null,
	djelatnica int,
	usluga varchar(60) not null
);
create table djelatnica(
	sifra int not null primary key auto_increment,
	salon int not null,
	iban varchar(80),
	osoba int,
	korisnik int
);
create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(60) not null,
	prezime varchar(60) not null,
	oib char(11)
);
create table korisnik(
	sifra int not null primary key auto_increment,
	osoba int not null,
	kontakt varchar(80)not null,
	termin datetime not null,
	usluga int
);
create table usluga(
	sifra int not null primary key auto_increment,
	naziv varchar(60),
	cijena decimal(18,2) not null
);

alter table salon add foreign key(djelatnica)references djelatnica(sifra);
alter table djelatnica add foreign key(korisnik)references korisnik(sifra);
alter table djelatnica add foreign key(osoba)references osoba(sifra);
alter table korisnik add foreign key(osoba)references osoba(sifra);
alter table korisnik add foreign key(usluga)references usluga(sifra);

insert into osoba(sifra,ime,prezime,oib) 
values (null,'Matea','Jurić',null),(null,'Korina','Novoselac',null),(null,'Lucia','Nađ',null);

insert into usluga(sifra,naziv,cijena)
values (null,'ČišćEnjE lica',13.00),(null,'Masaža',13.50),(null,'Ugradnja trepavica',14.00),(null,'Pedikura',9.50);

insert into korisnik (sifra,osoba,kontakt,usluga,termin)
values(null,1,098656323,1,15),(null,2,099525353,3,16),(null,3,91898979,2,17);

insert into djelatnica(sifra,salon,iban,osoba,korisnik)
values (null,1,null,1,1),(null,1,null,2,2),(null,1,null,3,3);
