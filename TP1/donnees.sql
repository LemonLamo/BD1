USE  mydb;

INSERT INTO Film VALUES ('Body Guard', 120, 'US', 'Mark Gordon');
INSERT INTO Film VALUES ('Les Incorruptibles', 160, 'US', 'Rickley Moore');
INSERT INTO Film VALUES ('Perfect World', 150, 'US', 'Clint Eastwood');
INSERT INTO Film VALUES ('Le Dernier Chateau', 132, 'US', 'Rod Lurie');
INSERT INTO Film VALUES ('Le Negociateur', 140, 'US', 'David Auberman');
INSERT INTO Film VALUES ('Le Destin De Will Hunting', 120, 'US', 'Gus Van Sant');
INSERT INTO Film VALUES ('High Crimes', 115, 'US', 'Carl Francklin');
INSERT INTO Film VALUES ('Le Parrain', 168, 'US', 'Francis Ford Coppola');
INSERT INTO Film VALUES ('Spy Games', 127, 'US', 'Tony Scott');
INSERT INTO Film VALUES ('Nous Etions Soldat', 139, 'US', 'Randall Wallace');
INSERT INTO Film VALUES ('Top Gun', 127, 'US', 'Tony Scott');
INSERT INTO Film VALUES ('Men', 140, 'US', 'Rickley Moore');
INSERT INTO Film VALUES ('Le Pacificateur', 135, 'US', 'Ashley Jude');
INSERT INTO Film VALUES ('Il Faut Sauver Le soldat Ryan', 162, 'US', 'Spielberg');
INSERT INTO Film VALUES ('ET', 165, 'US', 'Spielberg');
INSERT INTO Film VALUES ('Indiana Jones', 170, 'US', 'Spielberg');

SELECT * FROM Film;

INSERT INTO Joue VALUES ('Kevin Costner', 'Perfect World');
INSERT INTO Joue VALUES ('Kevin Costner', 'Les Incorruptibles');
INSERT INTO Joue VALUES ('Kevin Costner', 'Body Guard');
INSERT INTO Joue VALUES ('Clint Eastwood', 'Perfect World');
INSERT INTO Joue VALUES ('Tom Cruise', 'Top Gun');
INSERT INTO Joue VALUES ('Tom Cruise', 'Men');
INSERT INTO Joue VALUES ('Nicole Kidman', 'Men');
INSERT INTO Joue VALUES ('Nicole Kidman', 'Le Pacificateur');
INSERT INTO Joue VALUES ('Harisson Ford', 'Indiana Jones');
INSERT INTO Joue VALUES ('Tom Hanks', 'Il Faut Sauver Le soldat Ryan');
INSERT INTO Joue VALUES ('Aaron Smith', 'Indiana Jones');
INSERT INTO Joue VALUES ('Aaron Smith', 'Il Faut Sauver Le soldat Ryan');
INSERT INTO Joue VALUES ('Aaron Smith', 'ET');
INSERT INTO Joue VALUES ('Amanda Peet', 'Indiana Jones');
INSERT INTO Joue VALUES ('Amanda Peet', 'Il Faut Sauver Le soldat Ryan');
INSERT INTO Joue VALUES ('Amanda Peet', 'ET');
INSERT INTO Joue VALUES ('Amanda Peet', 'Top Gun');

SELECT * FROM Joue;

INSERT INTO Produit VALUES ('Clint Eastwood', 'Perfect World');
INSERT INTO Produit VALUES ('Adam Moore', 'Men');
INSERT INTO Produit VALUES ('Alex May', 'Top Gun');
INSERT INTO Produit VALUES ('Roger Taylor', 'Indiana Jones');

INSERT INTO Seance VALUES ('Indiana Jones', 'Alpha', '13:00', 'VF');
INSERT INTO Seance VALUES ('Body Guard', 'Alpha', '21:00', 'VO');
INSERT INTO Seance VALUES ('Les Incorruptibles', 'Ibn Zeidoun', '13:00', 'VO');
INSERT INTO Seance VALUES ('ET', 'Ibn Zeidoun', '11:00', 'VO');
INSERT INTO Seance VALUES ('Top Gun', 'Ibn Zeidoun', '15:00', 'VO');
INSERT INTO Seance VALUES ('Top Gun', 'Alpha', '09:00', 'VF');
INSERT INTO Seance VALUES ('Men', 'Beta', '11:00', 'VF');
INSERT INTO Seance VALUES ('Le Pacificateur', 'Beta', '23:00', 'VF');

SELECT * FROM Seance;

INSERT INTO Vu VALUES ('Kevin Costner', 'Perfect World');
INSERT INTO Vu VALUES ('Kevin Costner', 'Les Incorruptibles');
INSERT INTO Vu VALUES ('Kevin Costner', 'Body Guard');
INSERT INTO Vu VALUES ('Kevin Costner', 'ET');
INSERT INTO Vu VALUES ('Tom Cruise', 'Top Gun');
INSERT INTO Vu VALUES ('Tom Cruise', 'Men');
INSERT INTO Vu VALUES ('Tom Hanks', 'Men');


SELECT * FROM film;
SELECT * FROM joue;
SELECT * FROM seance;
/
SELECT * FROM Vu;


