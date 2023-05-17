drop database if exists frizerski_salon;
create database frizerski_salon;
use frizerski_salon;
create table salon(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	vlasnik varchar(50) not null,
	oib char(11) not null,
	djelatnica int
);
create table djelatnica(
	sifra int not null primary key auto_increment,
	salon int (50) not null,
	iban varchar(60),
	osoba int(50) not null,
	korisnik int
);
create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11)
);
create table korisnik(
	sifra int not null primary key auto_increment,
	termin datetime,
	osoba int not null,
	usluga int not null
);
create table usluga(
	sifra int not null primary key auto_increment,
	naziv varchar(60),
	cijena decimal(18.2)
); 
alter table djelatnica add foreign key(salon)references salon(sifra);
alter table djelatnica add foreign key(osoba)references osoba(sifra);
alter table djelatnica add foreign key(korisnik)references korisnik(sifra);
alter table korisnik add foreign key(osoba)references osoba(sifra);
alter table korisnik add foreign key(usluga)references usluga(sifra);

insert into salon(sifra,naziv,oib,vlasnik)
values(null,'Billy',35698745125,'Anita Billy');

insert into osoba(sifra,ime,prezime,oib)
values(null,'Karolina','Nović',null), (null,'Martina','Pivić',null),
(null,'Ana','Klarić',null),(null,'Ivona','Garaj',null);

insert into usluga(sifra,naziv,cijena)
values(null,'Frizura',6.40),(null,'Bojanje kose',7.30),(null,'Pramenovi',12.50);

insert into korisnik(sifra,termin,osoba,usluga)
values(null,15,3,1),(null,17,4,3);

insert into djelatnica(sifra,salon,iban,osoba,korisnik)
values(null,1,null,1,null), (null,1,null,2,null);
