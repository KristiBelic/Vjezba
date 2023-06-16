


# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\SQL\vjezba_2.sql


drop database if exists vjezba_2;
create database vjezba_2;
use vjezba_2;

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);
create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);
create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);
create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);
create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);
create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);
create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);
create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstrovertno bit not null,
    prviputa datetime,
    svekar int not null
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);
alter table decko_zarucnica add foreign key(decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table cura add foreign key(decko) references decko(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

insert into zarucnica (sifra,narukvica,bojakose,novcica,lipa,indiferentno)
values 
(null,1,'crvena',16.00,6.00,1),
(null,2,'ružičasta',14.21,32.15,0),
(null,3,'plava',12.15,14.87,1);

insert into decko(sifra,indiferentno,vesta,asocijalno)
values 
(null,1,'TomTailor',1),
(null,0,'PullandBear',0),
(null,1,'Zara',0);

insert into decko_zarucnica(sifra,decko,zarucnica)
values
(null,1,1),
(null,2,3),
(null,3,2);

insert into cura(sifra,haljina,drugiputa,suknja,narukvica,introvertno,majica,decko)
values
(null,'midi na cvijetiće','2023-12-1','dugačka',1,1,'Mornarska',1),
(null,'maksi prugice','2023-11-2','kratka',2,0,'stradivarius',2),
(null,'bijela mini','2023-3-2','duga',3,1,'bershka',3);

insert into neprijatelj(sifra,majica,haljina,lipa,modelnaocala,kuna,jmbag,cura) 
values 
(null,'kratka','mini',11.02,'sunčane',33.2,'78946532156',3),
(null,'dugačka','midi',14.5,'dioptrijske',45.56,'13652497658',2),
(null,'bez rukava','maksi',10.23,'progresivne',56.48,'12579865984',1);

insert into brat(sifra,suknja,ogrlica,asocijalno,neprijatelj)
values
(null,'traper',585,1,2),
(null,'pamučna',585,0,1),
(null,'lanena',585,1,3);

insert into svekar (sifra,stilfrizura,ogrlica,asocijalno)
values
(null,'rockabilly',989,1),
(null,'biberica',585,0),
(null,'vojnik',989,1);

insert into prijatelj (sifra,modelnaocala,treciputa,ekstrovertno,prviputa,svekar)
values
(null,'dioptrijske','2022-12-14',1,'2019-12-25',3),
(null,'sunčane','2022-08-25',0,'2022-09-26',1),
(null,'sunčane s dioptrijom','2022-6-30',1,'2022-7-30',2);


select * from prijatelj;

update prijatelj set treciputa='2020-04-30';

delete from brat where ogrlica !=14;

select suknja from cura where drugiputa=null; 

select a.novcica,f.neprijatelj,e.haljina
from zarucnica a 
inner join decko_zarucnica b on a.sifra=b.zarucnica 
inner join decko c on c.sifra=b.decko 
inner join cura d on c.sifra=d.decko
inner join neprijatelj e on d.sifra=e.cura 
inner join brat f on e.sifra=f.neprijatelj 
where d.drugiputa is not null and c.vesta like 'ba%'
order by e.haljina desc;

select a.vesta,a.asocijalno
from decko a left join decko_zarucnica b 
on a.sifra=b.decko where b.decko is null;

