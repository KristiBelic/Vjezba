

# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\SQL\vjezba_1.sql

drop database if exists vjezba_1;
create database vjezba_1;
use vjezba_1;
create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int not null,
    dukserica varchar(41),
    lipa decimal (13,8),
    eura decimal(12,7),
    majica varchar(35)
);
create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);
create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);
create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null  
);
create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14.5) not null,
    zena int not null
);
create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno bit,
    ekstrovertno bit not null,
    dukserica varchar(48) not null,
    muskarac int
);
create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);
create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

alter table cura add foreign key(punac) references punac(sifra);
alter table mladic add foreign key(muskarac) references muskarac(sifra);
alter table muskarac add foreign key(zena) references zena(sifra);
alter table zena add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(svekar) references svekar(sifra);

insert into svekar(sifra,bojaociju,prstena,dukserica,lipa,eura,majica)
values 
(null,'plava',3,'Puma',0.30,9,'Lidl');

insert into sestra (sifra,introvertno,haljina,maraka,hlace,narukvica)
values 
(null,0,'Maksi',16.6,'cargo',585),
(null,1,'Mini',14.2,'flare',585),
(null,0,'Midi',12.3,'mom',585);

insert  into sestra_svekar(sifra,sestra,svekar)
values
(null,1,1),
(null,2,1),
(null,3,1);

insert into zena(sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values
(null,2023-03-03,'S','S','14562985649','plava','M',1),
(null,2023-03-23,'M','M','12654986953','zelena','L',2),
(null,2023-04-05,'L','L','1264579856','smeđa','XL',3);


insert into muskarac(sifra,bojaociju,hlace,modelnaocala,maraka,zena)
values
(null,'zelena','','aviator',13.30,1),
(null,'smeđa','','nerd',16.00,2),
(null,'crna','crna','cube',10.99,3);

insert into mladic(sifra,suknja,kuna,drugiputa,asocijalno,ekstrovertno,dukserica,muskarac)
values
(null,'xy',120,2023-05-05,1,1,'puma',1),
(null,'yx',130,2023-06-06,0,0,'adiddas',2),
(null,'xz',141,2023-07-07,1,0,'nike',3);


insert into punac(sifra,ogrlica,gustoca,hlace)
values
(null,1,66.77,'x'),
(null,2,77.88,'y'),
(null,3,88.99,'z');

insert into cura(sifra,novcica,gustoca,lipa,ogrlica,bojakose,suknja,punac)
values
(null,23.23,32.32,30.31,1,'crvena','M',1),
(null,45.45,77.88,99.90,2,'plava','L',2),
(null,51.56,2.44,47.21,3,'ljubičasta','XL',3);


update cura set gustoca=15.77;

delete from mladic where kuna>15.78;

select * from zena where kratkamajica like '%ana';

select a.dukserica,f.asocijalno,e.hlace
from svekar a 
inner join sestra_svekar b 	on a.sifra=b.svekar
inner join sestra c 		on c.sifra=b.sestra 
inner join zena d 			on d.sestra=c.sifra	
inner join muskarac e 		on e.zena=d.sifra
inner join mladic f 		on f.muskarac=e.sifra
where d.hlace like'a%' and c.haljina like '%ba'
order by e.hlace desc;

select a.haljina, a.maraka
from sestra a
left join sestra_svekar b on a.sifra = b.sestra
where b.sestra is null;




