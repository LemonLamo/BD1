USE tuto;
CREATE TABLE posts (
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(255) NOT NULL,
   content LONGTEXT,
   online VARCHAR(255) DEFAULT 0
);

INSERT INTO posts(title, online) VALUES ('hello',0);
INSERT INTO posts SET title ="Hello online", online =1;
INSERT INTO posts SET title ="Hello online", online ='aoeizhfz';

UPDATE posts SET online =1 where id =3;

ALTER TABLE posts
MODIFY online BOOLEAN NOT NULL DEFAULT 0;