/*Započeo Skyrim nedavno po tko zna koji put
  pa reko, why not...
 */

#setting up our database
drop database if exists skyrim_war;

CREATE DATABASE  skyrim_war
    CHARACTER SET utf8mb4
        COLLATE utf8mb4_unicode_ci;

use skyrim_war;


/*
 Creating tables and inserting rows into them:
 */
CREATE TABLE faction
(
    id int not null primary key auto_increment,
    name varchar(255),
    leader int not null
);

INSERT INTO faction
    (name, leader)
VALUES ('Empire', 1),
       ('Stormcloaks', 2),
       ('Thalmor', 3);


CREATE TABLE battle
(
    id int not null primary key auto_increment,
    name varchar(255),
    event_time datetime,
    completed tinyint,
    description text
);

INSERT INTO battle
    (name, event_time, completed,  description)
VALUES ('The Great War', '1171-04-27', 0, 'The Thalmor suprised the empire yada yada...'),
       ('Markarth Incident', '1173-07-13', 0, 'Ulfric yeeted the savages off some walls or something.'),
       ('Capture of Ulfric', '1200-12-25', 0, 'Gotem. Oh, and Dragoborn comes!'),
       ('Battle for Whiterun', '1201-03-01', 0, 'Lorem ipsum dolor sit amet etc.'),
       ('Battle for the Rift', '1201-05-13', 0, 'Lorem ipsum dolor sit amet etc.'),
       ('Battle for the Pale', '1201-07-15', 0, 'Lorem ipsum dolor sit amet etc.'),
       ('Battle for Windhelm', '1202-01-01', 0, 'Lorem ipsum dolor sit amet etc.');


CREATE TABLE soldier
(
    id int not null primary key auto_increment,
    name varchar(255),
    title varchar(255),
    faction int,
    age int,
    height float,
    active tinyint,
    foreign key (faction)
        references faction (id)
);

INSERT INTO soldier
    (name, title, faction, age, height, active)
VALUES ('Tullius', 'General', 1, 59, 175.5, 1),
       ('Ulfric', 'General', 2,  47, 186.3, 1),
       ('Elenwen', 'General', 3, 673, 199, 1),
       ('Bleiz', 'Legate', 1, 37, 175.5, 1),
       ('Kaire', 'Legate', 3,  145, 175.5, 1),
       ('Ralof', 'Private', 2, 32, 175.5, 1),
       ('Hadvar', 'Private', 1, 34, 175.5, 1),
       ('Rikke', 'Legate', 1,  54, 175.5, 1),
       ('Galmar', 'Legate', 2, 57, 175.5, 1),
       ('Olfrid', 'Supporter', 1, 82, 175.5, 1),
       ('Vignar', 'Supporter', 2,  84, 175.5, 1),
       ('Thorald', 'Auxiliary', 2, 47, 175.5, 1),
       ('Eorlund', 'Supporter', 2, 65, 175.5, 1),
       ('Ondolemar', 'Legate', 3, 170, 204.3, 1),
       ('Ancano', 'Agent', 3,  325, 175.5, 1),
       ('Hjedu', 'Auxiliary', 1, 29, 175.5, 1),
       ('Kurchina', 'Agent', 1,  420, 69, 1),
       ('Kyrnold', 'Agent', 2, 23, 175.5, 1),
       ('Vinyald', 'Auxiliary', 2, 19, 175.5, 1),
       ('Vanabhi', 'Auxiliary', 3, 156, 175.5, 1);


CREATE TABLE weapon
(
    id int not null primary key auto_increment,
    name varchar(255),
    type varchar(255)
);

INSERT INTO weapon
    (name, type)
VALUES ('Iron piercer', 'Sword'),
       ('Iron cutter', 'Axe'),
       ('Iron smasher', 'Mace'),
       ('Steel poker', 'Sword'),
       ('Steel blood-letter', 'Axe'),
       ('Steel crusher', 'Mace'),
       ('Elven grace', 'Sword'),
       ('Elven swiftness', 'Axe'),
       ('Elven might', 'Mace');


CREATE TABLE magic
(
    id int not null primary key auto_increment,
    name varchar(255),
    school varchar(255),
    lethal tinyint
);

INSERT INTO magic
(name, school, lethal)
VALUES ('Flame', 'Destruction' , 1),
       ('Frost', 'Destruction' , 1),
       ('Spark', 'Destruction' , 1),
       ('Heal', 'Restoration' , 0),
       ('Stoneflesh', 'Alteration' , 0),
       ('Candlelight', 'Alteration' , 0),
       ('Rally', 'Illusion' , 0),
       ('Summon', 'Conjuration' , 1),
       ('Unrelenting force', 'Thu''um', 0),
       ('Fire breath', 'Thu''um', 1);



CREATE TABLE soldier_weapon_magic
(
    soldier int,
    weapon int,
    magic int,
    foreign key (soldier)
        references soldier(id),
    foreign key (weapon)
        references weapon(id),
    foreign key (magic)
        references magic(id)
);

INSERT INTO soldier_weapon_magic
    (soldier, weapon, magic)
VALUES (1, 4, null),
       (2, 2, 9),
       (2, null, 10),
       (3, 7, 1),
       (3, null, 7),
       (4, 7, 9),
       (5, 4, 10),
       (6, 5, null),
       (7, 2, 2),
       (8, 9, 3),
       (9, 8, 4),
       (10, 9, 5),
       (11, 9, 5),
       (12, 1, 6),
       (13, 3, 6),
       (14, 6, 7),
       (15, 5, 7),
       (16, 4, 8),
       (17, 3, 8),
       (18, 4, 3),
       (19, 4, 2),
       (20, 4, 1);

CREATE TABLE battle_fought
(
    id int not null primary key auto_increment,
    soldier int not null,
    battle int not null
);

INSERT INTO battle_fought
(soldier, battle)
VALUES (1, 1),
       (1, 3),
       (1, 7),
       (2, 1),
       (2, 2),
       (2, 7),
       (3, 1),
       (4, 3),
       (5, 4),
       (6, 5),
       (7, 6),
       (8, 7),
       (9, 3),
       (10, 4),
       (11, 5);


/*
Update section:
 */
UPDATE battle
SET description = 'It was horrible.'
WHERE id = 1;

SELECT * FROM battle
WHERE id = 1;


UPDATE magic
SET lethal = 1
WHERE name = 'Unrelenting force';

select name, lethal FROM magic
WHERE name = 'Unrelenting force';


UPDATE battle_fought bf
LEFT JOIN soldier s ON bf.soldier = s.id
SET bf.battle = 4
WHERE s.name = 'Galmar';

SELECT s.name, bf.battle FROM battle_fought bf
LEFT JOIN soldier s on bf.soldier = s.id
WHERE s.name = 'Galmar';


UPDATE soldier s
LEFT JOIN faction f on s.faction = f.id
SET s.active = 0
WHERE f.name = 'Thalmor';

SELECT * FROM soldier s
LEFT JOIN faction f on s.faction = f.id
WHERE f.name = 'Thalmor';


UPDATE soldier_weapon_magic swm
INNER JOIN soldier s on swm.soldier = s.id
    INNER JOIN weapon w on swm.weapon = w.id
        INNER JOIN magic m on swm.magic = m.id
SET w.name = 'Steel cracker'
WHERE s.name = 'Kaire';


/*
 Selector section with a few built-in functions in use:
 */
#basic select query that I was using to help myself
SELECT * FROM soldier;

#select all swords
SELECT * FROM weapon
WHERE type = 'Sword';

#select only faction generals
SELECT * FROM soldier
WHERE title = 'General';

#using order by and desc for logical sorting purposes
SELECT name, age FROM soldier
ORDER BY age DESC ;

#only non-lethal spells
SELECT name, school FROM magic
WHERE lethal = false;

#queries only soldiers that fight for the Empire
SELECT * FROM soldier s
INNER JOIN faction f ON s.faction = f.id
WHERE f.name = 'Empire';

#using this built-in function, we count how many soldier rows we have
SELECT COUNT(id) FROM soldier;

#number of weapons that the Thalmor faction are using
SELECT COUNT(weapon) FROM soldier_weapon_magic swm
LEFT JOIN soldier s ON s.id = swm.soldier
INNER JOIN faction f ON f.id = s.faction
WHERE f.name = 'Thalmor';

#highest soldier
SELECT MAX(height) FROM soldier;

#function LENGTH returns the length from our string in the description row
SELECT LENGTH(description) FROM battle
WHERE id = 1;

#using the UCASE function + finding all Thalmor who fought in any battles
SELECT UCASE(s.name) FROM battle_fought bf
INNER JOIN soldier s on bf.soldier = s.id
INNER JOIN faction f on s.faction = f.id
WHERE f.name = 'Thalmor';


/*Trigger section:
  this trigger starts after updating the battle table
  it updates the soldier table where the faction is set to 'Stormcloak'
  which means they lost and are not active anymore
 */
CREATE TRIGGER soldier_after_war
    AFTER UPDATE ON battle
    FOR EACH ROW
    BEGIN
        UPDATE soldier SET active = 0
            WHERE faction = 2;
    END;

SHOW TRIGGERS;

#tripping the trigger
UPDATE battle SET completed = 1
WHERE name = 'Battle for Windhelm';

#proving that the trigger works + usage of the CONCAT function
SELECT (CONCAT(s.name, f.name)), s.active FROM soldier s
INNER JOIN faction f on s.faction = f.id
WHERE active = 0;


/*
 Delete section:
 */
DELETE FROM battle
WHERE id = 5;

DELETE FROM soldier
WHERE name = 'Vanahbi';

DELETE FROM battle
WHERE id IN (3,5);

DELETE FROM soldier_weapon_magic
WHERE soldier =  1;

#playing around
DELETE LOW_PRIORITY QUICK FROM battle
WHERE id<=3
ORDER BY name asc;
