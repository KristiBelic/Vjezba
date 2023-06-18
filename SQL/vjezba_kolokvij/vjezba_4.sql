

# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\SQL\vjezba_4.sql

drop database if exists vjezba_4;
create database vjezba_4;
use vjezba_4;

create table mladic(
    sifra int primary key not null auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);
create table zena(
    sifra int primary key not null auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prstena int not null
);
create table zena_mladic(
    sifra int primary key not null auto_increment,
    zena int not null,
    mladic int not null
);
create table snasa(
    sifra int primary key not null auto_increment,
    introvertno bit,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);
create table becar(
    sifra int primary key not null auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48)not null,
    bojaociju varchar(36) not null,
    snasa int not null
);
create table prijatelj(
    sifra int primary key not null auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11)not null,
    suknja varchar(47)not null,
    becar int not null
);
create table ostavljen(
    sifra int primary key not null auto_increment,
    modelnaocala varchar(43),
    introvertno bit,
    kuna decimal(14,10)
);
create table punac(
    sifra int primary key not null auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7)not null,
    maraka decimal(12,6)not null,
    ostavljen int not null
);


alter table zena_mladic add foreign key(mladic) references mladic(sifra);
alter table zena_mladic add foreign key(zena) references zena(sifra);
alter table snasa add foreign key(zena) references zena(sifra);
alter table becar add foreign key(snasa) references snasa(sifra);
alter table prijatelj add foreign key(becar) references becar(sifra);
alter table punac add foreign key(ostavljen) references ostavljen(sifra);

insert  into mladic(sifra,vesta)
values(null,'šarena'),(null,'na prugice'),
(null,'polo');

insert into zena(sifra,suknja,prstena)
values(null,'midi',1),
(null,'mini',2),
(null,'maksi',3);

insert into zena_mladic(sifra,zena,mladic)
values(null,3,1),
(null,2,3),
(null,1,2);

insert into snasa(sifra,haljina,zena)
values (null,'zelena',1),
(null,'plava',2),
(null,'ljubičasta',3);

insert into becar(sifra,bojaociju,snasa)
values (null,'plava',1),
(null,'zelena',2),
(null,'smeđa',3);

insert into prijatelj (sifra,prstena,jmbag,suknja,becar)
values (null,1,'45698659456','plava',1),
(null,2,'13254986597','roza',2),
(null,3,'45698756985','crna',3);


insert into ostavljen (sifra)
values(null),
(null),
(null);

insert into punac(sifra,jmbag,novcica,maraka,ostavljen)
values(null,'45698659865',12.45,45.45,1),
(null,'12365986598',48.48,13.15,2),
(null,'45789654895',96.85,35.65,3);

update punac set majica='Osijek';

delete from prijatelj where prstena > 17;

select haljina from snasa where treciputa is null;

select a.nausnica,f.jmbag,e.kratkamajica
from mladic a 
inner join zena_mladic b on a.sifra=b.mladic
inner join zena c on c.sifra=b.zena 
inner join snasa d on c.sifra=d.zena 
inner join becar e on d.sifra=e.snasa 
inner join prijatelj f on e.sifra=f.becar 
where d.treciputa is not null and c.lipa != 29
order by e.kratkamajica desc;

select a.lipa,a.prstena
from zena a left join zena_mladic b on a.sifra=b.zena
where b.zena is null;

