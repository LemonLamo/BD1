*==============================================================*/
/* Database name:  TP  BD_CINEMA                                         */
/*==============================================================*/
USE mydb;

drop index AIMER_FK
/


drop index JOUER_FK
/


drop index PRODUIR_FK
/


drop index PROJETER_FK
/


drop index VOIR_FK
/


drop table AIME cascade constraints
/


drop table VU cascade constraints
/


drop table SEANCE cascade constraints
/


drop table PRODUIT cascade constraints
/


drop table JOUE cascade constraints
/


drop table FILM cascade constraints
/


/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/


create table FILM  (
   TITRE                VARCHAR(40)                     not null,
   DUREE                INTEGER,
   NATIONALITE          VARCHAR(30),
   NOM_REALISATEUR   VARCHAR(30),
   constraint PK_FILM primary key (TITRE)
)
/


/*==============================================================*/
/* Table: JOUE                                                  */
/*==============================================================*/


create table JOUE  (
   NOM_ACTEUR           VARCHAR(30)                     not null,
   TITRE                VARCHAR(40)                     not null,
   constraint PK_JOUE primary key (NOM_ACTEUR, TITRE),
   constraint FK_JOUE_JOUER_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/


/*==============================================================*/
/* Index: JOUER_FK                                              */
/*==============================================================*/
create  index JOUER_FK on JOUE (
   TITRE ASC
)
/


/*==============================================================*/
/* Table: PRODUIT                                               */
/*==============================================================*/


create table PRODUIT  (
   NOM_PRODUCTEUR       VARCHAR(30)                     not null,
   TITRE                VARCHAR(40)                     not null,
   constraint PK_PRODUIT primary key (NOM_PRODUCTEUR, TITRE),
   constraint FK_PRODUIT_PRODUIR_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/
CREATE TABLE Seance (
     TITRE VARCHAR(40) NOT NULL,
    Nom_salle VARCHAR(40) NOT NULL,
    Temps VARCHAR(40) NOT NULL,
    Langue VARCHAR(40) NOT NULL
);

CREATE TABLE Vu (
   NOM_PRODUCTEUR VARCHAR(40),
   TITRE VARCHAR(40)
);

/*==============================================================*/
/* Index: PRODUIR_FK                                            */
/*==============================================================*/
create  index PRODUIR_FK on PRODUIT (
   TITRE ASC
)
/


