INSERT INTO "Decks"
VALUES
(0, 'White', 'W'),
(1, 'Blue', 'U'),
(2, 'Black', 'B'),
(3, 'Red', 'R'),
(4, 'Green', 'G'),
(5, 'Colorless', 'No colors'),
(6, 'Azorius', 'White + Blue'),
(7, 'Dimir', 'Blue + Black'),
(8, 'Rakdos', 'Black + Red'),
(9, 'Gruul', 'Red + Green'),
(10, 'Selesnya', 'Green + White'),
(11, 'Orzhov', 'White + Black'),
(12, 'Izzet', 'Blue + Red'),
(13, 'Golgari', 'Black + Green'),
(14, 'Boros', 'Red + White'),
(15, 'Simic', 'Green + Blue'),
(16, 'Jund', 'Red + Green + Black'),
(17, 'Bant', 'White + Green + Blue'),
(18, 'Grixis', 'Black + Red + Blue'),
(19, 'Naya', 'Green + White + Red'),
(20, 'Esper', 'Blue + White + Black'),
(21, 'Jeskai', 'Blue + Red + White'),
(22, 'Mardu', 'Red + White + Black'),
(23, 'Sultai', 'Black + Green + Blue'),
(24, 'Temur', 'Green + Blue + Red'),
(25, 'Abzan', 'White + Black + Green'),
(26, 'Artifice', 'All but green'),
(27, 'Chaos', 'All but white'),
(28, 'Aggression', 'All but blue'),
(29, 'Altruism', 'All but black'),
(30, 'Growth', 'All but red'),
(31, 'WUBRG', 'All the colors');

INSERT INTO "Federations"
VALUES
(0, 'Default', '2016-01-01', 'Default value'),
(1, 'Centro', '2016-01-01', 'La federacion del centro'),
(2, 'Echesortu', '2016-01-01', 'La agrupacion barrial');

INSERT INTO "Players"
VALUES
(0, 'Agus', '2017-01-01', '2'),
(1, 'Chala', '2018-01-01', '2'),
(2, 'Coco', '2017-01-01', '2'),
(3, 'Colo', '2018-01-01', '2'),
(4, 'Cristian', '2016-01-01', '2'),
(5, 'Cronos', '2016-01-01', '1'),
(6, 'Fakman', '2016-01-01', '1'),
(7, 'Fefo', '2017-01-01', '1'),
(8, 'German', '2016-01-01', '1'),
(9, 'Hot dog little', '2017-01-01', '2'),
(10, 'Lean', '2017-01-01', '2'),
(11, 'Leo', '2016-01-01', '1'),
(12, 'Rama', '2016-01-01', '1'),
(13, 'Santi', '2017-01-01', '2'),
(14, 'Sapo', '2016-01-01', '2'),
(15, 'Seba', '2016-01-01', '1'),
(16, 'Skiki', '2016-01-01', '1'),
(17, 'Yankee', '2016-01-01', '1');

INSERT INTO "Seasons"
VALUES
(0, '2016-01-01', '2016-12-31', true, 'Test2016'),
(1, '2017-01-01', '2017-12-31', true, 'Test2017'),
(2, '2018-01-01', null, false, 'Test2018');

INSERT INTO "Tournaments"
VALUES
(0, 0, 'standard', '-', '2016-02-02', null, true, true, 4),
(1, 0, 'standard', '-', '2016-04-04', null, true, true, 0),
(2, 0, 'standard', '-', '2016-06-06', null, true, true, 15),
(3, 1, 'standard', '-', '2017-07-07', '2017 season opening', true, true, 7),
(4, 1, 'standard', '-', '2017-09-09', null, true, true, 13),
(5, 2, 'standard', '-', '2018-12-12', 'Unique 2018 in course', true, false, NULL);

INSERT INTO "Matches"
VALUES
(0, 4, 3, 3, 15, 19, 0, false, 0, 0),
(1, 15, 19, 3, 14, 7, 0, false, 0, 0),
(2, 14, 7, 1, 5, 26, 1, false, 0, 0),
(3, 5, 26, 0, 16, 11, 3, false, 0, 0),
(4, 4, 3, 3, 14, 7, 0, false, 0, 0),
(5, 15, 19, 3, 5, 26, 0, false, 0, 0),
(6, 14, 7, 3, 16, 11, 0, false, 0, 0),
(7, 4, 3, 0, 5, 26, 3, false, 0, 0),
(8, 15, 19, 3, 16, 11, 0, false, 0, 0),
(9, 4, 3, 1, 16, 11, 1, false, 0, 0),
(10, 4, 3, 3, 15, 19, 0, true, 0, 0),
(11, 6, 9, 3, 10, 24, 0, false, 0, 1),
(12, 10, 24, 0, 7, 10, 3, false, 0, 1),
(13, 7, 10, 3, 5, 6, 0, false, 0, 1),
(14, 0, 21, 3, 10, 24, 0, false, 0, 1),
(15, 6, 9, 0, 7, 10, 3, false, 0, 1),
(16, 10, 24, 3, 5, 6, 0, false, 0, 1),
(17, 0, 21, 3, 7, 10, 0, false, 0, 1),
(18, 6, 9, 3, 5, 6, 0, false, 0, 1),
(19, 0, 21, 3, 5, 6, 0, false, 0, 1),
(20, 0, 21, 3, 6, 9, 0, true, 0, 1),
(21, 15, 13, 3, 3, 8, 0, false, 0, 2),
(22, 3, 8, 0, 9, 31, 0, false, 0, 2),
(23, 9, 31, 0, 8, 23, 3, false, 0, 2),
(24, 15, 13, 3, 9, 31, 0, false, 0, 2),
(25, 3, 8, 3, 8, 23, 0, false, 0, 2),
(26, 15, 13, 3, 8, 23, 0, true, 0, 2),
(27, 10, 2, 1, 13, 12, 1, false, 1, 3),
(28, 13, 12, 0, 7, 6, 3, false, 1, 3),
(29, 7, 6, 3, 0, 22, 0, false, 1, 3),
(30, 10, 2, 0, 7, 6, 3, false, 1, 3),
(31, 13, 12, 0, 0, 22, 3, false, 1, 3),
(32, 7, 6, 3, 0, 22, 0, true, 1, 3),
(33, 13, 18, 3, 16, 20, 0, false, 1, 4),
(34, 16, 20, 3, 5, 31, 0, false, 1, 4),
(35, 13, 18, 3, 5, 31, 0, true, 1, 4),
(36, 1, 19, 3, 7, 12, 0, false, 2, 5),
(37, 7, 12, 0, 5, 22, 3, false, 2, 5),
(38, 5, 22, 3, 10, 15, 0, false, 2, 5);
