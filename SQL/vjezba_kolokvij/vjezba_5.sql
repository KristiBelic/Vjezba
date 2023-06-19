

# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Josip\Documents\EDUNOVA_JAVA_PROGRAMER\KRISTI\SQL\vjezba_5.sql



drop database if exists vjezba_5;
create database vjezba_5;
use vjezba_5;
create table cura(
    sifra int primary key not null auto_increment,
    carape varchar(41)not null,
    maraka decimal(17,10)not null,
    asocijalno bit,
    vesta varchar(47)not null
);
create table svekar(
    sifra int primary key not null auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(31),
    narukvica int,
    eura decimal(14,5)not null
);
create table svekar_cura(
    sifra int primary key not null auto_increment,
    svekar int not null,
    cura int not null
);
create table punac(
    sifra int primary key not null auto_increment,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);
create table punica(
    sifra int primary key not null auto_increment,
    hlace varchar(43)not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49)not null,
    modelnaocala varchar(31)not null,
    treciputa datetime not null,
    punac int not null
);
create table ostavljena(
    sifra int primary key not null auto_increment,
    majica varchar(31),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);
create table zarucnik(
    sifra int primary key not null auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno bit not null
);
create table mladic (
    sifra int primary key not null auto_increment,
    kratkamajica varchar(48)not null,
    haljina varchar(30)not null,
    asocijalno bit,
    zarucnik int 
);
alter table mladic add foreign key(zarucnik) references zarucnik(sifra);
alter table svekar_cura add foreign key(cura) references cura(sifra);
alter table svekar_cura add foreign key(svekar) references svekar(sifra);
alter table punac add foreign key(svekar) references svekar(sifra);
alter table punica add foreign key(punac) references punac(sifra);
alter table ostavljena add foreign key(punica) references punica(sifra);

insert into cura(sifra,carape,maraka,vesta)
values(null,'na prugice',12.45,'bijela'),
(null,'na cvijeće',45.15,'plava'),
(null,'rebrasta',45.12,'crna');

insert into svekar (sifra,carape,eura)
values
(null,'plave',12.12),
(null,'prugaste',23.21),
(null,'zelene',12.63);

insert into svekar_cura(sifra,svekar,cura)
values
(null,1,3),
(null,3,2),
(null,2,1);

insert into punac(sifra,prviputa,svekar)
values
(null,2023-12-01,1),
(null,2023-11-01,2),
(null,2023-10-01,3);

insert into punica(sifra,hlace,nausnica,vesta,modelnaocala,treciputa,punac)
values
(null,'cargo',1,'zimska','dioptrijske',2023-06-06,1),
(null,'široke',2,'duga','sunčane',2023-03-03,2),
(null,'kratke',3,'pletena','progresivne',2023-05-05,3);

insert into ostavljena(sifra,ogrlica,punica)
values
(null,3,2),
(null,1,1),
(null,54,3);

insert into zarucnik(sifra,indiferentno)
values
(null,1),
(null,0),
(null,1);

insert into mladic(sifra,kratkamajica,haljina)
values
(null,'plava','zelena'),
(null,'zelena','roza'),
(null,'roza','crna');


update mladic set haljina='Osijek';

delete from ostavljena where ogrlica=17;
select majica from punac where prviputa = null;

select a.asocijalno,f.stilfrizura,e.nausnica
from cura a 
inner join svekar_cura b on a.sifra=b.cura
inner join svekar c on c.sifra=b.svekar 
inner join punac d on c.sifra=d.svekar 
inner join punica e on d.sifra=e.punac 
inner join ostavljena f on e.sifra=f.punica 
where d.prviputa is not null and c.majica like '%ba%';

select a.majica,a.carape
from svekar a 
left join svekar_cura b on a.sifra=b.svekar 
where  b.svekar is null;
