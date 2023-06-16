

# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\SQL\vjezba_3.sql


drop database if exists vjezba_3;
create database vjezba_3;
use vjezba_3;

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstrovertno bit not null
);
create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);
create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);
create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int not null
);
create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    kuna decimal(15,6)not null,
    eura decimal(12,9)not null,
    treciputa datetime,
    ostavljena int not null
);
create table punica(
    sifra int not null primary key auto_increment,
    asocijalno bit,
    kratkamajica varchar(44),
    kuna decimal(13,8)not null,
    vesta varchar(32)not null,
    snasa int not null
);
create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8)not null,
    suknja varchar(44)not null,
    bojakose varchar(36)not null,
    prstena int,
    narukvica int not null,
    cura int not null
);
create table cura(
    sifra int not null primary key auto_increment,
    duskerica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

alter table prijatelj_brat add foreign key(brat) references brat(sifra);
alter table prijatelj_brat add foreign key(prijatelj)references prijatelj(sifra);
alter table ostavljena add foreign key(prijatelj) references prijatelj(sifra);
alter table snasa add foreign key(ostavljena) references ostavljena(sifra);
alter table punica add foreign key(snasa) references snasa(sifra);
alter table svekar add foreign key(cura) references cura(sifra);

insert into brat(sifra,jmbag,ogrlica,ekstrovertno) 
values(null,'5126549856',1,1),
(null,'13265986549',2,0),
(null,'13265498659',3,0);

insert into prijatelj(sifra,indiferentno)
values 
(null,1),
(null,0),
(null,1);

insert into prijatelj_brat(sifra,prijatelj,brat)
value (null,1,3),
(null,2,2),
(null,3,1);

insert into ostavljena(sifra,modelnaocala,prijatelj)
values (null,'sunčane',1),
(null,'dioprtijske',2),
(null,'progresivne',3);

insert into snasa(sifra,kuna,eura,ostavljena) 
values (null,36.52,5.5,1),
(null,65.45,12.32,2),
(null,12.12,14.23,3);

insert into punica(sifra,kuna,vesta,snasa)
values (null,23.89,56.78,1),
(null,23.45,14.48,3),
(null,95.98,65.45,2);

insert into cura(sifra,ogrlica)
values(null,6),
(null,9),
(null,13);

insert into svekar(sifra,novcica,suknja,narukvica,cura)
values (null,23.56,'maksi',2,1),
(null,65.65,'cvijetna',3,2),
(null,49.78,'na prugice',1,3);

update svekar set suknja='Osijek';
delete from punica where kratkamajica='AB;'

select a.majica
from ostavljena a where a.lipa not in (9,10,20,30,35);


select a.ekstrovertno,f.vesta,e.kuna
from brat a
inner join prijatelj_brat b on  a.sifra=b.brat 
inner join prijatelj c on c.sifra=b.prijatelj 
inner join ostavljena d on c.sifra=d.prijatelj 
inner join snasa e on d.sifra=e.ostavljena 
inner join punica f on e.sifra=f.snasa 
where d.lipa !=91 and c.haljina like '%ba%'
order by e.kuna desc;

select a.haljina,a.lipa
from prijatelj a left join prijatelj_brat b on a.sifra=b.prijatelj
where b.prijatelj is null;
