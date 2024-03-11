/*table band*/
CREATE TABLE band (
    bandName varchar(50),
    creation YEAR,
    genre varchar(50),
    PRIMARY KEY(bandName));

INSERT INTO band (bandName, creation, genre)
VALUES ('Crazy Duo', 2015, 'rock'),
       ('Luna', 2009, 'classical'),
       ('Mysterio', 2019, 'pop');


/*Table singer*/
ALTER TABLE singer
    RENAME TO musician,
    CHANGE singerName musicianName varchar(50);

ALTER TABLE musician
    ADD role varchar(50),
    ADD bandName varchar(50);

CREATE TEMPORARY TABLE musician_join
    (musicianName varchar(50),
     role varchar(50),
     bandName varchar(50),
    PRIMARY KEY (musicianName));

INSERT INTO musician_join (musicianName, role, bandName)
    VALUES
        ('Alina', 'vocals', 'Crazy Duo'),
        ('Mysterio', 'guitar', 'Mysterio'),
        ('Rainbow', 'percussion', 'Crazy Duo'),
        ('Luna', 'piano', 'Luna');

UPDATE musician, musician_join
    SET
        musician.role=musician_join.role,
        musician.bandName=musician_join.bandName
    WHERE
        musician.musicianName = musician_join.musicianName;

DROP TABLE musician_join;