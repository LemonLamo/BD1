use mydb;

*==============================================================*/
/* Database name:  TP  BD_CINEMA                                         */
/*==============================================================*/



 CREATE TABLE AIME (
 NOM_AMATEUR VARCHAR(30) ,
 TITRE VARCHAR(40)
 );

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
    Heure_dif FLOAT NOT NULL,
    Langue VARCHAR(40) NOT NULL,
);

/*==============================================================*/
/* Table: VU                                            */
/*==============================================================*/


CREATE TABLE VU (
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
/*modification du schema et des contraintes*/
/*avec ALTER TABLE NomTable 
pour modifier le type d'une colonne : MODIFY nomAttribut nvtype
pour Ajouter une colonne : ADD Nomcolonne/attribut
Pour ajouter des contraintes : ADD CONSTRAINT */

DESCRIBE AIME;
ALTER TABLE AIME MODIFY 
   TITRE VARCHAR(60)
;

ALTER TABLE seance
ADD CONSTRAINT chk_temps CHECK (Heure_dif >= 13.00);





