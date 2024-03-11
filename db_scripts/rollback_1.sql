ALTER TABLE musician
    DROP COLUMN role,
    DROP COLUMN bandName,
    RENAME TO singer;

ALTER TABLE singer
    CHANGE musicianName singerName varchar(50);

DROP TABLE band;