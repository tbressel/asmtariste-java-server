DROP DATABASE asmtariste;

CREATE DATABASE IF NOT EXISTS asmtariste;


CREATE TABLE tags(
   id_tags INT AUTO_INCREMENT,
   color VARCHAR(10),
   label VARCHAR(50),
   PRIMARY KEY(id_tags)
);

CREATE TABLE disk_units(
   id_disk_units INT AUTO_INCREMENT,
   label VARCHAR(50),
   letter VARCHAR(50),
   icon VARCHAR(50),
   PRIMARY KEY(id_disk_units)
);

CREATE TABLE menu(
   id_menu INT AUTO_INCREMENT,
   name VARCHAR(50),
   link VARCHAR(50),
   PRIMARY KEY(id_menu)
);

CREATE TABLE permissions(
   id_permissions INT AUTO_INCREMENT,
   name VARCHAR(50),
   PRIMARY KEY(id_permissions)
);

CREATE TABLE contents(
   id_contents INT AUTO_INCREMENT,
   subtitle VARCHAR(50),
   text_1 TEXT,
   text_2 TEXT,
   text_3 TEXT,
   place TINYINT,
   PRIMARY KEY(id_contents)
);

CREATE TABLE images(
   id_images INT AUTO_INCREMENT,
   filename VARCHAR(50),
   alternative VARCHAR(128),
   PRIMARY KEY(id_images)
);

CREATE TABLE templates(
   id_templates INT AUTO_INCREMENT,
   IsSubtitle BOOLEAN,
   place TINYINT,
   isTextLeft BOOLEAN,
   isTextRight BOOLEAN,
   isImageLeft BOOLEAN,
   isImageRight BOOLEAN,
   isAttachement BOOLEAN,
   PRIMARY KEY(id_templates)
);

CREATE TABLE users(
   id_users INT AUTO_INCREMENT,
   username VARCHAR(50),
   email VARCHAR(50),
   hashpassword VARCHAR(265),
   isActivated BOOLEAN,
   id_permissions INT NOT NULL,
   PRIMARY KEY(id_users),
   FOREIGN KEY(id_permissions) REFERENCES permissions(id_permissions)
);

CREATE TABLE articles(
   id_articles INT AUTO_INCREMENT,
   title VARCHAR(128),
   author VARCHAR(50),
   creation_date DATE,
   description VARCHAR(128),
   cover VARCHAR(128),
   id_users INT NOT NULL,
   PRIMARY KEY(id_articles),
   FOREIGN KEY(id_users) REFERENCES users(id_users)
);

CREATE TABLE to_have(
   id_articles INT,
   id_tags INT,
   PRIMARY KEY(id_articles, id_tags),
   FOREIGN KEY(id_articles) REFERENCES articles(id_articles),
   FOREIGN KEY(id_tags) REFERENCES tags(id_tags)
);

CREATE TABLE to_contain(
   id_contents INT,
   id_images INT,
   PRIMARY KEY(id_contents, id_images),
   FOREIGN KEY(id_contents) REFERENCES contents(id_contents),
   FOREIGN KEY(id_images) REFERENCES images(id_images)
);

CREATE TABLE to_use(
   id_articles INT,
   id_contents INT,
   PRIMARY KEY(id_articles, id_contents),
   FOREIGN KEY(id_articles) REFERENCES articles(id_articles),
   FOREIGN KEY(id_contents) REFERENCES contents(id_contents)
);

CREATE TABLE to_herite(
   id_contents INT,
   id_templates INT,
   PRIMARY KEY(id_contents, id_templates),
   FOREIGN KEY(id_contents) REFERENCES contents(id_contents),
   FOREIGN KEY(id_templates) REFERENCES templates(id_templates)
);
