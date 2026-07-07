-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 07-Jul-2026 às 11:04
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `anime`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `animediretor`
--

CREATE TABLE `animediretor` (
  `idAnime` int(11) NOT NULL,
  `idDiretor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animediretor`
--

INSERT INTO `animediretor` (`idAnime`, `idDiretor`) VALUES
(4, 1),
(5, 2),
(5, 3),
(6, 4),
(59, 5),
(60, 6),
(61, 7),
(62, 8),
(62, 9),
(63, 10),
(64, 2),
(64, 11),
(65, 12),
(66, 71),
(67, 13),
(68, 14),
(68, 15),
(69, 16),
(70, 17),
(71, 18),
(72, 19),
(73, 20),
(74, 21),
(75, 22),
(76, 23),
(77, 24),
(78, 25),
(79, 26),
(80, 27),
(80, 28),
(81, 29),
(82, 10),
(83, 30),
(84, 10),
(85, 31),
(86, 32),
(87, 33),
(88, 34),
(89, 35),
(90, 36),
(91, 34),
(92, 72),
(93, 20),
(94, 78),
(95, 79),
(96, 80),
(97, 81),
(98, 82),
(99, 83),
(100, 84),
(101, 101),
(102, 85),
(103, 86),
(104, 87),
(105, 88),
(106, 73),
(107, 89),
(108, 90),
(109, 91),
(110, 92),
(111, 93),
(112, 94),
(113, 95),
(114, 96),
(115, 99),
(116, 97),
(117, 98),
(118, 99),
(119, 100),
(120, 84),
(121, 101),
(122, 102),
(123, 26),
(124, 30),
(125, 103),
(126, 76),
(127, 96),
(128, 104),
(129, 73),
(130, 77),
(131, 105),
(132, 106),
(133, 107),
(134, 108),
(135, 6),
(136, 109),
(137, 13),
(138, 110),
(139, 111),
(140, 34),
(141, 18),
(142, 112),
(143, 113),
(144, 99),
(145, 74),
(146, 114),
(147, 5),
(148, 115),
(149, 116),
(150, 76),
(151, 75),
(152, 29),
(153, 117),
(154, 92),
(155, 75);

-- --------------------------------------------------------

--
-- Estrutura da tabela `animeestudios`
--

CREATE TABLE `animeestudios` (
  `estudio` varchar(100) NOT NULL,
  `IdAnime` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animeestudios`
--

INSERT INTO `animeestudios` (`estudio`, `IdAnime`) VALUES
('Bones', 4),
('Toei Animation', 5),
('Tatsunoko Production', 6),
('Madhouse', 59),
('Studio Pierrot', 60),
('Studio Pierrot', 61),
('Toei Animation', 62),
('Studio Gallop', 63),
('Studio Deen', 63),
('Toei Animation', 64),
('Studio Deen', 65),
('J.C.Staff', 66),
('Madhouse', 67),
('TMS Entertainment', 68),
('TMS Entertainment', 69),
('Toei Animation', 70),
('Brain\'s Base', 71),
('Studio Shuka', 71),
('Sunrise (Bandai Namco Filmworks)', 72),
('Madhouse', 73),
('Sunrise (Bandai Namco Filmworks)', 74),
('Sunrise (Bandai Namco Filmworks)', 75),
('A-1 Pictures', 76),
('MAPPA', 77),
('OLM', 78),
('TOHO animation', 78),
('Madhouse', 79),
('MAPPA', 80),
('Madhouse', 81),
('MAPPA', 82),
('Tezuka Productions', 82),
('Arms', 83),
('Wit Studio', 84),
('CloverWorks', 84),
('P.A. Works', 85),
('CloverWorks', 86),
('MAPPA', 87),
('Bones', 88),
('A-1 Pictures', 89),
('Studio VOLN', 89),
('J.C.Staff', 90),
('MAPPA', 91),
('Science SARU', 92),
('Wit Studio', 93),
('MAPPA', 93),
('Bones', 94),
('ufotable', 95),
('Madhouse', 96),
('White Fox', 97),
('Studio Pierrot', 98),
('Madhouse', 99),
('J.C.Staff', 99),
('A-1 Pictures', 100),
('Production I.G', 101),
('Madhouse', 102),
('A-1 Pictures', 103),
('Bones', 104),
('White Fox', 105),
('Sunrise (Bandai Namco Filmworks)', 106),
('Wit Studio', 107),
('MAPPA', 107),
('A-1 Pictures', 108),
('Studio Deen', 109),
('Sunrise (Bandai Namco Filmworks)', 110),
('A-1 Pictures', 111),
('Satelight', 111),
('Studio Pierrot', 112),
('David Production', 113),
('Brain\'s Base', 114),
('Gainax', 115),
('ufotable', 116),
('Production I.G', 117),
('Trigger', 118),
('Madhouse', 119),
('A-1 Pictures', 120),
('White Fox', 121),
('Kyoto Animation', 122),
('Kinema Citrus', 123),
('CloverWorks', 124),
('J.C.Staff', 125),
('Kyoto Animation', 126),
('P.A. Works', 127),
('Madhouse', 128),
('Manglobe', 129),
('Madhouse', 130),
('Gainax', 131),
('Production I.G', 131),
('Artland', 132),
('Toei Animation', 133),
('Sunrise (Bandai Namco Filmworks)', 134),
('Studio Pierrot', 135),
('Bones', 136),
('Madhouse', 137),
('TMS Entertainment', 138),
('Production I.G', 139),
('Kyoto Animation', 140),
('Brain\'s Base', 141),
('Production I.G', 142),
('Doga Kobo', 143),
('Trigger', 144),
('Science SARU', 145),
('Studio Pierrot', 146),
('Madhouse', 147),
('Studio Bind', 148),
('Kyoto Animation', 149),
('Kyoto Animation', 150),
('Shaft', 151),
('CloverWorks', 152),
('8bit', 153),
('Zero-G', 154),
('Shaft', 155),
('Toei Animation', 133),
('Sunrise (Bandai Namco Filmworks)', 134),
('Studio Pierrot', 135),
('Bones', 136),
('Madhouse', 137),
('TMS Entertainment', 138),
('Production I.G', 139),
('Kyoto Animation', 140),
('Brain\'s Base', 141),
('Production I.G', 142),
('Doga Kobo', 143),
('Trigger', 144),
('Science SARU', 145),
('Studio Pierrot', 146),
('Madhouse', 147),
('Studio Bind', 148),
('Kyoto Animation', 149),
('Kyoto Animation', 150),
('Shaft', 151),
('CloverWorks', 152),
('8bit', 153),
('Zero-G', 154),
('Shaft', 155);

-- --------------------------------------------------------

--
-- Estrutura da tabela `animegeneros`
--

CREATE TABLE `animegeneros` (
  `IdAnime` int(11) NOT NULL,
  `IdGenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `animegeneros`
--

INSERT INTO `animegeneros` (`IdAnime`, `IdGenero`) VALUES
(4, 1),
(4, 2),
(4, 4),
(4, 15),
(5, 15),
(5, 5),
(6, 16),
(6, 4),
(59, 1),
(59, 16),
(59, 6),
(60, 1),
(60, 14),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(62, 15),
(63, 1),
(63, 5),
(64, 15),
(64, 6),
(65, 13),
(65, 4),
(66, 15),
(66, 1),
(67, 15),
(67, 6),
(67, 5),
(68, 1),
(68, 14),
(68, 15),
(69, 16),
(69, 2),
(70, 1),
(70, 3),
(70, 19),
(71, 1),
(71, 12),
(71, 14),
(71, 11),
(72, 16),
(72, 4),
(73, 11),
(73, 12),
(73, 14),
(74, 15),
(74, 16),
(74, 5),
(74, 2),
(75, 1),
(75, 16),
(75, 5),
(76, 16),
(76, 4),
(77, 1),
(77, 14),
(77, 13),
(77, 15),
(78, 12),
(78, 4),
(78, 6),
(79, 11),
(79, 12),
(79, 4),
(80, 1),
(80, 14),
(80, 15),
(81, 15),
(81, 2),
(81, 7),
(81, 4),
(82, 1),
(82, 14),
(82, 15),
(83, 13),
(83, 16),
(83, 4),
(83, 5),
(84, 6),
(84, 1),
(84, 7),
(85, 13),
(85, 12),
(85, 11),
(85, 14),
(86, 4),
(86, 15),
(86, 12),
(87, 3),
(87, 4),
(87, 9),
(88, 3),
(88, 1),
(88, 6),
(89, 1),
(89, 14),
(89, 15),
(90, 6),
(91, 1),
(91, 11),
(91, 4),
(92, 1),
(92, 14),
(92, 6),
(92, 16),
(92, 5),
(93, 1),
(93, 4),
(93, 11),
(94, 1),
(94, 6),
(95, 1),
(95, 14),
(95, 15),
(96, 1),
(96, 2),
(96, 15),
(97, 11),
(97, 16),
(97, 4),
(98, 1),
(98, 13),
(98, 14),
(99, 1),
(99, 6),
(100, 1),
(100, 2),
(100, 5),
(100, 15),
(101, 3),
(101, 6),
(102, 6),
(102, 15),
(103, 4),
(103, 5),
(104, 1),
(104, 6),
(104, 14),
(105, 4),
(105, 11),
(105, 15),
(106, 1),
(106, 16),
(106, 4),
(107, 1),
(107, 2),
(107, 4),
(108, 6),
(108, 5),
(109, 2),
(109, 6),
(109, 15),
(110, 1),
(110, 6),
(110, 16),
(111, 1),
(111, 2),
(111, 15),
(112, 1),
(112, 6),
(112, 15),
(113, 1),
(113, 2),
(113, 14),
(114, 1),
(114, 6),
(115, 1),
(115, 16),
(116, 1),
(116, 14),
(116, 15),
(117, 1),
(117, 11),
(117, 16),
(118, 1),
(118, 6),
(119, 1),
(119, 13),
(119, 16),
(120, 11),
(120, 12),
(120, 14),
(121, 1),
(121, 15),
(122, 4),
(122, 15),
(123, 2),
(123, 4),
(123, 15),
(124, 11),
(124, 12),
(124, 16),
(125, 4),
(125, 5),
(125, 6),
(126, 4),
(126, 5),
(126, 7),
(127, 4),
(127, 6),
(127, 14),
(128, 1),
(128, 13),
(128, 14),
(129, 1),
(129, 2),
(129, 6),
(130, 1),
(130, 4),
(131, 1),
(131, 6),
(131, 16),
(132, 2),
(132, 12),
(132, 14),
(133, 1),
(133, 2),
(133, 15),
(134, 1),
(134, 2),
(134, 5),
(134, 14),
(135, 1),
(135, 6),
(135, 14),
(136, 6),
(136, 5),
(136, 7),
(137, 4),
(137, 5),
(137, 7),
(138, 4),
(138, 5),
(138, 14),
(139, 3),
(139, 6),
(140, 3),
(140, 7),
(141, 1),
(141, 12),
(141, 14),
(142, 2),
(142, 12),
(142, 16),
(143, 4),
(143, 12),
(143, 14),
(144, 1),
(144, 4),
(144, 16),
(145, 1),
(145, 13),
(145, 14),
(146, 6),
(146, 4),
(146, 7),
(147, 3),
(147, 6),
(147, 4),
(148, 2),
(148, 4),
(148, 15),
(149, 6),
(149, 7),
(150, 6),
(150, 12),
(150, 16),
(151, 12),
(151, 5),
(151, 14),
(152, 6),
(152, 7),
(153, 3),
(153, 1),
(153, 4),
(154, 6),
(154, 7),
(155, 4),
(155, 11),
(155, 12),
(155, 15),
(133, 1),
(133, 2),
(133, 15),
(134, 1),
(134, 2),
(134, 5),
(134, 14),
(135, 1),
(135, 6),
(135, 14),
(136, 6),
(136, 5),
(136, 7),
(137, 4),
(137, 5),
(137, 7),
(138, 4),
(138, 5),
(138, 14),
(139, 3),
(139, 6),
(140, 3),
(140, 7),
(141, 1),
(141, 12),
(141, 14),
(142, 2),
(142, 12),
(142, 16),
(143, 4),
(143, 12),
(143, 14),
(144, 1),
(144, 4),
(144, 16),
(145, 1),
(145, 13),
(145, 14),
(146, 6),
(146, 4),
(146, 7),
(147, 3),
(147, 6),
(147, 4),
(148, 2),
(148, 4),
(148, 15),
(149, 6),
(149, 7),
(150, 6),
(150, 12),
(150, 16),
(151, 12),
(151, 5),
(151, 14),
(152, 6),
(152, 7),
(153, 3),
(153, 1),
(153, 4),
(154, 6),
(154, 7),
(155, 4),
(155, 11),
(155, 12),
(155, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `animes`
--

CREATE TABLE `animes` (
  `IdAnime` int(11) NOT NULL,
  `Titulo` varchar(200) NOT NULL,
  `Descricao` text NOT NULL,
  `AnoEmissao` int(11) NOT NULL,
  `anoFim` int(4) DEFAULT NULL,
  `Temporada` int(11) NOT NULL,
  `Season` enum('Fall','Winter','Summer','Spring') NOT NULL,
  `Classificacao` decimal(3,0) NOT NULL,
  `ClassificacaoEtaria` enum('Maior de 3','Maior de 6','Maior de 12','Maior de 18','Todos','Maior de 16','Maior de 13') NOT NULL,
  `BaseadoEm` enum('Visual Novel','Manga','Light Novel','Original') NOT NULL,
  `NumeroEpisodio` int(11) NOT NULL,
  `Estado` enum('Em exibição','Terminado','Cancelado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animes`
--

INSERT INTO `animes` (`IdAnime`, `Titulo`, `Descricao`, `AnoEmissao`, `anoFim`, `Temporada`, `Season`, `Classificacao`, `ClassificacaoEtaria`, `BaseadoEm`, `NumeroEpisodio`, `Estado`) VALUES
(4, 'Fullmetal Alchemist: Brotherhood', 'Dois irmãos usam a alquimia proibida para tentar ressuscitar a mãe. Edward perde um braço e uma perna, e Alphonse perde o corpo todo. Eles partem em busca da Pedra Filosofal para recuperar o que perderam.', 2009, 2010, 1, 'Spring', 9, 'Maior de 16', 'Manga', 64, 'Terminado'),
(5, 'Bishoujo Senshi Sailor Moon', 'Usagi Tsukino é uma rapariga desajeitada que descobre ser a Sailor Moon, uma guerreira mágica destinada a proteger a Terra e a Lua das forças do mal.', 1992, 1997, 5, 'Spring', 7, 'Maior de 12', 'Manga', 200, 'Terminado'),
(6, 'Neon Genesis Evangelion', 'Numa Terra pós-apocalíptica ameaçada por criaturas chamadas \"Anjos\", adolescentes são recrutados para pilotar robôs gigantes biológicos conhecidos como EVAs.', 1995, 1996, 1, 'Fall', 8, 'Maior de 16', 'Original', 26, 'Terminado'),
(59, 'Trigun', 'Vash the Stampede é um pistoleiro lendário com uma recompensa enorme pela cabeça, mas ele é secretamente um pacifista convicto que recusa matar.', 1998, 1998, 1, 'Spring', 8, 'Maior de 13', 'Manga', 26, 'Terminado'),
(60, 'Bleach', 'Ichigo Kurosaki consegue ver fantasmas e acaba por absorver os poderes de uma Shinigami (Rukia), assumindo o dever de proteger as almas e combater os monstros \"Hollows\".', 2004, 2012, 1, 'Fall', 8, 'Maior de 13', 'Manga', 366, 'Terminado'),
(61, 'Naruto', 'Naruto Uzumaki é um jovem ninja órfão que carrega um demónio selado em si. Rejeitado por todos, ele treina para se tornar o líder da sua vila (Hokage) e ganhar o respeito do mundo.', 2002, 2007, 2, 'Fall', 8, 'Maior de 12', 'Manga', 720, 'Terminado'),
(62, 'One Piece', 'Monkey D. Luffy ganha um corpo de borracha após comer um Fruto do Diabo. Ele reúne uma tripulação de piratas e navega pelos mares mais perigosos do mundo para encontrar o tesouro lendário e tornar-se o Rei dos Piratas.', 1999, NULL, 1, 'Fall', 8, 'Maior de 12', 'Manga', 1100, 'Em exibição'),
(63, 'Rurouni Kenshin: Meiji Kenkaku Romantan', 'Um ex-assassino lendário vaga pelo Japão com uma espada de lâmina invertida, jurando proteger os inocentes sem tirar a vida a ninguém, tentando redimir-se do seu passado sangrento.', 1996, 1998, 2, 'Winter', 8, 'Maior de 13', 'Manga', 96, 'Terminado'),
(64, 'Ojamajo Doremi', 'Doremi descobre sem querer que a dona de uma loja é uma bruxa e transforma-a num sapo. Para reverter o feitiço, ela e as amigas tornam-se aprendizes de bruxa.', 1999, 2003, 4, 'Winter', 7, 'Todos', 'Original', 214, 'Terminado'),
(65, 'Pupa', 'Uma rapariga infetada por um vírus transforma-se num monstro canibal. O seu irmão mais velho, que tem o poder de regeneração instantânea, deixa que ela se alimente do seu próprio corpo.', 2014, 2014, 1, 'Winter', 3, 'Maior de 18', 'Manga', 12, 'Terminado'),
(66, 'Shinjiteita Nakamatachi ni Danjon Okuchi de Korosareketa ga Gifuto \"Mugen Gacha\" de Reberu 9999 no Nakamatachi o Te ni Ineretemo Moto Pātī Menbā to Sekai ni Fukushū & \"Zamā!\" Shimasu!', 'Traído e quase morto no fundo de uma masmorra pelos seus antigos amigos, Light usa o seu poder único de \"Gacha Infinito\" para invocar companheiros imbatíveis de nível 9999 e executar a sua vingança.', 2025, 2026, 1, 'Spring', 7, 'Maior de 16', 'Light Novel', 12, 'Terminado'),
(67, 'Cardcaptor Sakura', 'Sakura Kinomoto é uma menina de 10 anos que acidentalmente liberta as Cartas Clow, um conjunto de cartas mágicas incrivelmente poderosas. Com a ajuda do guardião Keroberos, ela tem de se tornar uma \"Cardcaptor\" para as recapturar antes que causem o caos.', 1998, 2000, 3, 'Spring', 8, 'Todos', 'Manga', 70, 'Terminado'),
(68, 'D.Gray-man', 'Allen Walker é um jovem Exorcista que carrega uma arma anti-Akuma no seu braço esquerdo. Ele junta-se à Ordem Negra para combater o Millennium Earl, um ser maligno que usa a dor dos vivos para criar monstros chamados \"Akuma\", com o objetivo de destruir o mundo.', 2006, 2016, 2, 'Fall', 8, 'Maior de 13', 'Manga', 116, 'Terminado'),
(69, 'Dr. STONE', 'Toda a humanidade é misteriosamente transformada em pedra por uma luz verde intensa. Milhares de anos depois, o prodígio da ciência Senku Ishigami acorda num mundo onde a civilização ruiu e a natureza retomou o controlo. Ele decide usar o poder da ciência para reconstruir o mundo do zero e salvar a humanidade.', 2019, 2026, 4, 'Summer', 8, 'Maior de 12', 'Manga', 94, 'Terminado'),
(70, 'Air Gear', 'Itsuki \"Ikki\" Minami é um rapaz rebelde que descobre os \"Air Trecks\" (ATs), uns patins em linha motorizados altamente avançados que permitem aos utilizadores saltar edifícios e deslizar pelo ar. Ele cria a sua própria equipa para subir no ranking das violentas guerras de gangues urbanas de ATs.', 2006, 2006, 1, 'Spring', 7, 'Maior de 16', 'Manga', 25, 'Terminado'),
(71, 'Durarara!!', 'Mikado Ryugamine muda-se para o distrito de Ikebukuro, em Tóquio, em busca de uma vida citadina emocionante. O local é o ponto de encontro de gangues de rua violentos, figuras perigosas e uma lenda urbana bizarra: o \"Cavaleiro Sem Cabeça\", que conduz uma mota preta.', 2010, 2016, 4, 'Winter', 8, 'Maior de 13', 'Light Novel', 60, 'Terminado'),
(72, 'Code Geass: Hangyaku no Lelouch', 'O Império de Britannia conquistou o Japão, agora rebatizado de \"Área 11\". Lelouch Lamperouge, um príncipe exilado de Britannia, ganha um poder misterioso chamado \"Geass\", que lhe permite ordenar a qualquer pessoa que faça o que ele quiser. Ele assume a identidade mascarada de \"Zero\" para liderar uma rebelião e destruir o império.', 2006, 2008, 2, 'Fall', 8, 'Maior de 16', 'Original', 50, 'Terminado'),
(73, 'Death Note', 'Light Yagami é um estudante brilhante do liceu que encontra um caderno com poderes sobrenaturais pertencente a um Shinigami (deus da morte). Qualquer pessoa cujo nome seja escrito no caderno morre. Light decide usar o caderno para erradicar todos os criminosos do mundo sob o pseudónimo \"Kira\", gerando um jogo de xadrez psicológico contra \"L\", o maior detetive do mundo.', 2006, 2007, 1, 'Fall', 8, 'Maior de 16', 'Manga', 37, 'Terminado'),
(74, 'Tenkuu no Escaflowne', 'Hitomi Kanzaki é uma estudante comum e atleta que é subitamente transportada para o planeta místico de Gaea. Lá, ela vê-se envolvida numa guerra contra o tirânico Império Zaibach, unindo forças com o jovem rei Van Fanel, que pilota o mecha mecânico/mágico ancestral conhecido como Escaflowne.', 1996, 1996, 1, 'Spring', 7, 'Maior de 12', 'Original', 26, 'Terminado'),
(75, 'Accel World', 'Haruyuki Arita é um rapaz tímido e com excesso de peso que sofre bullying na escola. A sua vida muda quando a popular vice-presidente do conselho estudantil, Kuroyukihime, lhe apresenta o \"Brain Burst\", um programa secreto que acelera as ondas cerebrais humanas e os transporta para um jogo de luta em realidade virtual onde o tempo quase para.', 2012, 2012, 1, 'Spring', 7, 'Maior de 12', 'Light Novel', 24, 'Terminado'),
(76, '86', 'A República de San Magnolia afirma travar uma guerra humanitária contra o Império usando drones autónomos. No entanto, fora das muralhas dos 85 distritos protegidos, existe o Distrito 86, onde jovens cidadãos desumanizados (conhecidos como \"Eighty-Six\") são forçados a pilotar essas máquinas na linha da frente. A história segue a jovem comandante Vladilena Milizé e Shin, o líder do esquadrão Spearhead.', 2021, 2022, 1, 'Spring', 8, 'Maior de 16', 'Light Novel', 23, 'Terminado'),
(77, 'Chainsaw Man', 'Denji é um jovem pobre que vive na miséria profunda para pagar as dívidas do pai à Yakuza, trabalhando como Caçador de Demónios com o seu cão-demónio, Pochita. Após ser traído e assassinado, Pochita funde-se com o coração de Denji, ressuscitando-o como o temível \"Chainsaw Man\" (o Homem-Motosserra), sendo imediatamente recrutado pela Segurança Pública.', 2022, 2022, 1, 'Fall', 8, 'Maior de 18', 'Manga', 12, 'Terminado'),
(78, 'Kusuriya no Hitorigoto', 'Maomao é uma jovem boticária que é raptada e vendida como serva para o Palácio Imperial. Astuta e excêntrica, ela esconde os seus conhecimentos de medicina até descobrir que os filhos gémeos do Imperador estão gravemente doentes. Ao resolver o mistério em segredo, ela chama a atenção do influente e belo eunuco Jinshi, sendo promovida a provadora de venenos oficial da corte.', 2023, 2025, 2, 'Fall', 8, 'Maior de 13', 'Light Novel', 24, 'Terminado'),
(79, 'Monster', 'O Dr. Kenzo Tenma é um cirurgião cerebral japonês brilhante que trabalha na Alemanha Ocidental. Um dia, ele escolhe desobedecer às ordens do diretor do hospital para salvar a vida de um menino baleado na cabeça (Johan) em vez de operar um político influente. Anos mais tarde, Tenma descobre que o rapaz que salvou cresceu e se tornou um assassino psicopata brilhante e implacável, iniciando uma caça ao homem para corrigir o seu erro.', 2004, 2005, 1, 'Spring', 8, 'Maior de 16', 'Manga', 74, 'Terminado'),
(80, 'Jujutsu Kaisen', 'Yuji Itadori é um estudante com capacidades físicas extraordinárias que, para salvar os amigos de uma Maldição, engole o dedo podre de Ryomen Sukuna, o lendário Rei das Maldições. Sobrevivendo e conseguindo partilhar o corpo com ele, Yuji é recrutado pelo feiticeiro mais forte, Satoru Gojo, para se juntar à Escola Técnica de Jujutsu de Tóquio.', 2020, 2026, 3, 'Fall', 8, 'Maior de 16', 'Manga', 47, 'Em exibição'),
(81, 'Sousou no Frieren', 'A história começa onde a maioria dos RPGs acaba: o Rei Demónio foi derrotado e o grupo de heróis regressa a casa. Frieren, uma elfa maga com uma esperança de vida de milhares de anos, vê os seus companheiros humanos envelhecerem e morrerem à sua volta. Arrependida de não ter passado mais tempo a conhecê-los, ela parte numa nova jornada para compreender os sentimentos humanos e colecionar feitiços simples.', 2023, 2024, 1, 'Fall', 9, 'Maior de 12', 'Manga', 28, 'Terminado'),
(82, 'Dororo', 'Um lorde samurai ganancioso faz um pacto com demónios pela prosperidade das suas terras, oferecendo em troca os órgãos e partes do corpo do seu filho recém-nascido. O bebé sobrevive milagrosamente, é salvo por um médico que lhe dá próteses de madeira e cresce como Hyakkimaru. Ele viaja pelo Japão feudal a caçar demónios para recuperar as partes do seu corpo, acompanhado por Dororo, um pequeno órfão ladrão.', 2019, 2019, 1, 'Winter', 8, 'Maior de 16', 'Manga', 24, 'Terminado'),
(83, 'Elfen Lied', 'Lucy é uma \"Diclonius\", uma espécie mutante humana com pequenos chifres e braços telecinéticos invisíveis altamente destrutivos chamados \"Vectores\". Após escapar de um laboratório de testes secretos deixando um rasto de sangue, ela sofre um trauma na cabeça e desenvolve uma segunda personalidade infantil e inocente que só diz \"Nyu\". Ela é acolhida por dois primos inocentes, enquanto forças militares a tentam recapturar.', 2004, 2004, 1, 'Summer', 7, 'Maior de 18', 'Manga', 13, 'Terminado'),
(84, 'Spy x Family', 'Para cumprir uma missão ultra-secreta de manter a paz entre nações rivais, o espião de elite \"Twilight\" assume o disfarce de Loid Forger, um psiquiatra. Para criar uma família falsa perfeita em poucos dias, adota Anya (sem saber que ela é uma telepata) e casa com Yor (sem saber que ela é uma assassina profissional). Nenhum sabe o segredo do outro, exceto a pequena Anya, que acha a situação fantástica.', 2022, 2024, 2, 'Spring', 8, 'Maior de 12', 'Manga', 37, 'Terminado'),
(85, 'Another', 'Em 1998, Kouichi Sakakibara transfere-se para a turma 3-3 da escola Yomiyama North. Ele nota uma atmosfera sombria na sala e repara que todos fingem que uma rapariga de pala no olho, Mei Misaki, simplesmente não existe. Ignorando os avisos silenciosos, aproxima-se dela, ativando inadvertidamente a \"maldição da turma\" — uma série de mortes brutais e bizarras em estilo Destino Final.', 2012, 2012, 1, 'Winter', 7, 'Maior de 18', 'Light Novel', 12, 'Terminado'),
(86, 'Wonder Egg Priority', 'Ai Ohto é uma rapariga que se isolou do mundo após o suicídio da sua melhor amiga. Durante um passeio noturno, ela obtém um misterioso \"Wonder Egg\". Ao parti-lo nos seus sonhos, ela entra num mundo surreal onde deve proteger pessoas que cometeram suicídio contra monstros que representam os seus traumas. Se salvar ovos suficientes, o sistema promete que ela poderá trazer a sua amiga de volta.', 2021, 2021, 1, 'Winter', 7, 'Maior de 16', 'Original', 12, 'Terminado'),
(87, 'Yuri!!! on Ice', 'Yuuri Katsuki é um patinador artístico japonês que sofre uma derrota esmagadora na final do Grande Prémio. Deprimido, regressa a casa a ponderar a reforma. No entanto, um vídeo dele a imitar perfeitamente a coreografia do campeão mundial russo, Victor Nikiforov, torna-se viral na internet. O próprio Victor viaja para o Japão e oferece-se para ser o treinador de Yuuri, revolucionando o desporto e as suas vidas.', 2016, 2016, 1, 'Fall', 8, 'Maior de 13', 'Original', 12, 'Terminado'),
(88, 'SK8 the Infinity', 'Reki Kyan é um estudante do liceu apaixonado por skate que frequenta a \"S\", uma corrida secreta, ilegal e perigosa que decorre numa mina abandonada nas montanhas. Ele introduz a este mundo Langa Hasegawa, um rapaz luso-canandiano que acabou de se mudar para o Japão e que não sabe andar de skate, mas tem anos de experiência em snowboard, adaptando-se de forma genial.', 2021, 2021, 1, 'Winter', 8, 'Maior de 12', 'Original', 12, 'Terminado'),
(89, 'Ao no Exorcist', 'Rin Okumura descobre que ele e o seu irmão gémeo Yukio são, na verdade, filhos de Satã, o deus dos demónios. Após ver o seu pai adotivo morrer para o proteger, Rin recusa-se a juntar-se ao seu progenitor biológico. Em vez disso, saca da espada mágica Kurikara (que liberta as suas chamas azuis demoníacas) e entra na Academia True Cross para se tornar um Exorcista e derrotar Satã.', 2011, 2025, 5, 'Spring', 7, 'Maior de 13', 'Manga', 73, 'Terminado'),
(90, 'Back Street Girls: Gokudolls', 'Três criminosos da Yakuza falham miseravelmente numa missão importante. O chefe da organização dá-lhes duas escolhas: cometer suicídio honroso (seppuku) ou viajar para a Tailândia, fazer uma cirurgia de mudança de sexo e passar por um treino intensivo para se tornarem um grupo de Idols pop femininas para render dinheiro à máfia. Eles escolhem a segunda e tornam-se um sucesso estrondoso, sofrendo mentalmente em segredo.', 2018, 2018, 1, 'Summer', 6, 'Maior de 16', 'Manga', 10, 'Terminado'),
(91, 'Banana Fish', 'Ash Lynx é um jovem líder de um gangue de rua em Nova Iorque, adotado no passado pelo implacável chefe da máfia Dino Golzine. Ash tenta desvendar o segredo por trás do termo \"Banana Fish\" — as últimas palavras ditas pelo seu irmão mais velho que enlouqueceu na Guerra do Iraque. No processo, conhece Eiji Okumura, um fotógrafo japonês inocente, criando um laço profundo enquanto tentam sobreviver a uma conspiração militar e mafiosa.', 2018, 2018, 1, 'Summer', 8, 'Maior de 18', 'Manga', 24, 'Terminado'),
(92, 'Dandadan', 'Momo Ayase é uma rapariga de liceu que acredita em fantasmas mas recusa a existência de extraterrestres. O seu colega de turma, Ken \"Okarun\" Takakura, acredita piamente em OVNIs mas descarta o sobrenatural. Para provarem quem está certo, visitam locais assombrados e bases alienígenas respetivamente. O resultado? Ambos estão certos. Okarun é amaldiçoado por uma bruxa turbinada e Momo desperta poderes psíquicos, dando início a batalhas caóticas e bizarras.', 2024, NULL, 2, 'Fall', 8, 'Maior de 16', 'Manga', 24, 'Terminado'),
(93, 'Shingeki no Kyojin', 'A humanidade vive atrás de muralhas para se proteger de gigantes devoradores de humanos chamados Titãs.', 2013, 2023, 1, 'Spring', 9, 'Maior de 16', 'Manga', 89, 'Terminado'),
(94, 'Boku no Hero Academia', 'Num mundo onde a maioria das pessoas tem superpoderes, um rapaz sem poderes treina para se tornar o maior herói.', 2016, 2024, 1, 'Spring', 8, 'Maior de 12', 'Manga', 138, 'Terminado'),
(95, 'Kimetsu no Yaiba', 'Tanjiro torna-se um caçador de demónios para curar a sua irmã, que foi transformada num demónio, e vingar a sua família.', 2019, NULL, 1, 'Spring', 9, 'Maior de 16', 'Manga', 55, 'Em exibição'),
(96, 'Hunter x Hunter (2011)', 'Gon Freecss parte numa jornada perigosa para se tornar um Caçador e encontrar o seu pai desaparecido.', 2011, 2014, 1, 'Fall', 9, 'Maior de 13', 'Manga', 148, 'Terminado'),
(97, 'Steins;Gate', 'Um grupo de amigos descobre como enviar mensagens para o passado, alterando o curso da história e desencadeando consequências terríveis.', 2011, 2011, 1, 'Spring', 9, 'Maior de 16', 'Original', 24, 'Terminado'),
(98, 'Tokyo Ghoul', 'Um estudante universitário sobrevive a um ataque de um Ghoul e acaba por se tornar metade humano, metade Ghoul.', 2014, 2014, 1, 'Summer', 8, 'Maior de 18', 'Manga', 12, 'Terminado'),
(99, 'One Punch Man', 'Saitama é um super-herói que treinou tanto que ficou careca e agora derrota qualquer inimigo com apenas um soco.', 2015, 2015, 1, 'Fall', 9, 'Maior de 16', 'Manga', 12, 'Terminado'),
(100, 'Sword Art Online', 'Jogadores ficam presos num jogo de realidade virtual; se morrerem no jogo, morrem na vida real.', 2012, 2012, 1, 'Summer', 7, 'Maior de 13', 'Light Novel', 25, 'Terminado'),
(101, 'Haikyuu!!', 'Hinata Shoyo, de baixa estatura, junta-se à equipa de voleibol da sua escola para se tornar o melhor jogador do país.', 2014, 2020, 1, 'Spring', 9, 'Todos', 'Manga', 85, 'Terminado'),
(102, 'No Game No Life', 'Dois irmãos génios nos videojogos são transportados para um mundo onde tudo se resolve através de jogos.', 2014, 2014, 1, 'Spring', 8, 'Maior de 13', 'Light Novel', 12, 'Terminado'),
(103, 'Shigatsu wa Kimi no Uso', 'Um prodígio do piano perde a capacidade de ouvir a sua própria música após a morte da mãe, até conhecer uma violinista.', 2014, 2015, 1, 'Fall', 9, 'Maior de 12', 'Manga', 22, 'Terminado'),
(104, 'Mob Psycho 100', 'Mob é um rapaz com poderes psíquicos explosivos que tenta viver uma vida normal enquanto suprime as suas emoções.', 2016, 2022, 1, 'Summer', 9, 'Maior de 13', 'Manga', 37, 'Terminado'),
(105, 'Re:Zero kara Hajimeru Isekai Seikatsu', 'Subaru é transportado para outro mundo e descobre que ganha o poder de retroceder no tempo sempre que morre.', 2016, NULL, 1, 'Spring', 8, 'Maior de 16', 'Light Novel', 50, 'Em exibição'),
(106, 'Cowboy Bebop', 'Caçadores de recompensas viajam pelo espaço na nave Bebop, lidando com criminosos e os seus próprios passados.', 1998, 1999, 1, 'Spring', 9, 'Maior de 16', 'Original', 26, 'Terminado'),
(107, 'Vinland Saga', 'Thorfinn, filho de um dos maiores guerreiros vikings, junta-se ao bando do assassino do seu pai em busca de vingança.', 2019, NULL, 1, 'Summer', 9, 'Maior de 16', 'Manga', 48, 'Em exibição'),
(108, 'Kaguya-sama wa Kokurasetai', 'Dois génios do conselho estudantil estão apaixonados, mas recusam-se a confessar, criando guerras psicológicas para forçar o outro a fazê-lo.', 2019, 2022, 1, 'Winter', 8, 'Maior de 13', 'Manga', 37, 'Terminado'),
(109, 'Kono Subarashii Sekai ni Shukufuku wo!', 'Um adolescente reencarna num mundo de fantasia com uma deusa inútil, uma maga focada em explosões e uma cavaleira masoquista.', 2016, NULL, 1, 'Winter', 8, 'Maior de 13', 'Light Novel', 31, 'Em exibição'),
(110, 'Gintama', 'No Japão da era Edo conquistado por extraterrestres, o excêntrico samurai Gintoki faz trabalhos estranhos para pagar a renda.', 2006, 2018, 1, 'Spring', 9, 'Maior de 13', 'Manga', 367, 'Terminado'),
(111, 'Fairy Tail', 'Lucy junta-se à infame guilda de magos Fairy Tail e vive aventuras épicas com Natsu, Happy e outros membros.', 2009, 2019, 1, 'Fall', 8, 'Maior de 13', 'Manga', 328, 'Terminado'),
(112, 'Black Clover', 'Asta, nascido num mundo de magia sem qualquer poder mágico, sonha em tornar-se o Rei Mago.', 2017, 2021, 1, 'Fall', 8, 'Maior de 13', 'Manga', 170, 'Terminado'),
(113, 'JoJo no Kimyou na Bouken', 'Acompanha a linhagem da família Joestar ao longo das gerações, com cada descendente a combater forças sobrenaturais.', 2012, NULL, 1, 'Fall', 8, 'Maior de 16', 'Manga', 190, 'Em exibição'),
(114, 'Ansatsu Kyoushitsu', 'Uma criatura com tentáculos destrói a Lua e ameaça a Terra, mas oferece-se para ensinar uma turma de alunos que têm a missão de o assassinar.', 2015, 2016, 1, 'Winter', 8, 'Maior de 13', 'Manga', 47, 'Terminado'),
(115, 'Tengen Toppa Gurren Lagann', 'Simon e Kamina vivem no subsolo, mas após encontrarem um robô, sobem à superfície para combater os tiranos que dominam a Terra.', 2007, 2007, 1, 'Spring', 9, 'Maior de 13', 'Original', 27, 'Terminado'),
(116, 'Fate/Zero', 'Sete magos invocam heróis lendários do passado para combaterem numa guerra brutal cujo prémio é o Santo Graal.', 2011, 2012, 1, 'Fall', 8, 'Maior de 16', 'Light Novel', 25, 'Terminado'),
(117, 'Psycho-Pass', 'Num futuro onde a probabilidade de uma pessoa cometer um crime é medida, a polícia caça criminosos latentes.', 2012, 2013, 1, 'Fall', 8, 'Maior de 16', 'Original', 22, 'Terminado'),
(118, 'Kill la Kill', 'Ryuko Matoi procura o assassino do seu pai usando metade de uma tesoura gigante e um uniforme escolar falante e mágico.', 2013, 2014, 1, 'Fall', 8, 'Maior de 16', 'Original', 24, 'Terminado'),
(119, 'Kiseijuu: Sei no Kakuritsu', 'Shinichi acorda com um parasita alienígena no lugar da sua mão direita. Juntos, lutam pela sobrevivência contra outros parasitas.', 2014, 2015, 1, 'Fall', 8, 'Maior de 16', 'Manga', 24, 'Terminado'),
(120, 'Boku dake ga Inai Machi', 'Um jovem volta no tempo até aos seus dias de escola primária para evitar uma série de sequestros e assassinatos.', 2016, 2016, 1, 'Winter', 8, 'Maior de 16', 'Manga', 12, 'Terminado'),
(121, 'Akame ga Kill!', 'Tatsumi junta-se a um grupo de assassinos chamado Night Raid para combater o corrupto Império e salvar a sua aldeia.', 2014, 2014, 1, 'Summer', 8, 'Maior de 16', 'Manga', 24, 'Terminado'),
(122, 'Violet Evergarden', 'Uma ex-soldado tenta compreender o significado das palavras \"Eu amo-te\", trabalhando como escritora de cartas para os outros.', 2018, 2018, 1, 'Winter', 9, 'Maior de 12', 'Light Novel', 13, 'Terminado'),
(123, 'Made in Abyss', 'A jovem Riko e o robô Reg descem às profundezas perigosas e misteriosas do grande abismo para procurar a mãe dela.', 2017, NULL, 1, 'Summer', 9, 'Maior de 16', 'Manga', 25, 'Em exibição'),
(124, 'Yakusoku no Neverland', 'Crianças órfãs descobrem a verdade macabra sobre o orfanato perfeito onde vivem e planeiam uma fuga desesperada.', 2019, 2021, 1, 'Winter', 8, 'Maior de 16', 'Manga', 23, 'Terminado'),
(125, 'Toradora!', 'Ryuuji e Taiga, dois colegas com personalidades opostas, formam uma aliança para se ajudarem a conquistar os respetivos interesses amorosos.', 2008, 2009, 1, 'Fall', 8, 'Maior de 13', 'Light Novel', 25, 'Terminado'),
(126, 'Clannad', 'Tomoya, um delinquente desinteressado na vida, conhece Nagisa, que sonha reviver o clube de teatro da escola, mudando as suas vidas.', 2007, 2008, 1, 'Fall', 8, 'Maior de 13', 'Visual Novel', 22, 'Terminado'),
(127, 'Angel Beats!', 'Numa escola secundária no purgatório, adolescentes revoltam-se contra Deus para não aceitarem a sua reencarnação e desaparecimento.', 2010, 2010, 1, 'Spring', 8, 'Maior de 13', 'Original', 13, 'Terminado'),
(128, 'Hellsing Ultimate', 'A organização Hellsing e o seu trunfo principal, o poderoso vampiro Alucard, protegem a Inglaterra de monstros e nazis.', 2006, 2012, 1, 'Winter', 8, 'Maior de 18', 'Manga', 10, 'Terminado'),
(129, 'Samurai Champloo', 'Uma jovem junta dois espadachins (um samurai tradicional e um vagabundo que luta breakdance) para procurar \"o samurai que cheira a girassóis\".', 2004, 2005, 1, 'Spring', 8, 'Maior de 16', 'Original', 26, 'Terminado'),
(130, 'Black Lagoon', 'Um empresário japonês pacato é raptado por piratas modernos no sudeste asiático e acaba por se juntar à tripulação.', 2006, 2006, 1, 'Spring', 8, 'Maior de 18', 'Manga', 12, 'Terminado'),
(131, 'FLCL', 'A vida monótona de Naota é interrompida quando uma mulher louca o atropela com a sua Vespa e acerta-lhe na cabeça com um baixo elétrico.', 2000, 2001, 1, 'Spring', 8, 'Maior de 13', 'Original', 6, 'Terminado'),
(132, 'Mushishi', 'Ginko é um viajante que estuda os Mushi, formas primitivas de vida que muitas vezes interagem e prejudicam os seres humanos.', 2005, 2006, 1, 'Fall', 9, 'Maior de 13', 'Manga', 26, 'Terminado'),
(133, 'Dragon Ball Z', 'Goku, agora adulto e com um filho, descobre que pertence a uma raça guerreira extraterrestre e tem de proteger a Terra de ameaças galácticas.', 1989, 1996, 9, 'Spring', 8, 'Maior de 12', 'Manga', 291, 'Terminado'),
(134, 'Inuyasha', 'Kagome é puxada para um poço e viaja no tempo para o Japão feudal, onde se alia ao meio-demónio Inuyasha para recolher os fragmentos de uma joia mágica.', 2000, 2004, 6, 'Fall', 8, 'Maior de 13', 'Manga', 167, 'Terminado'),
(135, 'Yu Yu Hakusho', 'Um delinquente adolescente sacrifica a vida para salvar uma criança e recebe uma segunda oportunidade como Detetive Espiritual, investigando demónios na Terra.', 1992, 1995, 4, 'Fall', 8, 'Maior de 13', 'Manga', 112, 'Terminado'),
(136, 'Ouran Koukou Host Club', 'Haruhi, uma aluna pobre numa escola de elite, parte um vaso caríssimo e é forçada a fingir que é um rapaz para trabalhar no Host Club e pagar a dívida.', 2006, 2006, 1, 'Spring', 8, 'Maior de 13', 'Manga', 26, 'Terminado'),
(137, 'Nana', 'Duas raparigas de 20 anos, ambas com o nome Nana mas com personalidades opostas, conhecem-se num comboio para Tóquio e acabam por partilhar um apartamento.', 2006, 2007, 1, 'Spring', 9, 'Maior de 16', 'Manga', 47, 'Terminado'),
(138, 'Fruits Basket (2019)', 'Tohru Honda é acolhida pela família Soma, que esconde um segredo: os seus membros transformam-se em animais do Zodíaco Chinês quando abraçados pelo sexo oposto.', 2019, 2021, 3, 'Spring', 9, 'Maior de 13', 'Manga', 63, 'Terminado'),
(139, 'Kuroko no Basket', 'O \"Sexto Homem Fantasma\" da lendária Geração dos Milagres junta-se à equipa de basquetebol do liceu Seirin para os ajudar a chegar ao topo do Japão.', 2012, 2015, 3, 'Spring', 8, 'Maior de 13', 'Manga', 75, 'Terminado'),
(140, 'Free!', 'Haruka Nanase e os seus amigos de infância revitalizam o clube de natação do seu liceu para voltarem a competir juntos.', 2013, 2018, 3, 'Summer', 7, 'Maior de 13', 'Light Novel', 37, 'Terminado'),
(141, 'Baccano!', 'Uma narrativa não-linear na América dos anos 1930, onde mafiosos, assassinos, alquimistas e ladrões se cruzam numa série de eventos violentos e imortais.', 2007, 2007, 1, 'Summer', 8, 'Maior de 16', 'Light Novel', 13, 'Terminado'),
(142, 'Tengoku Daimakyou', 'No mundo exterior devastado por monstros, Maru e Kiruko procuram o \"Paraíso\", enquanto num local fechado, crianças peculiares crescem sob vigilância tecnológica.', 2023, 2023, 1, 'Spring', 8, 'Maior de 16', 'Manga', 13, 'Terminado'),
(143, 'Oshi no Ko', 'Um médico e uma fã reencarnam como filhos gémeos da sua Idol favorita, Ai Hoshino, entrando no mundo sombrio da indústria do entretenimento em busca de vingança.', 2023, NULL, 2, 'Spring', 9, 'Maior de 16', 'Manga', 24, 'Em exibição'),
(144, 'Cyberpunk: Edgerunners', 'Numa cidade distópica obcecada por tecnologia e modificações corporais, um rapaz de rua junta-se a um grupo de mercenários implacáveis.', 2022, 2022, 1, 'Fall', 9, 'Maior de 18', 'Original', 10, 'Terminado'),
(145, 'Devilman Crybaby', 'Akira funde-se com um demónio para obter o seu poder e proteger a humanidade, tornando-se o Devilman num mundo à beira da rutura apocalíptica.', 2018, 2018, 1, 'Winter', 8, 'Maior de 18', 'Manga', 10, 'Terminado'),
(146, 'Great Teacher Onizuka', 'Um ex-líder de um gangue de motards torna-se professor no liceu com o objetivo de conhecer raparigas, mas acaba a usar métodos não ortodoxos para consertar a vida dos seus alunos.', 1999, 2000, 1, 'Summer', 9, 'Maior de 16', 'Manga', 43, 'Terminado'),
(147, 'Hajime no Ippo', 'Ippo, um rapaz tímido e frequentemente alvo de bullying, é salvo por um pugilista profissional e descobre o seu talento inato para o boxe.', 2000, 2002, 1, 'Fall', 9, 'Maior de 13', 'Manga', 75, 'Terminado'),
(148, 'Mushoku Tensei: Isekai Ittara Honki Dasu', 'Um recluso de 34 anos morre e reencarna num mundo de espada e magia como um bebé, determinado a viver esta nova vida ao máximo, sem arrependimentos.', 2021, NULL, 2, 'Winter', 8, 'Maior de 16', 'Light Novel', 48, 'Em exibição'),
(149, 'K-On!', 'Quatro raparigas de liceu formam uma banda para salvar o Clube de Música Ligeira, passando mais tempo a beber chá e comer doces do que a ensaiar.', 2009, 2010, 2, 'Spring', 8, 'Maior de 13', 'Manga', 39, 'Terminado'),
(150, 'Suzumiya Haruhi no Yuuutsu', 'A vida de Kyon muda quando é arrastado para o clube escolar de Haruhi Suzumiya, uma rapariga excêntrica que, sem saber, possui o poder de alterar a realidade.', 2006, 2009, 2, 'Spring', 8, 'Maior de 13', 'Light Novel', 28, 'Terminado'),
(151, 'Bakemonogatari', 'Koyomi Araragi, um estudante que sobreviveu a um ataque de um vampiro, ajuda raparigas envolvidas em bizarros incidentes sobrenaturais conhecidos como \"anomalias\".', 2009, 2010, 1, 'Summer', 8, 'Maior de 16', 'Light Novel', 15, 'Terminado'),
(152, 'Bocchi the Rock!', 'Hitori Gotoh é uma rapariga solitária e com severa ansiedade social que toca guitarra de forma brilhante e junta-se acidentalmente à Kessoku Band.', 2022, 2022, 1, 'Fall', 9, 'Maior de 13', 'Manga', 12, 'Terminado'),
(153, 'Blue Lock', 'Após uma derrota esmagadora no Mundial, o Japão cria o bizarro projeto prisional \"Blue Lock\" para forjar o avançado egoísta e definitivo capaz de lhes dar a vitória.', 2022, NULL, 2, 'Fall', 8, 'Maior de 13', 'Manga', 48, 'Em exibição'),
(154, 'Grand Blue', 'Iori muda-se para uma cidade costeira para a universidade e é rapidamente absorvido pelo insano e altamente alcoólico clube de mergulho local (onde o mergulho é opcional).', 2018, 2018, 1, 'Summer', 8, 'Maior de 16', 'Manga', 12, 'Terminado'),
(155, 'Mahou Shoujo Madoka★Magica', 'Raparigas comuns recebem a oferta de um desejo em troca de se tornarem garotas mágicas, apenas para descobrirem a verdade cruel e sombria por trás desse contrato.', 2011, 2011, 1, 'Winter', 8, 'Maior de 16', 'Original', 12, 'Terminado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `animevozes`
--

CREATE TABLE `animevozes` (
  `IdAnime` int(11) NOT NULL,
  `IdAtorVoz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animevozes`
--

INSERT INTO `animevozes` (`IdAnime`, `IdAtorVoz`) VALUES
(4, 115),
(5, 116),
(6, 117),
(59, 118),
(60, 119),
(61, 120),
(62, 121),
(63, 122),
(64, 123),
(65, 124),
(66, 179),
(67, 125),
(68, 126),
(68, 127),
(69, 128),
(70, 129),
(71, 130),
(71, 131),
(72, 132),
(73, 133),
(73, 134),
(74, 135),
(74, 136),
(75, 137),
(75, 138),
(76, 139),
(76, 140),
(77, 141),
(78, 142),
(78, 143),
(79, 144),
(80, 145),
(81, 146),
(82, 147),
(82, 148),
(83, 126),
(84, 149),
(84, 146),
(85, 150),
(85, 151),
(86, 152),
(87, 130),
(87, 153),
(88, 154),
(88, 155),
(89, 156),
(90, 157),
(90, 167),
(90, 174),
(90, 175),
(90, 176),
(90, 177),
(91, 172),
(91, 173),
(92, 168),
(92, 178),
(93, 137),
(94, 180),
(95, 168),
(96, 181),
(97, 133),
(98, 168),
(98, 185),
(99, 182),
(100, 183),
(100, 184),
(101, 127),
(102, 183),
(103, 168),
(104, 191),
(105, 128),
(106, 190),
(107, 192),
(108, 182),
(109, 185),
(110, 171),
(111, 193),
(112, 194),
(113, 167),
(114, 153),
(115, 193),
(116, 153),
(117, 161),
(118, 195),
(119, 124),
(120, 196),
(121, 185),
(122, 186),
(123, 197),
(124, 198),
(125, 165),
(126, 163),
(127, 142),
(128, 199),
(129, 200),
(130, 201),
(131, 202),
(132, 203),
(133, 189),
(134, 134),
(135, 204),
(136, 135),
(137, 115),
(138, 124),
(139, 137),
(140, 124),
(141, 205),
(142, 181),
(143, 143),
(144, 141),
(145, 127),
(146, 206),
(147, 207),
(148, 208),
(149, 188),
(150, 187),
(151, 160),
(152, 209),
(153, 154),
(154, 128),
(155, 142);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atorvoz`
--

CREATE TABLE `atorvoz` (
  `IdAtorVoz` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Genero` enum('M','F','Não definido','Outro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `atorvoz`
--

INSERT INTO `atorvoz` (`IdAtorVoz`, `Nome`, `DataNascimento`, `Genero`) VALUES
(115, 'Romi Park', '1972-01-22', 'F'),
(116, 'Kotono Mitsuishi', '1967-12-08', 'F'),
(117, 'Megumi Ogata', '1965-06-06', 'F'),
(118, 'Masaya Onosaka', '1964-10-13', 'M'),
(119, 'Masakazu Morita', '1972-10-21', 'M'),
(120, 'Junko Takeuchi', '1972-04-05', 'F'),
(121, 'Mayumi Tanaka', '1955-01-15', 'F'),
(122, 'Rosa Suzukaze (Mayo Suzukaze)', '1960-08-29', 'F'),
(123, 'Chiemi Chiba', '1975-02-25', 'F'),
(124, 'Nobunaga Shimazaki', '1988-12-06', 'M'),
(125, 'Sakura Tange', '1973-03-24', 'F'),
(126, 'Sanae Kobayashi', '1980-01-26', 'F'),
(127, 'Ayumu Murase', '1988-12-14', 'M'),
(128, 'Yusuke Kobayashi', '1985-03-25', 'M'),
(129, 'Kenta Kamakari', '1984-02-17', 'M'),
(130, 'Toshiyuki Toyonaga', '1984-04-28', 'M'),
(131, 'Miyuki Sawashiro', '1985-06-02', 'F'),
(132, 'Jun Fukuyama', '1978-11-26', 'M'),
(133, 'Mamoru Miyano', '1983-06-08', 'M'),
(134, 'Kappei Yamaguchi', '1965-05-23', 'M'),
(135, 'Maaya Sakamoto', '1980-03-31', 'F'),
(136, 'Tomokazu Seki', '1972-09-08', 'M'),
(137, 'Yuki Kaji', '1985-09-03', 'M'),
(138, 'Sachika Misawa', '1993-01-13', 'F'),
(139, 'Ikumi Hasegawa', '1998-10-16', 'F'),
(140, 'Shoya Chiba', '1995-08-29', 'M'),
(141, 'Kikunosuke Toya', '1998-11-30', 'M'),
(142, 'Aoi Yuki', '1992-03-27', 'F'),
(143, 'Takeo Otsuka', '1992-10-19', 'M'),
(144, 'Hidenobu Kiuchi', '1969-02-05', 'M'),
(145, 'Junya Enoki', '1988-10-19', 'M'),
(146, 'Atsumi Tanezaki', '1990-09-27', 'F'),
(147, 'Hiroki Suzuki', '1985-06-04', 'M'),
(148, 'Rio Suzuki', '2005-02-10', 'F'),
(149, 'Takuya Eguchi', '1987-05-22', 'M'),
(150, 'Atsushi Abe', '1981-03-25', 'M'),
(151, 'Natsumi Takamori', '1987-02-14', 'F'),
(152, 'Kanata Aikawa', '2004-10-20', 'F'),
(153, 'Junichi Suwabe', '1972-03-29', 'M'),
(154, 'Tasuku Hatanaka', '1994-08-17', 'M'),
(155, 'Chiaki Kobayashi', '1994-06-04', 'M'),
(156, 'Nobuhiko Okamoto', '1986-10-24', 'M'),
(157, 'Satoshi Hino', '1978-08-04', 'M'),
(158, 'Kanon Takao', '2002-09-10', 'F'),
(159, 'Ayasa Itō', '1996-12-06', 'F'),
(160, 'Hiroshi Kamiya', '1975-01-28', 'M'),
(161, 'Kana Hanazawa', '1989-02-25', 'F'),
(162, 'Saori Hayami', '1991-05-29', 'F'),
(163, 'Yuuichi Nakamura', '1980-02-20', 'M'),
(164, 'Takehito Koyasu', '1967-05-05', 'M'),
(165, 'Rie Kugimiya', '1979-05-30', 'F'),
(166, 'Akira Ishida', '1967-11-02', 'M'),
(167, 'Daisuke Ono', '1978-05-04', 'M'),
(168, 'Natsuki Hanae', '1991-06-26', 'M'),
(169, 'Inori Minase', '1995-12-02', 'F'),
(170, 'Megumi Hayashibara', '1967-03-30', 'F'),
(171, 'Tomokazu Sugita', '1980-10-11', 'M'),
(172, 'Yuma Uchida', '1992-09-21', 'M'),
(173, 'Kenji Nojima', '1976-03-16', 'M'),
(174, 'Kazuyuki Okitsu', '1980-03-08', 'M'),
(175, 'Yuka Nukui', '1994-10-28', 'F'),
(176, 'Kaori Maeda', '1996-04-25', 'F'),
(177, 'Hikaru Akao', '1995-06-16', 'F'),
(178, 'Shion Wakayama', '1998-02-10', 'F'),
(179, 'Nina Tamaki', '1996-02-29', 'F'),
(180, 'Daiki Yamashita', '1989-09-07', 'M'),
(181, 'Megumi Han', '1989-06-03', 'F'),
(182, 'Makoto Furukawa', '1989-09-29', 'M'),
(183, 'Yoshitsugu Matsuoka', '1986-01-11', 'M'),
(184, 'Haruka Tomatsu', '1990-01-27', 'F'),
(185, 'Sora Amamiya', '1993-08-28', 'F'),
(186, 'Yui Ishikawa', '1989-05-30', 'F'),
(187, 'Aya Hirano', '1987-01-27', 'F'),
(188, 'Aki Toyosaki', '1990-01-29', 'F'),
(189, 'Masako Nozawa', '1936-03-25', 'F'),
(190, 'Koichi Yamadera', '1961-06-17', 'M'),
(191, 'Setsuo Itou', '1997-01-01', 'M'),
(192, 'Yuto Uemura', '1994-01-27', 'M'),
(193, 'Tetsuya Kakihara', '1986-01-27', 'M'),
(194, 'Gakuto Kajiwara', '1996-01-01', 'M'),
(195, 'Ryoka Yuzuki', '1974-04-24', 'F'),
(196, 'Tatsuya Tokutake', '1990-01-01', 'M'),
(197, 'Miyu Tomita', '2000-01-01', 'F'),
(198, 'Sumire Morohoshi', '2000-01-01', 'F'),
(199, 'Jouji Nakata', '1957-01-01', 'M'),
(200, 'Kazuya Nakai', '1967-01-01', 'M'),
(201, 'Megumi Toyoguchi', '1974-01-01', 'F'),
(202, 'Miki Ito', '1972-01-01', 'F'),
(203, 'Tsutomu Isobe', '1962-01-01', 'M'),
(204, 'Nozomu Sasaki', '1967-06-04', 'M'),
(205, 'Toshiyuki Morikawa', '1967-01-26', 'M'),
(206, 'Yuji Ueda', '1968-01-01', 'M'),
(207, 'Nobuo Tobita', '1957-01-01', 'M'),
(208, 'Yumi Uchiyama', '1990-01-01', 'F'),
(209, 'Sayumi Suzushiro', '1997-01-01', 'F');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bandasonora`
--

CREATE TABLE `bandasonora` (
  `IdBandaSonora` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `IdAnime` int(11) NOT NULL,
  `Opening` varchar(100) NOT NULL,
  `Ending` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `bandasonora`
--

INSERT INTO `bandasonora` (`IdBandaSonora`, `Nome`, `IdAnime`, `Opening`, `Ending`) VALUES
(1, 'Akira Senju', 4, '\"Again\" por YUI', '\"Uso\" por SID'),
(2, 'Takanori Arisawa', 5, '\"Moonlight Densetsu\" por DALI', '\"Heart Moving\" por Misae Takamatsu'),
(3, 'Shiro Sagisu', 6, '\"A Cruel Angel\'s Thesis\" por Yoko Takahashi', '\"Fly Me to the Moon\"'),
(4, 'Tsuneo Imahori', 59, '\"H.T.\" por Tsuneo Imahori', '\"Kaze wa Mirai ni Fuku\" por AKIMA & NEOS'),
(5, 'Shiro Sagisu', 60, '\"Asterisk\" por ORANGE RANGE', '\"Life is Like a Boat\" por Rie fu'),
(6, 'Toshio Masuda', 61, '\"Haruka Kanata\" por ASIAN KUNG-FU GENERATION', '\"Wind\" por Akeboshi'),
(7, 'Kohei Tanaka / Shiro Hamaguchi', 62, '\"We Are!\" por Hiroshi Kitadani', '\"Memories\" por Maki Otsuki'),
(8, 'Noriyuki Asakura', 63, '\"Sobakasu\" por JUDY AND MARY', '\"Heart of Sword\" por T.M.Revolution'),
(9, 'Keiichi Oku', 64, '\"Ojamajo Carnival!!\" por MAHO Dou', '\"Kitto Ashita wa\" por Saeko Shuu'),
(10, 'Konishi Kayo / Kondoo Yukio', 65, '\"Pupa\" por Ibuki Kido', '\"Staccato\" por Jinnai Akari'),
(11, 'Artistas Oficiais Aniplex / Kadokawa', 66, 'Sen Yori Kaminari Ya, Sarariya Takaki', 'Shirogarasu'),
(12, 'Takayuki Negishi', 67, '\"Catch You Catch Me\" por Gumi', '\"Groovy!\" por Kohmi Hirose'),
(13, 'Kaoru Wada', 68, '\"Innocent Sorrow\" por abingdon boys school', '\"Antoinette Blue\" por Nana Kitade'),
(14, 'Tatsuya Kato, Hiroaki Tsutsumi, Yuki Kanesaka', 69, '\"Good Morning World!\" por Burnout Syndromes', '\"Life\" por Rude-a'),
(15, 'Skankfunk / Wall5', 70, '\"Chain\" por BACK-ON', '\"Sky 2 High\" por skankfunk (Instrumental)'),
(16, 'Makoto Yoshimori', 71, '\"Uraogiri no Yuuyake\" por THE THEATRE BROOK', '\"Trust Me\" por Yuya Matsushita'),
(17, 'Kotaro Nakagawa / Hitomi Kuroishi', 72, '\"Colors\" por FLOW', '\"Mosaic Kakera\" por SunSet Swish'),
(18, 'Yoshihisa Hirano / Hideki Taniuchi', 73, '\"the WORLD\" por Nightmare', '\"Alumina\" por Nightmare'),
(19, 'Yoko Kanno / Hajime Mizoguchi', 74, '\"Yakusoku wa Iranai\" por Maaya Sakamoto', '\"Mystic Eyes\" por Hiroki Wada'),
(20, 'MintJam / Oshima Hiroyuki', 75, '\"Chase the world\" por May\'n', '\"Unfinished\" por KOTOKO'),
(21, 'Hiroyuki Sawano / Kohta Yamamoto', 76, '\"Kyoukai sen\" por amazarashi', '\"Avid\" por SawanoHiroyukii'),
(22, 'Kensuke Ushio', 77, '\"KICK BACK\" por Kenshi Yonezu', 'ED8 TK from Ling Tosite Sigure - first death'),
(23, 'Satoru Kousaki / Kevin Penkin', 78, '\"Hana ni Nattte\" por Ryokuoushoku Shakai', '\"Aikotoba\" por AINA THE END'),
(24, 'Kuniaki Haishima', 79, '\"Grain\" por Kuniaki Haishima', '\"For the Love of Life\" por David Sylvian'),
(25, 'Hiroaki Tsutsumi,Yoshimasa Terui,Alisa Okehazama', 80, '\"Kaikai Kitan\" por Eve', '\"Lost in Paradise\" por ALI feat. AKLO'),
(26, 'Evan Call', 81, '\"Yuusha\" por YOASOBI', '\"Anytime Anywhere\" por milet'),
(27, 'Yoshihiro Ike', 82, '\"Kaen\" por Queen Bee (OP 1)', '\"Sayonara Gokko\" por amazarashi'),
(28, 'Kayo Konishi / Yukio Kondo', 83, '\"Lilium\" por Kumiko Noma', '\"Be Your Girl\" por Chieko Kawabe'),
(29, '[KNOW NAME]', 84, '\"Mixed Nuts\" por Official HIGE DANdism', '\"Comedy\" por Gen Hoshino'),
(30, 'Kow Otani', 85, '\"Kyoumu Densen\" por ALI PROJECT', '\"Anamnesis\" por Annabel'),
(31, 'Mito / De De Mouse', 86, '\"Sudachi no Uta\" por Anemoneria', '\"Life is Cider\" por Anemoneria'),
(32, 'Taro Umebayashi / Taku Matsushiba', 87, '\"History Maker\" por DEAN FUJIOKA', '\"You Only Live Once\" por Wataru Hatano'),
(33, 'Ryo Takahashi', 88, '\"Paradise\" por Rude-a', '\"Infinity\" por Yuuri'),
(34, 'Hiroyuki Sawano', 89, '\"Core Pride\" por UVERworld', '\"Take Off\" por 2PM'),
(35, 'Gesshoku Kaigi', 90, '\"Gokudoll Music\" por Gokudolls Nijigumi', '\"Hoshi no Katachi\" por Gokudolls Nijigumi'),
(36, 'Shinichi Osawa', 91, '\"found & lost\" por Survive Said The Prophet', '\"Prayer X\" por King Gnu'),
(37, 'Kensuke Ushio', 92, '\"Otonoke\" por Creepy Nuts', '\"TAIDADA\" por ZUTOMAYO'),
(38, 'Hiroyuki Sawano', 93, 'Guren no Yumiya por Linked Horizon', 'Utsukushiki Zankoku na Sekai por Yoko Hikasa'),
(39, 'Yuki Hayashi', 94, 'The Day por Porno Graffitti', 'Heroes por Brian the Sun'),
(40, 'Yuki Kajiura e Go Shiina', 95, 'Gurenge por LiSA', 'from the edge por LiSA e FictionJunction'),
(41, 'Yoshihisa Hirano', 96, 'Departure! por Galneryus', 'Just Awake por Konomi Suzuki'),
(42, 'Takeshi Abo', 97, 'Hacking to the Gate por Kanako Itou', 'Toki Tsukasadoru Juuni no Meiyaku por Kanako Itou'),
(43, 'Yutaka Yamada', 98, 'unravel por TK from Ling Tosite Sigure', 'Seiyoku no Fukushuu por oOooOooOooOo'),
(44, 'Makoto Miyazaki', 99, 'The Hero!! ~Ichiban Kakkoii Yatsu~ por JAM Project', 'Made in Japan por JAM Project'),
(45, 'Yuki Kajiura', 100, 'Crossing Field por LiSA', 'Yume Sekai por Haruka Tomatsu'),
(46, 'Yuki Hayashi', 101, 'Imagination por SPYAIR', 'FLY HIGH!! por BURNOUT SYNDROMES'),
(47, 'Ryo Takahashi', 102, 'This Game por Konomi Suzuki', 'Ring Ring Rainbow!! por elenco'),
(48, 'Masaru Yokoyama', 103, 'Hikaru Nara por Goose house', 'Orange por 7!!'),
(49, 'Kenji Kawai', 104, '99.9 por (K)NoW_NAME', '1 por (K)NoW_NAME'),
(50, 'Kenichiro Suehiro', 105, 'Redo por Konomi Suzuki', 'STYX HELIX por Rie Takahashi e Ayaka Suwa'),
(51, 'Yoko Kanno', 106, 'Tank! por Seatbelts', 'The Real Folk Blues por Mai Yamane'),
(52, 'Yutaka Yamada', 107, 'MUKANJYO por Survive Said The Prophet', 'Torch por Aimer'),
(53, 'Kanade Sato', 108, 'Love Dramatic por Masayuki Suzuki', 'Kaguya-sama wa Kokurasetai por Vaundy'),
(54, 'Masato Nakayama', 109, 'Fantastic Dreamer por Machico', 'Chiisana Boukensha por Machico e Konomi Suzuki'),
(55, 'Kenji Kawai', 110, 'Pray por DOES', 'Kirei Gokko por Tornado Mart'),
(56, 'Yasuharu Takanashi', 111, 'Snow Fairy por FUNKIST', 'Kimi ga Iru Kara por Ceui'),
(57, 'Minako Seki', 112, 'Haruka Mirai por BURNOUT SYNDROMES', 'Black Rover por Vickeblanka'),
(58, 'Yugo Kanno', 113, 'Sono Chi no Sadame por JIN', 'Roundabout por Yes (cover)'),
(59, 'Kohta Yamamoto', 114, 'Q&A por Kensho Ono', 'Yoake no Kaze por 2 AM'),
(60, 'Taku Iwasaki', 115, 'Sorairo Days por Yoko Takahashi', 'Row Row Fight the Powaa!! por Yoko Takahashi'),
(61, 'Yuki Kajiura', 116, 'to the beginning por Kalafina', 'Sprinter por Kalafina'),
(62, 'Yugo Kanno', 117, 'Abnormalize por Ling Tosite Sigure', 'Namae no Nai Kaibutsu por Egoist'),
(63, 'Hiroyuki Sawano', 118, 'Sirius por Salyu x Salyu', 'Ambiguous por FLOW'),
(64, 'Ken Arai', 119, 'Let Me Hear por Fear, and Loathing in Las Vegas', 'Next to You por MAN WITH A MISSION'),
(65, 'Hiroaki Tsutsumi', 120, 'Re:Re: por Asian Kung-Fu Generation', 'Just a Moment por Snow Patrol'),
(66, 'Taku Iwasaki', 121, 'Trigger por Miyuki Hashimoto', 'Liar Mask por Konomi Suzuki'),
(67, 'Evan Call', 122, 'Sincerely por TRUE', 'Michishirube por TRUE'),
(68, 'Kevin Penkin', 123, 'Deep in Abyss (instrumental)', 'Kareha por Riko (Miyu Tomita)'),
(69, 'Takahiro Obata', 124, 'Touch off por UVERworld', 'Zettai Zetsumei por Cinema Staff'),
(70, 'Yoshiaki Fujisawa', 125, 'Preparation! por Rie Kugimiya, Yui Horie e Eri Kitamura', 'Vanilla Salt por Yui Horie'),
(71, 'Shinji Orito e Jun Maeda', 126, 'Mag Mell por Lia', 'Dango Daikazoku por Chata'),
(72, 'Jun Maeda', 127, 'My Soul, Your Beats! por Lia', 'Brave Song por Lia'),
(73, 'Yasushi Ishii', 128, 'Shine por Yasushi Ishii', 'World Without Logos por Yasushi Ishii'),
(74, 'Nujabes', 129, 'Battlecry por Nujabes feat. Shing02', 'Failure por Fat Jon'),
(75, 'MELL', 130, 'Red Fraction por MELL', 'Don\'t Look Behind por Edison'),
(76, 'The Pillows', 131, 'Ride on Shooting Star por The Pillows', 'Little Busters por The Pillows'),
(77, 'Toshio Masuda', 132, 'The Sore Feet Song por Ally Kerr', 'Shiver por Ally Kerr'),
(78, 'Shunsuke Kikuchi', 133, 'Cha-La Head-Cha-La por Hironobu Kageyama', 'Detekoi Tobikiri Zenkai Power! por Manna'),
(79, 'Kaoru Wada', 134, 'Change the World por V6', 'My Will por Dream'),
(80, 'Yusuke Honma', 135, 'Sobakasu por Judy and Mary', 'Taiyou ga Mata Kagayaku Toki por Ryoko Shinohara'),
(81, 'Yasuharu Takanashi', 136, 'Sakura Kiss por Chieko Kawabe', 'Shissou por AAA'),
(82, 'Nana Kitade', 137, 'Rose por Nana Kitade', 'A Little Pain por Olivia Lufkin'),
(83, 'Taku Matsushiba', 138, 'Again por Alexandros', 'Chime por Ai Ninomiya'),
(84, 'Kenichiro Suehiro', 139, 'Can Do It! por GRANRODEO', 'Aoi Kioku por Kenichi Suzumura'),
(85, 'Tatsuya Kato', 140, 'Rage on por OLDCODEX', 'Splash Free por STYLE FIVE'),
(86, 'Makoto Yoshimori', 141, 'Guns & Roses por Paradise Lunch', 'Calling por Ivy'),
(87, 'Kensuke Ushio', 142, 'Anytime Anywhere por Milet', 'Anytime Anywhere por Milet'),
(88, 'Kanade Sato', 143, 'Idol por YOASOBI', 'Mephisto por Queen Bee'),
(89, 'Franz Kirmann', 144, 'Let You Down por Dawid Podsiadlo', 'I Really Want to Stay at Your House por Rosa Walton'),
(90, 'Kensuke Ushio', 145, 'Man Human por Denki Groove', 'Zetsubou Billy por Denki Groove'),
(91, 'Hidekazu Kimura', 146, 'Driver\'s High por L\'Arc-en-Ciel', 'Samayoeru Kamishibai por Rider Chips'),
(92, 'Toshihiko Sahashi', 147, 'Kimi ga Iru por Dish//', 'Nakushita Kotoba por Field of View'),
(93, 'Yoshiaki Fujisawa', 148, 'Sayonara Gunjou por Konomi Suzuki', 'Cage por Yuiko Ohara'),
(94, 'Katsuo Ogino', 149, 'Cagayake! GIRLS por Ho-kago Tea Time', 'Don\'t say lazy por Ho-kago Tea Time'),
(95, 'Satoru Kousaki', 150, 'Bouken Desho Desho? por Aya Hirano', 'Hare Hare Yukai por elenco'),
(96, 'Satoru Kousaki', 151, 'Renai Circulation por Kana Hanazawa', 'Sugar Sweet Nightmare por Kana Hanazawa'),
(97, 'Asa (Kessoku Band)', 152, 'Seishun Complex por Kessoku Band', 'Distortion!! por Kessoku Band'),
(98, 'Taku Inoue', 153, 'Judgement por Vaundy', 'Requiem por Yorushika'),
(99, 'Junichi Sato (compositor)', 154, 'GRAND BLUE por Aho no Sakata', 'Kotoba ni Dekinai por elenco'),
(100, 'Yuki Kajiura', 155, 'Connect por ClariS', 'Magia por Kalafina');

-- --------------------------------------------------------

--
-- Estrutura da tabela `diretor`
--

CREATE TABLE `diretor` (
  `IdDiretor` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Genero` enum('M','F','Não definido','Outro') NOT NULL,
  `Tipo` enum('Animação','Banda Sonora') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `diretor`
--

INSERT INTO `diretor` (`IdDiretor`, `Nome`, `DataNascimento`, `Genero`, `Tipo`) VALUES
(1, 'Yasuhiro Irie', '1971-10-25', 'M', 'Animação'),
(2, 'Junichi Sato', '1960-08-25', 'M', 'Animação'),
(3, 'Kunihiko Ikuhara', '1964-12-21', 'M', 'Animação'),
(4, 'Hideaki Anno', '1960-05-22', 'M', 'Animação'),
(5, 'Satoshi Nishimura', '1964-12-26', 'M', 'Animação'),
(6, 'Noriyuki Abe', '1961-07-19', 'M', 'Animação'),
(7, 'Hayato Date', '1962-05-22', 'M', 'Animação'),
(8, 'Tatsuya Nagamine', '1971-02-13', 'M', 'Animação'),
(9, 'Kōnosuke Uda', '1966-02-01', 'M', 'Animação'),
(10, 'Kazuhiro Furuhashi', '1960-06-09', 'M', 'Animação'),
(11, 'Shigeyasu Yamauchi', '1954-05-18', 'M', 'Animação'),
(12, 'Tomomi Mochizuki', '1958-12-31', 'M', 'Animação'),
(13, 'Morio Asaka', '1967-03-11', 'M', 'Animação'),
(14, 'Osamu Nabeshima', '1953-03-16', 'M', 'Animação'),
(15, 'Yoshiharu Ashino', '1967-12-11', 'M', 'Animação'),
(16, 'Shinya Iino', NULL, 'M', 'Animação'),
(17, 'Hajime Kamegaki', '1957-08-21', 'M', 'Animação'),
(18, 'Takahiro Omori', '1965-07-11', 'M', 'Animação'),
(19, 'Goro Taniguchi', '1966-10-18', 'M', 'Animação'),
(20, 'Tetsuro Araki', '1976-11-05', 'M', 'Animação'),
(21, 'Kazuki Akane', '1962-03-24', 'M', 'Animação'),
(22, 'Masakazu Obara', NULL, 'M', 'Animação'),
(23, 'Toshimasa Ishii', NULL, 'M', 'Animação'),
(24, 'Ryu Nakayama', NULL, 'M', 'Animação'),
(25, 'Norihiro Naganuma', NULL, 'M', 'Animação'),
(26, 'Masayuki Kojima', '1955-03-11', 'M', 'Animação'),
(27, 'Sunghoo Park', '1983-03-17', 'M', 'Animação'),
(28, 'Shota Goshozono', NULL, 'M', 'Animação'),
(29, 'Keiichirou Saitou', '1993-11-18', 'M', 'Animação'),
(30, 'Mamoru Kanbe', '1962-07-12', 'M', 'Animação'),
(31, 'Tsutomu Mizushima', '1965-12-06', 'M', 'Animação'),
(32, 'Shin Wakabayashi', NULL, 'M', 'Animação'),
(33, 'Sayo Yamamoto', '1977-04-13', 'F', 'Animação'),
(34, 'Hiroko Utsumi', '1980-11-11', 'F', 'Animação'),
(35, 'Tensai Okamura', '1960-12-13', 'M', 'Animação'),
(36, 'Chiaki Kon', '1972-09-29', 'F', 'Animação'),
(37, 'Akira Senju', '1960-10-21', 'M', 'Banda Sonora'),
(38, 'Takanori Arisawa', '1951-04-02', 'M', 'Banda Sonora'),
(39, 'Shiro Sagisu', '1957-08-29', 'M', 'Banda Sonora'),
(40, 'Tsuneo Imahori', '1962-12-05', 'M', 'Banda Sonora'),
(41, 'Toshio Masuda', '1959-10-28', 'M', 'Banda Sonora'),
(42, 'Kohei Tanaka', '1954-02-14', 'M', 'Banda Sonora'),
(43, 'Shiro Hamaguchi', '1969-11-19', 'M', 'Banda Sonora'),
(44, 'Noriyuki Asakura', '1954-02-11', 'M', 'Banda Sonora'),
(45, 'Keiichi Oku', '1955-10-14', 'M', 'Banda Sonora'),
(46, 'Kayo Konishi', NULL, 'F', 'Banda Sonora'),
(47, 'Yukio Kondo', NULL, 'M', 'Banda Sonora'),
(48, 'Takayuki Negishi', '1961-08-06', 'M', 'Banda Sonora'),
(49, 'Kaoru Wada', '1962-05-05', 'M', 'Banda Sonora'),
(50, 'Tatsuya Kato', '1980-07-28', 'M', 'Banda Sonora'),
(51, 'Hiroaki Tsutsumi', '1985-06-05', 'M', 'Banda Sonora'),
(52, 'Yuki Kanesaka', NULL, 'M', 'Banda Sonora'),
(53, 'Makoto Yoshimori', '1969-03-11', 'M', 'Banda Sonora'),
(54, 'Kotaro Nakagawa', '1969-03-13', 'M', 'Banda Sonora'),
(55, 'Hitomi Kuroishi', NULL, 'F', 'Banda Sonora'),
(56, 'Yoshihisa Hirano', '1971-12-07', 'M', 'Banda Sonora'),
(57, 'Hideki Taniuchi', '1972-11-15', 'M', 'Banda Sonora'),
(58, 'Yoko Kanno', '1963-03-18', 'F', 'Banda Sonora'),
(59, 'Hajime Mizoguchi', '1960-04-23', 'M', 'Banda Sonora'),
(60, 'Hiroyuki Sawano', '1980-09-12', 'M', 'Banda Sonora'),
(61, 'Kohta Yamamoto', '1987-07-16', 'M', 'Banda Sonora'),
(62, 'Kensuke Ushio', '1983-03-01', 'M', 'Banda Sonora'),
(63, 'Satoru Kousaki', '1974-09-16', 'M', 'Banda Sonora'),
(64, 'Kevin Penkin', '1992-05-22', 'M', 'Banda Sonora'),
(65, 'Kuniaki Haishima', NULL, 'M', 'Banda Sonora'),
(66, 'Yoshimasa Terui', NULL, 'M', 'Banda Sonora'),
(67, 'Evan Call', '1988-06-29', 'M', 'Banda Sonora'),
(68, 'Yoshihiro Ike', '1963-08-25', 'M', 'Banda Sonora'),
(69, 'Kow Otani', '1957-11-23', 'M', 'Banda Sonora'),
(70, 'Ryo Takahashi', '1985-11-01', 'M', 'Banda Sonora'),
(71, 'Katsushi Sakurabi', NULL, 'M', 'Animação'),
(72, 'Fuuga Yamashiro', NULL, 'M', 'Animação'),
(73, 'Shinichiro Watanabe', '1965-05-24', 'M', 'Animação'),
(74, 'Masaaki Yuasa', '1965-04-16', 'M', 'Animação'),
(75, 'Akiyuki Shinbo', '1961-04-24', 'M', 'Animação'),
(76, 'Tatsuya Ishihara', '1972-01-24', 'M', 'Animação'),
(77, 'Sunao Katabuchi', '1960-08-19', 'M', 'Animação'),
(78, 'Kenji Nagasaki', '1981-01-01', 'M', 'Animação'),
(79, 'Haruo Sotozaki', '1973-01-01', 'M', 'Animação'),
(80, 'Hiroshi Kojina', '1970-01-01', 'M', 'Animação'),
(81, 'Hiroshi Hamasaki', '1972-01-01', 'M', 'Animação'),
(82, 'Shuhei Morita', '1978-01-01', 'M', 'Animação'),
(83, 'Shingo Natsume', '1980-01-01', 'M', 'Animação'),
(84, 'Tomohiko Ito', '1975-01-01', 'M', 'Animação'),
(85, 'Atsuko Ishizuka', '1979-09-19', 'F', 'Animação'),
(86, 'Kyohei Ishiguro', '1979-01-01', 'M', 'Animação'),
(87, 'Yuzuru Tachikawa', '1984-01-01', 'M', 'Animação'),
(88, 'Masaharu Watanabe', '1972-01-01', 'M', 'Animação'),
(89, 'Shuhei Yabuta', '1980-01-01', 'M', 'Animação'),
(90, 'Mamoru Hatakeyama', '1982-01-01', 'M', 'Animação'),
(91, 'Takaomi Kanasaki', '1972-01-01', 'M', 'Animação'),
(92, 'Shinji Takamatsu', '1972-01-01', 'M', 'Animação'),
(93, 'Shinji Ishihira', '1971-01-01', 'M', 'Animação'),
(94, 'Tatsuya Yoshihara', '1973-01-01', 'M', 'Animação'),
(95, 'Naokatsu Tsuda', '1968-01-01', 'M', 'Animação'),
(96, 'Seiji Kishi', '1971-01-08', 'M', 'Animação'),
(97, 'Ei Aoki', '1973-08-10', 'M', 'Animação'),
(98, 'Naoyoshi Shiotani', '1974-01-01', 'M', 'Animação'),
(99, 'Hiroyuki Imaishi', '1971-03-12', 'M', 'Animação'),
(100, 'Kenichi Shimizu', '1969-01-01', 'M', 'Animação'),
(101, 'Tomoki Kobayashi', '1976-01-01', 'M', 'Animação'),
(102, 'Taichi Ishidate', '1973-01-01', 'M', 'Animação'),
(103, 'Tatsuyuki Nagai', '1974-01-01', 'M', 'Animação'),
(104, 'Tomokazu Jinbo', '1965-01-01', 'M', 'Animação'),
(105, 'Kazuya Tsurumaki', '1966-04-25', 'M', 'Animação'),
(106, 'Hiroshi Nagahama', '1968-01-01', 'M', 'Animação'),
(107, 'Daisuke Nishio', '1954-08-18', 'M', 'Animação'),
(108, 'Yasunao Aoki', '1966-01-01', 'M', 'Animação'),
(109, 'Takuya Igarashi', '1970-11-28', 'M', 'Animação'),
(110, 'Yoshihide Ibata', '1974-01-01', 'M', 'Animação'),
(111, 'Shunsuke Tada', '1980-01-01', 'M', 'Animação'),
(112, 'Hirotaka Mori', '1980-01-01', 'M', 'Animação'),
(113, 'Kentaro Hara', '1980-01-01', 'M', 'Animação'),
(114, 'Hiroyuki Kakudou', '1962-01-01', 'M', 'Animação'),
(115, 'Manabu Okamoto', '1980-01-01', 'M', 'Animação'),
(116, 'Naoko Yamada', '1984-08-28', 'F', 'Animação'),
(117, 'Tetsuaki Watanabe', '1980-01-01', 'M', 'Animação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudioanimacao`
--

CREATE TABLE `estudioanimacao` (
  `Nome` varchar(100) NOT NULL,
  `AnoFundado` int(11) NOT NULL,
  `Fundador` varchar(100) NOT NULL,
  `SiteOficial` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `estudioanimacao`
--

INSERT INTO `estudioanimacao` (`Nome`, `AnoFundado`, `Fundador`, `SiteOficial`) VALUES
('8bit', 2008, 'Tsutomu Kasai', 'http://8bit-studio.co.jp'),
('A-1 Pictures', 2005, 'Masuo Ueda (via Aniplex)', 'https://a1p.jp'),
('ADV Films (Extinta)', 1992, 'John Ledford / Matt Greenfield / David Williams', 'Antigo: advfilms.com'),
('AIC (Anime International Company)', 1982, 'Toru Miura', 'https://www.anime-int.com'),
('Aniplex of America', 2005, 'Aniplex (Sony Music Entertainment Japan)', 'https://aniplexusa.com'),
('AQUA ARIS', 2017, 'Comitê Corporativo', 'http://aqua-aris.com'),
('Arms', 1996, 'Osamu Kaji', NULL),
('Artland', 1978, 'Noboru Ishiguro', NULL),
('Ashi Productions (Production Reed)', 1975, 'Toshihiko Sato', 'http://www.ashi-pro.co.jp'),
('Asmik Ace', 1985, 'Sumitomo Corporation', 'https://www.asmik-ace.co.jp'),
('Bandai Entertainment (Extinta)', 1998, 'Bandai', 'Antigo: bandai-ent.com'),
('Bandai Namco Music Live', 2022, 'Fusão de Lantis / Sunrise Music / Bandai Namco Arts', 'https://www.bandainamcomusiclive.co.jp'),
('bilibili', 2009, 'Xu Yi', 'https://www.bilibili.com'),
('Bones', 1998, 'Masahiko Minami / Hiroshi Ōsaka / Toshihiro Kawamoto', 'https://www.bones.co.jp'),
('Brain\'s Base', 1996, 'Kazumitsu Ozawa', 'http://www.brainsbase.co.jp'),
('BS Fuji', 1998, 'Fuji Media Holdings', 'https://www.bsfuji.tv'),
('Bushiroad', 2007, 'Takaaki Kidani', 'https://bushiroad.com'),
('CloverWorks', 2018, 'Aniplex (Masaaki Shimizu)', 'https://cloverworks.co.jp'),
('David Production', 2007, 'Koji Kajita', 'http://davidproduction.jp'),
('Discotek Media', 2005, 'Corporação/Investidores', 'http://www.discotekmedia.com'),
('DLE', 2001, 'Ryuta Shiiki', 'https://dle.jp'),
('Doga Kobo', 1973, 'Hideo Furusawa', 'http://www.dogakobo.com'),
('Gainax', 1984, 'Hideaki Anno', 'http://www.gainax.co.jp'),
('Geidai Animation', 2008, 'Tokyo University of the Arts (Geidai)', 'http://animation.geidai.ac.jp'),
('Geneon Entertainment USA (Extinta)', 2003, 'Pioneer Corporation', 'Antigo: geneonanimation.com'),
('Gonzo', 1992, 'Shouji Murahama / Mahiro Maeda / Hiroshi Yamaguchi / Shinji Higuchi', 'http://www.gonzo.co.jp'),
('Hololive Production', 2017, 'Motoaki \"Yagoo\" Tanigo (Cover Corp)', 'https://hololive.hololivepro.com'),
('iQIYI', 2010, 'Gong Yu (Baichuan)', 'https://www.iqiyi.com'),
('J.C.Staff', 1986, 'Tomoyuki Miyata', 'https://www.jcstaff.co.jp'),
('Kinema Citrus', 2008, 'Muneki Ogasawara', 'http://kinemacitrus.biz'),
('Kyoto Animation', 1981, 'Yoko Hatta / Hideaki Hatta', 'https://www.kyotoanimation.co.jp'),
('Lune-Pictures', 2011, 'Estúdio Independente', 'http://www.lune-pictures.co.jp'),
('Madhouse', 1972, 'Masao Maruyama / Osamu Dezaki / Rintaro / Yoshiaki Kawajiri', 'https://www.madhouse.co.jp'),
('Magic Bus', 1972, 'Satoshi Izumi', 'http://www.magicbus.co.jp'),
('Magic Capsule', 1999, 'Sadayoshi Fujino', 'http://www.magic-capsule.com'),
('Manglobe', 2002, 'Shinichirou Kobayashi', NULL),
('MAPPA', 2011, 'Masao Maruyama', 'https://www.mappa.co.jp'),
('Mediabank', 1999, 'Corporação de Licenciamento', 'http://www.mediabank.co.jp'),
('Movic', 1983, 'Animate', 'https://www.movic.jp'),
('Nihon Ad Systems (NAS)', 1975, 'Asatsu-DK', 'http://www.nasinc.co.jp'),
('OLM', 1994, 'Toshiaki Okuno / Shukichi Kanda / Kunihiko Yuyama / OLM Group', 'https://olm.co.jp'),
('P.A. Works', 2000, 'Kenji Horikawa', 'https://www.pa-works.co.jp'),
('Production I.G', 1987, 'Mitsuhisa Ishikawa / Takayuki Goto', 'https://www.production-ig.co.jp'),
('Sammy', 1975, 'Hajime Satomi', 'https://www.sammy.co.jp'),
('Satelight', 1995, 'Michiaki Sato', 'http://www.satelight.co.jp'),
('Science SARU', 2013, 'Masaaki Yuasa / Eunyoung Choi', 'https://www.sciencesaru.com'),
('Seven', 2007, 'Toshihiro Hirano', 'http://www.studio-seven.co.jp'),
('Shaft', 1975, 'Hiroshi Wakao', 'http://www.shaft-web.co.jp'),
('Showgate (Lantis/Bandai Namco)', 2005, 'Toshiba', 'http://www.showgate.jp'),
('Shueisha', 1925, 'Shogakukan', 'https://www.shueisha.co.jp'),
('SILVER LINK.', 2007, 'Hayato Kaneko', 'http://www.silverlink.co.jp'),
('Studio Bind', 2019, 'White Fox & Egg Firm', 'http://www.st-bind.jp'),
('Studio Deen', 1975, 'Hiroshi Hasegawa', 'https://www.deen.co.jp'),
('Studio Gallop', 1978, 'Akio Wakana', 'http://www.anime-gallop.co.jp'),
('Studio Mausu', 2005, 'Mausu Promotion', 'http://www.mausu.net'),
('Studio Pierrot', 1979, 'Yuji Nunokawa', 'https://pierrot.jp'),
('Studio Shuka', 2013, 'Takahiro Omori / Takahiro Ishikawa', 'http://www.shuka.co.jp'),
('Studio VOLN', 2014, 'Keiji Mita / Mikihiro Iwata', 'http://www.voln.co.jp'),
('Sunrise (Bandai Namco Filmworks)', 1972, 'Ex-membros da Mushi Production', 'https://www.bn-filmworks.co.jp'),
('T-Rex', 2008, 'Estúdio Independente', NULL),
('Tatsunoko Production', 1962, 'Tatsuo Yoshida / Kenji Yoshida / Toyoharu Yoshida', 'https://www.tatsunoko.co.jp'),
('TBS (Tokyo Broadcasting System)', 1951, 'Governo do Japão / Iniciativa Privada', 'https://www.tbs.co.jp'),
('Tencent Video', 2011, 'Tencent', 'https://v.qq.com'),
('Tezuka Productions', 1968, 'Osamu Tezuka', 'https://www.tezuka.co.jp'),
('TMS Entertainment', 1946, 'Yutaka Fujioka', 'https://www.tms-e.co.jp'),
('Toei Animation', 1948, 'Kenzō Masaoka / Zenjirō Yamamoto', 'https://www.toei-anim.co.jp'),
('TOHO', 1932, 'Ichizō Kobayashi', 'https://www.toho.co.jp'),
('TOHO animation', 2012, 'TOHO', 'https://tohoanimation.jp'),
('TOHO animation STUDIO', 2017, 'TOHO / OLM (colaboração)', 'https://tohoanimation.jp'),
('Trigger', 2011, 'Hiroyuki Imaishi', 'http://www.st-trigger.co.jp'),
('ufotable', 2000, 'Hikaru Kondo', 'http://www.ufotable.com'),
('Warner Bros. Japan', 1992, 'Warner Bros.', 'https://www.warnerbros.co.jp'),
('White Fox', 2007, 'Gaku Iwasa', 'http://www.w-fox.co.jp'),
('Wit Studio', 2012, 'George Wada / Tetsuya Nakatake', 'https://www.witstudio.co.jp'),
('Youku', 2006, 'Victor Koo', 'https://www.youku.com'),
('Zero-G', 2011, 'Hiroshi Negishi', 'http://zerog2.jp');

-- --------------------------------------------------------

--
-- Estrutura da tabela `generos`
--

CREATE TABLE `generos` (
  `IdGenero` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `generos`
--

INSERT INTO `generos` (`IdGenero`, `Nome`, `Descricao`) VALUES
(1, 'Action', 'Focado em combates, lutas, perseguições e cenas de alta energia física. O ritmo costuma ser acelerado e cheio de adrenalina.'),
(2, 'Adventure', 'Centrado em jornadas, exploração de novos mundos e a busca por um objetivo ou tesouro. A evolução dos personagens ao longo da viagem é o ponto forte.'),
(3, 'Sports', 'Histórias focadas em competições atléticas (futebol, basquete, natação, etc.). Explora o trabalho em equipe, a superação pessoal e o esforço para vencer.'),
(4, 'Drama', 'Histórias intensas que focam no desenvolvimento emocional dos personagens, lidando com conflitos profundos, tragédias, dilemas morais e sentimentos realistas.'),
(5, 'Romance', 'O foco principal é o desenvolvimento de um relacionamento amoroso entre os personagens, mostrando a paixão, os obstáculos e a evolução do casal.'),
(6, 'Comedy', 'Feito para fazer rir. Usa de piadas, situações absurdas, mal-entendidos e sátiras para entreter o público.'),
(7, 'Slice of Life', 'Mostra o dia a dia comum de personagens comuns (na escola, no trabalho ou em casa). Não foca em grandes conflitos, mas sim na beleza da vida cotidiana.'),
(8, 'Gourmet', 'Centrado na culinária. As histórias giram em torno do preparo de pratos, apreciação de comida e a paixão pela gastronomia (muitas vezes com reações exageradas ao saborear algo).'),
(9, 'Yaoi', 'Histórias focadas em relacionamentos românticos e/ou afetivos entre personagens masculinos.'),
(10, 'Yuri', 'Histórias focadas em relacionamentos românticos e/ou afetivos entre personagens femininos.'),
(11, 'Suspense', 'Mantém o público ansioso e tenso, criando uma atmosfera de incerteza e perigo iminente.'),
(12, 'Mystery', 'Gira em torno de um enigma, crime ou segredo que precisa ser resolvido. Personagens e o público tentam juntar as pistas ao longo da história.'),
(13, 'Horror', 'Feito para assustar, chocar ou causar desconforto. Envolve elementos macabros, monstros, violência ou terror psicológico.'),
(14, 'Supernatural', 'Envolve fenômenos que desafiam as leis da natureza, como fantasmas, deuses, espíritos, maldições e o mundo pós-morte, geralmente inseridos no mundo real.'),
(15, 'Fantasy', 'Ambientado em mundos completamente imaginários com suas próprias regras, magia, criaturas mitológicas (elfos, dragões) e cavaleiros.'),
(16, 'Sci-Fi', 'Histórias baseadas em conceitos científicos e tecnológicos avançados, como viagens espaciais, viagem no tempo, robôs, inteligência artificial e futuros distópicos.'),
(17, 'Avant Garde', 'Obras experimentais, artísticas e abstratas. Desafiam as estruturas tradicionais de narrativa e costumam ser cheias de simbolismos complexos e visuais bizarros.'),
(18, 'Award Winning', 'Não é um gênero temático, mas uma categoria para obras que ganharam prêmios de prestígio da indústria devido à sua alta qualidade técnica, artística ou de roteiro.'),
(19, 'Ecchi', 'Histórias com forte teor de apelo sexual, sensualidade e erotismo leve (geralmente usado para fins cômicos ou de fã-serviço), mas sem mostrar atos sexuais explícitos.'),
(20, 'Hentai', 'Conteúdo estritamente pornográfico e adulto, focado em relações sexuais explícitas.');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animediretor`
--
ALTER TABLE `animediretor`
  ADD KEY `idAnime` (`idAnime`),
  ADD KEY `idDiretor` (`idDiretor`);

--
-- Índices para tabela `animeestudios`
--
ALTER TABLE `animeestudios`
  ADD KEY `estudio` (`estudio`),
  ADD KEY `IdAnime` (`IdAnime`);

--
-- Índices para tabela `animegeneros`
--
ALTER TABLE `animegeneros`
  ADD KEY `IdAnime` (`IdAnime`),
  ADD KEY `IdGenero` (`IdGenero`);

--
-- Índices para tabela `animes`
--
ALTER TABLE `animes`
  ADD PRIMARY KEY (`IdAnime`);

--
-- Índices para tabela `animevozes`
--
ALTER TABLE `animevozes`
  ADD KEY `IdAnime` (`IdAnime`),
  ADD KEY `IdAtorVoz` (`IdAtorVoz`);

--
-- Índices para tabela `atorvoz`
--
ALTER TABLE `atorvoz`
  ADD PRIMARY KEY (`IdAtorVoz`);

--
-- Índices para tabela `bandasonora`
--
ALTER TABLE `bandasonora`
  ADD PRIMARY KEY (`IdBandaSonora`),
  ADD KEY `bandasonora_ibfk_1` (`IdAnime`);

--
-- Índices para tabela `diretor`
--
ALTER TABLE `diretor`
  ADD PRIMARY KEY (`IdDiretor`);

--
-- Índices para tabela `estudioanimacao`
--
ALTER TABLE `estudioanimacao`
  ADD PRIMARY KEY (`Nome`);

--
-- Índices para tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`IdGenero`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animes`
--
ALTER TABLE `animes`
  MODIFY `IdAnime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT de tabela `atorvoz`
--
ALTER TABLE `atorvoz`
  MODIFY `IdAtorVoz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de tabela `bandasonora`
--
ALTER TABLE `bandasonora`
  MODIFY `IdBandaSonora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `diretor`
--
ALTER TABLE `diretor`
  MODIFY `IdDiretor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `IdGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animediretor`
--
ALTER TABLE `animediretor`
  ADD CONSTRAINT `animediretor_ibfk_1` FOREIGN KEY (`idAnime`) REFERENCES `animes` (`IdAnime`),
  ADD CONSTRAINT `animediretor_ibfk_2` FOREIGN KEY (`idDiretor`) REFERENCES `diretor` (`IdDiretor`);

--
-- Limitadores para a tabela `animeestudios`
--
ALTER TABLE `animeestudios`
  ADD CONSTRAINT `animeEstudios_ibfk_1` FOREIGN KEY (`estudio`) REFERENCES `estudioanimacao` (`Nome`),
  ADD CONSTRAINT `animeEstudios_ibfk_2` FOREIGN KEY (`IdAnime`) REFERENCES `animes` (`IdAnime`);

--
-- Limitadores para a tabela `animegeneros`
--
ALTER TABLE `animegeneros`
  ADD CONSTRAINT `AnimeGeneros_ibfk_1` FOREIGN KEY (`IdAnime`) REFERENCES `animes` (`IdAnime`),
  ADD CONSTRAINT `AnimeGeneros_ibfk_2` FOREIGN KEY (`IdGenero`) REFERENCES `generos` (`IdGenero`);

--
-- Limitadores para a tabela `animevozes`
--
ALTER TABLE `animevozes`
  ADD CONSTRAINT `animevozes_ibfk_1` FOREIGN KEY (`IdAnime`) REFERENCES `animes` (`IdAnime`),
  ADD CONSTRAINT `animevozes_ibfk_2` FOREIGN KEY (`IdAtorVoz`) REFERENCES `atorvoz` (`IdAtorVoz`);

--
-- Limitadores para a tabela `bandasonora`
--
ALTER TABLE `bandasonora`
  ADD CONSTRAINT `bandasonora_ibfk_1` FOREIGN KEY (`IdAnime`) REFERENCES `animes` (`IdAnime`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
