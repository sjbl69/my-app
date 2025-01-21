-- Active: 1737212393138@@127.0.0.1@3306@pharmacie
DROP TABLE IF EXISTS mouvement;
DROP TABLE IF EXISTS details_commande;
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS utilisateur;
DROP TABLE IF EXISTS role;
CREATE TABLE role (
    id_role INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50)
);
CREATE TABLE utilisateur (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    mot_de_passe VARCHAR(255),
    id_role INT,
    FOREIGN KEY (id_role) REFERENCES role(id_role)
);
CREATE TABLE stock (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
    image TEXT,
    description VARCHAR(255),
    quantite_disponible INT,
    type ENUM('medicament', 'materiel')
);
CREATE TABLE commande (
    id_commande INT PRIMARY KEY AUTO_INCREMENT,
    id_utilisateur INT,
    date_commande DATETIME DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('en_attente', 'validee', 'invalidée') DEFAULT 'en_attente',
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
);
CREATE TABLE details_commande (
    id_commande INT,
    id_stock INT,
    quantite INT,
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande),
    FOREIGN KEY (id_stock) REFERENCES stock(id_stock),
    PRIMARY KEY (id_commande, id_stock)
);
CREATE TABLE mouvement (
    id_mouvement INT PRIMARY KEY AUTO_INCREMENT,
    id_stock INT,
    type_mouvement ENUM('entree', 'sortie'),
    quantite INT,
    date_mouvement DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_commande INT,
    FOREIGN KEY (id_stock) REFERENCES stock(id_stock),
    FOREIGN KEY (id_commande) REFERENCES commande(id_commande)
);
INSERT INTO stock (nom, image, description, quantite_disponible, type) VALUES 
('Aspirine', 'https://www.pharmashopi.com/images/Image/aspirine-du-rhone-50-comprimes-1373457503.png', 'Médicament contre les douleurs', 50, 'medicament'),
('Gants chirurgicaux', 'https://www.pharmashopi.com/images/Image/aspirine-du-rhone-50-comprimes-1373457503.png', 'Médicament contre les douleurs', 50, 'materiel'),
('efferalgan', 'https://www.pharmashopi.com/images/Image/aspirine-du-rhone-50-comprimes-1373457503.png', 'Médicament contre les douleurs', 100, 'medicament'),
('doliprane', 'https://www.pharmashopi.com/images/Image/aspirine-du-rhone-50-comprimes-1373457503.png', 'Médicament contre les douleurs', 150, 'medicament'),
('doliprane', 'https://www.pharmashopi.com/images/Image/aspirine-du-rhone-50-comprimes-1373457503.png', 'Médicament contre les douleurs', 200, 'medicament'),
('avil', 'https://www.pharmashopi.com/images/Image/aspirine-du-rhone-50-comprimes-1373457503.png', 'Médicament contre les douleurs', 300, 'medicament');