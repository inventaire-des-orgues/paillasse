-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql51-86.perso
-- Généré le :  Dim 07 mars 2021 à 13:19
-- Version du serveur :  5.6.50-log
-- Version de PHP :  7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `orguepay`
--

-- --------------------------------------------------------

--
-- Structure de la table `inventaire_historique`
--

CREATE TABLE `inventaire_historique` (
  `id` int(11) NOT NULL,
  `historique` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inventaire_historique`
--

INSERT INTO `inventaire_historique` (`id`, `historique`) VALUES
(1, '1939 : construction par Gloton-Debierre. L\\\'orgue n\\\'est installé qu\\\'en 1955 par Beuchet-Debierre (2 cl. 30 jeux).\n1985 : restauration par Renaud (3 cl. 42 jeux). Relevage et réharmonisation par Robert Frères en 2009. Midification des transmissions en 2015.'),
(2, 'LE GRAND ORGUE : Les documents précis témoignent de la présence d\\\'un orgue dans la Cathédrale Saint-Pierre de Nantes dès le XVème siècle, époque à laquelle l\\\'édifice est érigé. L\\\'orgue à l\\\'origine de celui que nous connaissons aujourd\\\'hui est l\\\'œuvre de Jacques GIRARDET et date de 1619. La composition exacte de l\\\'orgue de Girardet n\\\'est pas facile à déduire d\\\'après le texte du devis de 1619. L\\\'étendue de notes pose problème (Ut à Ut avec le premier Ut# ou avec ravalements), les deux Nasards du grand orgue sont-ils Nasard 2 2/3 et Quarte 2 s\\\'alliant avec le Nasard ou deux Nasards de forme et de tailles différentes ?\nEn 1744, Â« COLLAR, facteur d\\\'orgues à Paris Â» procède au relevage de l\\\'instrument avec un ouvrier. Le travail dure 9 mois et le Chapitre paie 54 livres au logeur Â« pour le loyer du lit et du linge Â». Adrien LÉPINE est appelé en 1767 pour diverses réparations et la pose d\\\'un 5ème clavier avec un jeu de Bombarde pour la somme de 3 300 livres. L\\\'année suivante, ce même facteur augmente l\\\'orgue de plusieurs jeux : Grosse Tierce, Grosse Fourniture, Basson, Hautbois et Trompette du Récit. En 1768, une extension du buffet s\\\'avère nécessaire ; elle est réalisée par l\\\'adjonction de deux tourelles latérales soutenues par des atlantes. En 1780, le Chapitre est alerté par l\\\'organiste Denis JOUBERT de l\\\'urgence de travaux à entreprendre. C\\\'est François-Henri CLICQUOT, Â« Facteur du Roy Â» qui est désigné. Le prix réclamé (20 000 livres payables en 4 ans) laisse supposer qu\\\'il s\\\'agit en fait d\\\'une reconstruction. CLICQUOT livre en 1784 un instrument de 52 jeux répartis sur 5 claviers manuels et un pédalier de 32 notes avec grand ravalement au fa. Sur l\\\'écusson du tuyau milieu de la plate face gauche, on pouvait lire : Â« CLICQUOT, facteur du Roi, a refait cet orgue à neuf en 1784â€³.A la Révolution, Denis JOUBERT sauve l\\\'orgue neuf de la vente ou de la destruction en le faisant participer aux fêtes révolutionnaires qui se déroulent à la Cathédrale.\nEn 1833, une décision du Chapitre confia à GEIGER, un facteur de Nantes, le soin de relever le Grand Orgue. Mais on ne fit qu\\\'un travail incomplet, puisqu\\\'on omit d\\\'améliorer la soufflerie. Le 8 octobre 1849, un rapport sur l\\\'orgue est minutieusement détaillé par M. HAMEL, délégué du Ministre des Cultes. C\\\'était l\\\'époque oÃ¹ l\\\'on construisait le chœur de la Cathédrale resté inachevé. Il fut terminé en 1893. Vers 1850, l\\\'organiste MINARD se fait plus pressant encore. Mais il faut attendre 1868 pour voir l\\\'instrument restauré par MERKLIN, facteur qui a été préféré à CAVAILLÉ-COLL (1866) en raison d\\\'un devis moins élevé. Malgré quelques modifications, l\\\'orgue de Clicquot est conservé, Son travail consistera : au remplacement de la soufflerie et du pédalier à la française par un pédalier à l\\\'allemande de 32 notes, aux modifications de jeux suivantes :\nPositif : Salicional 8 à la place du Plein Jeu.\nFlûte octaviante 4 à la place de la Tierce.\nGrand Orgue : Flûte Harmonique 8 et Gambe 8 à la place de Nasard, Grosse Tierce et Tierce.\nRécit : Ajout d\\\'un Bourdon 8.\nAu terme de ces travaux, l\\\'instrument restait dépourvu de pédales d\\\'accouplement, tirasses, etc. D\\\'après le devis, les Bourdons restaient à calottes soudées.\nL\\\'Abbé Marcel COURTONNE, nommé titulaire en 1922, écrivait en tête de sa plaquette Â« l\\\'Orgue de la Cathédrale de Nantes Â» (septembre 1924) : Â« Si l\\\'on doit pieusement conserver ce qui fait l\\\'originalité et l\\\'intérêt d\\\'un tel instrument, on peut, on doit même y apporter les perfectionnements de notre époque Â». C\\\'est donc à sa demande que de nouveaux travaux sont entrepris sur le Grand Orgue par GLOTON, successeur de DEBIERRE. Une console pneumatique de 4 claviers remplace l\\\'ancienne console de 5 claviers en fenêtre. La mise en place d\\\'un Récit expressif et l\\\'enrichissement de la palette sonore par l\\\'ajout de 14 jeux permettent l\\\'interprétation de la littérature romantique et symphonique. Le 15 juin 1944, l\\\'orgue subit des dégâts à la suite d\\\'un violent bombardement sur Nantes. Un dommage de guerre affecté à l\\\'instrument permet d\\\'envisager une restauration. Un projet ambitieux de Joseph BEUCHET (porter l\\\'orgue de 53 à 89 jeux, en deux tranches de travaux) est accepté. Mais des travaux sur les voûtes de la nef repoussent l\\\'inauguration de l\\\'instrument au 21 novembre 1971. Gaston LITAIZE, Rapporteur officiel donne le traditionnel récital. L\\\'harmonisation de l\\\'orgue a été confiée à ELAIN pour les fonds et à DOUDARD pour les anches. L\\\'orgue actuel possède 74 jeux réels sur 4 claviers manuels de 61 notes et l\\\'incendie des combles de la Cathédrale en 1972 ne causa pas de graves préjudices à l\\\'instrument qui fut simplement nettoyé lors de la réouverture de la Cathédrale et ré-accordé par l\\\'harmoniste de la Maison BEUCHET-DEBIERRE, Claude THIBAUD.'),
(3, '1501 : Tribune et orgue neufs de Evrard Baudot.\n1535 : restauration par Pierre Bert, et buffet neuf de Sainctot Chemin sur la tribune ancienne. Travaux en 1669 (Miller), 1703 (Ingoult, sommier neuf), puis diverses interventions de Henri Parizot en 1761, 1773, 1775, 1780.\nAprès la Révolution, réparation dès 1801, puis en 1821 (Huet), 1826 (Hamard), 1840 (Guillouard). L\\\'orgue a alors 12 jeux sur un seul clavier.\n1894 : orgue neuf de Jean-Frédéric Baldner (8 jeux).\n1938 : orgue neuf de Paul Beurtin (15 jeux, 2 cl.)\n1985 : orgue neuf de Jean Renaud.'),
(4, '1885 : construction par Louis Debierre. Relevage en 1915.\n1945 : restauration par Gloton-Debierre.\n1973 : relevage par Jean Renaud.'),
(5, '1855 : construction par Aristide Cavaillé-Coll pour l\\\'Exposition Universelle (4 cl. 54 jeux, avec deux claviers expressifs).\n1857 : installation à Luçon, à l\\\'exception du Grand Récit, remonté à Castelnau dÂ´Estrétefonds (33) et remplacé par un clavier à anches libres. Relevage en 1899 par Debierre.\n1968 : restauration par Schwenkedel avec nouveau clavier d\\\'Echo.'),
(19, '1891 : construction par Louis Debierre\n1929 : restauration Gloton-Debierre\n1981 : restauration Jean Renaud'),
(6, '1882 : construction par Louis Debierre. Relevages en 1983 (bénévoles), 1995 (Renaud) et 2005 (MBGO).'),
(7, '2000 : Construction par Denis Londe.'),
(17, 'Fin XVIIe s. : construction par Brunel (?). Travaux en 1731, puis en 1772 (sommiers et mécanique neufs de Jean Le Roy). En 1795, l\\\'orgue 3 cl. et 15 jeux.\n1926 : reconstruction par Gloton-Debierre (14 jeux, 2 cl.)\n1986 : reconstruction par Renaud.'),
(18, 'Premières mentions d\'un orgue en 1116 dans les Actes pontificaux.\n1531 : grand orgue neuf de Pierre Bert dans un buffet de Simon Hayneufve (env. 20 jeux, 2 cl.)\n1651 : Restauration par Jean et François De Héman. Travaux en 1700 par Marin Ingoult, puis en 1734 par Nicolas Collard.\n1833 et 1849 : restaurations par les Frères Claude. Travaux en 1872 par Joseph Merklin.\n1913 : restauration par l\'abbé Victor Tronchet.\n1958 : Début de restauration par Pierre Chéron.\n1974 : fin de restauration par Beuchet-Debierre (mécanisme) et Danion-Gonzalez (tuyauterie).\n2018 : restauration par Jacques Nonnet et Laurent Plet.'),
(8, '1863 : premier orgue de Louis Debierre.\n1937 : relevage par Gloton-Debierre.\n2008 : relevage par MBGO.'),
(9, '1367, 1369 : Premières mentions d\\\'un facteur d\\\'orgues - Guillaume Pichot - et d\\\'un organiste - Pierre Cholet - dans les registres de la Fabrique.\n1416-1417 : Nouvel orgue de Jean Chabencel, avec buffet de Jean Le Flamand, sur une tribune en encorbellement au fond de la nef.\n1451 (7 juillet) : Incendie dû à la foudre. Restauration par Anatole Prégent à partir de 1466, avec nouvelle tribune sur toute la largeur de la nef.\n1507-1513 : Nouvel orgue offert par Anne de Bretagne, installé sur la tribune existante, par Ponthus Jousseline, dans un buffet de Jacques Colleau, avec positif et trompes de pédale offertes par Olivier Barrault, maire d\\\'Angers.\n1533 (18 octobre) : Incendie dans les tours. Restauration par Pierre Bert à partir de 1541 - 29 jeux, dont 15 au GO. et 7 à chacun des deux autres claviers.\n1617 (26 mai) : Nouvel incendie dû à la foudre. Restauration par Jacques Girardet. Installation d\\\'un pédalier par Marin Ingoult en 1701 - 47 jeux.\n1742-1748 : Restauration par Jean Dangeville, dans un buffet neuf de Pierre-Étienne Surugue - 47 jeux sur 4 claviers. Diverses modifications au début du XIXe s. par Christian Nyssen, Claude frères, Louis Lair\n1869-1873 : Nouvel orgue d\\\'Aristide Cavaillé-Coll - 46 jeux sur 3 claviers. Relevages par Debierre et Gloton en 1907 et 1937.\n1957-1959 : Restauration et électrification par Beuchet-Debierre - 65 jeux.\n2008 : Installation d\\\'un combinateur informatique par Denis Lacorre.'),
(10, '1512 : premier orgue.\n1632 : reconstruction par Maillard. Restaurations en 1694 (Guiton), 1765 (Dangeville), 1789 (Luck) et 1829.\n1850 : orgue neuf de Bonn.\n1874 : reconstruction et agrandissement dans la nouvelle église par Bonn.\n1884 : agrandissement par Debierre.\n1934 : reconstruction par Gloton.\n1994 : reconstruction par MLGO.'),
(16, 'Existence d\\\'un orgue attestée dès 1622 (19 jeux, 2 cl. 45 n. et péd. 10 n.) probablement placé dans un des bras du transept.\n1637-40 : restauration par Ambroise Levasseur, dans un buffet neuf de Pierre Frileux et Pierre Cornet avec sculptures de Mathurin Jousse ; tribune de Jacques Nadreau (28 jeux (?), 3 cl. 48/25 n. et un péd. 17 n.)\n1772 : restauration Dangeville : quatrième clavier, pédalier porté à 24 notes.\nDivers travaux et amputations au XIXe siècle.\n1936-63 : diverses campagnes de restauration (Gonzalez).\n1996 : reconstitution de l\\\'orgue du XVIIIe siècle par Benoist & Sarelot.'),
(11, '1954 : orgue neuf Beuchet-Debierre - 2 cl. 21 jeux. Relevage en 1983 par Renaud.\n2008 : Restauration par DLFO - 3 cl. 25 jeux.'),
(21, '1995 : orgue neuf de Dominique Oberthur.'),
(12, '1417 : Don par Yolande d\\\'Aragon du petit orgue de la chapelle du château, dont on voit les traces de la tribune dans la galerie du transept nord.\n1512 : reconstruction par Jean Vallin, avec les restes du grand orgue reconstruit par Jousseline. Travaux en 1521 (Bert) et 1531.\n1699 : transfert au fond du chœur.\n1773 : incorporation de cet instrument dans le grand orgue.\n1837 : nouvel orgue de chœur par Wagener et Claude.\n1851 : nouvel orgue de chœur, enfoui dans le sol, par Bonn (2 cl., 12 jeux).\n1856 : orgue \\\"exhumé\\\" et nouveau buffet de Chapeau.\n1913 : relevage par Debierre.\n1948 : relevage par Beuchet-Debierre.\n1967 : électrification et agrandissement par Beuchet-Debierre.'),
(13, '1466 : Première mention de réparations à lÂ´orgue - par René Pavajaud - trente-deux ans après le début de la construction de la cathédrale.\n1531 : orgue neuf de Grégoire Ambrosy, augmenté en 1555.\n1619 : orgue neuf de Jacques Girardet, sur une nouvelle tribune. La partie centrale du buffet ainsi que le positif datent de cette époque - 28 jeux sur 2 cl. et pédale. Diverses réparations en 1634 (Tribolé), 1672 et 1674 (Morlet), 1686 (Bridard), 1698 (Vincent) et 1744 (Collar).\n1767-68 : agrandissement par Adrien Lépine, qui élargit le buffet à son état actuel et ajoute six jeux.\n1780-84 : reconstruction par François-Henri Clicquot : 5 claviers, 52 jeux.\n1804 : réparations par Nyssen, puis en 1833 par Geiger. Projets de Daublaine-Callinet, Ducrocquet, Cavaillé-Coll.\n1866-68 : restauration par Joseph Merklin.\n1927-33 : reconstruction par Gloton-Debierre : 4 claviers, 53 jeux.\n1961-1971 : reconstruction par Beuchet-Debierre : 4 claviers, 74 jeux (89 prévus).\n2005 : Pose d´un combinateur par Joël Pétrique.\n2020 : destruction dans un incendie (18 juillet).'),
(14, '1896 : construction par Louis Debierre\n1944 : restauration par Gloton-Debierre. Relevages en 1955 (Beuchet-Debierre) et 1985 (Renaud)\n1993 : restauration par Jean Renaud\n2013 : console mobile par MBGO'),
(15, '1925 : orgue neuf de Gloton-Debierre.\n1970 : relevage par Beuchet-Debierre.\n1995 : relevage par Jean-Pascal Villard.\n2019 : restauration par Nicolas Toussaint avec ajout de jeux à la Pédale.'),
(20, 'Il existait depuis le XVIIe siècle un orgue dans l\\\'ancienne collégiale de Craon, détruit à la Révolution.\n1856 : orgue neuf de Stoltz et Goyadin (17 jeux, 2 cl.)\n1964 : restauration par Beuchet-Debierre.\n2003 : restauration par Jean-Loup Boisseau, avec Positif de dos neuf.'),
(22, 'Années 1960 : orgue construit par Verschuren pour l\\\'église des Carmes de Boxmeer (NL). Transféré au couvent des Carmes de Nantes, puis à la chapelle des Bénédictines du Calvaire d\\\'Angers en 2007.'),
(23, 'Orgue polyphone construit par Louis Debierre, installé dans l\\\'église Ste-Marie en 1954.\n2009 : restauration par Philippe Emeriau.'),
(30, '1876Â : construction par Damiens Frères (1 cl. 10 jeux). Travaux d\\\'entretien en 1966 et 1976.\n2008Â : reconstruction par Conan-Lemercier avec nouvelle tourelle centrale. '),
(78, NULL),
(79, '1644 : petit orgue de Paul Maillard, probablement constitué d\\\'éléments d\\\'occasion repris de l\\\'ancien orgue de Baugé.\n1865Â : orgue neuf par Louis Bonn, constitué d\\\'éléments d\\\'occasion (2 cl. 11 jeux), avec console à l\\\'arrière du buffet.\n1875Â : nouvelle console indépendante de Louis Debierre, et fourniture de trois jeux neufs (Kéraulophone, Gambe, Clarinette).\n1953Â : travaux par Jean Jonet et Jean Perroux, à l\\\'initiative de Marcel Dupré, avec soufflerie électrique et adjonction (inachevée) des jeux de pédale.'),
(24, '1962 : orgue neuf de Pierre Chéron.\n1972 : orgue neuf d\\\'Yves Koenig.\n1992 : restauration par Kuhn.'),
(34, 'XVIIIe : présence dÂ´un orgue de 3 cl., saccagé en 1793 (17 jeux, 3 cl.)\nXIXe : construction dÂ´un nouvel orgue par Ducroquet.\n1895 : installation dans le buffet Ducroquet par Debierre dÂ´un orgue de salon provenant de la Rochelle (8 jeux, 2 cl.) et de la console de lÂ´orgue Cavaillé-Coll de St-Clément de Nantes.\n1972 : restauration par Renaud sur les plans du compositeur croisicais Jean Durbin.'),
(29, '1895 : orgue neuf des frères Van Bever pour le collège St-Grégoire de Tours. Cet orgue est démonté en 1985.\n1921 : installation à St-Philbert-de-Grand-Lieu.'),
(25, '1983 : construction par Philippe Emeriau.\n1993 : ajout de 7 jeux par Philippe Emeriau.'),
(26, '1847 : Premier orgue par les frères Lelogeais dans le chœur de l\\\'église (16 jeux, 2 cl.) installé en tribune par Louis Debierre en 1872.\nVers 1915 : transfert en tribune de l\\\'orgue de chœur de Cavaillé-Coll.\n1989 : grand orgue neuf d\\\'Yves Koenig.'),
(27, '1982 : orgue neuf de Gérard Guillemin, acheté d\\\'occasion par la Ville en 1985.'),
(28, '1903 : orgue neuf Louis Debierre, transféré dans le transept en 1955.\n1965-1969 : reconstruction par Beuchet-Debiere.'),
(39, '1885 : orgue neuf de Joseph Merklin\n? : transformation par Pierre Chéron\n1976 : transformation par Benoist-Sarélot'),
(74, '1880 : construction par Louis Debierre.'),
(75, '1881 : construction d\\\'un orgue de chœur par Louis Debierre (2 cl. 15 jeux)\n1971 : reconstruction par Jean Renaud\n2015 : destruction dans un incendie (15 juin).'),
(76, '1655 : construction par Raymond Bouvet à partir dÂ´un orgue de Lorenzi (1855) provenant dÂ´Aigrefeuille-sur-Maine et de tuyauterie importée des îles anglo-normandes.'),
(77, '1891 : orgue de Louis Debierre, relevé par Gloton en 1928.\n1983 : restauration de Claude Madigout (Fourniture neuve à la place de la Voix céleste)'),
(31, '1840 : construction par Daublaine-Callinet, démonté par Cavaillé-Coll en 1868 pour la réfection de la tribune.\n1950 à 1972 : agrandissements successifs par Pierre Chéron puis Yves Sévère.'),
(73, 'Orgue construit au XIXe siècle par Jean-Baptiste Le Logeais.\n1925 : restauration par Gloton-Debierre.\n1976 : restauration par Jean Renaud.'),
(35, '1880 : installation par Debierre dÂ´un orgue Cavaillé-Coll provenant de Notre-Dame-dÂ´Espérance de St-Brieuc.\n1911 : modifications par Debierre.\n1925 : ventilateur électrique installé par Gloton.\n1969 : restauration par Beuchet-Debierre.\n1971 : restauration par Renaud.\n1997 : reconstruction par Sévère.'),
(37, '1967 : construction par Kurt Schwenkedel, harmonie de Laurent Steinmetz.\nTravaux d\\\'entretien en 1977 (Pierre Chéron), 2009 (DLFO) et 2010 (Jean-Marie Tricoteaux).'),
(72, '1899 : construction par Louis Debierre pour lÂ´Institut des Jeunes Aveugles de Nantes.\n1976 : déménagement de lÂ´Institut à Vertou et reconstruction de lÂ´orgue par Beuchet-Debierre.'),
(32, '1903 : construction par Louis Debierre.\n2009 : remise en service partielle par Philippe Emeriau.'),
(33, '1926 : achat d\\\'occasion d\\\'un orgue Cavaillé-Coll-Convers conçu par Jean Huré.'),
(36, '1862 : installation dans l\'église d\'un orgue ancien (attesté en 1844) provenant de la chapelle du château (1 cl. 6 jeux, avec pédalier à la française en tirasse).\n1946 : restauration par Firmin.\n1962 : installation d\'un ventilateur.\n2007 : reconstruction par Conan et Lemercier.\n\n'),
(45, '1931 : construction par Gloton-Debierre.\n1960 : travaux Beuchet-Debierre.'),
(46, ''),
(47, '1901 : construction dÂ´un orgue (3 cl. 42 jeux) par Louis Debierre, détruit par les bombardements en 1943.\n1963 : nouvel orgue Beuchet-Debierre, réutilisant la soufflerie et le soubassement du buffet de lÂ´orgue précédent (27 jeux)\n1985 : achèvement de lÂ´orgue par Jean Renaud avec du matériel Beuchet-Debierre.\n2002 : restauration et modifications par Bernard Hurvy.'),
(48, '1899 : transfert par Louis Debierre de l\\\'orgue de chœur Cavaillé-Coll de lÂ´église Saint-Clément (1867).\n1946 : modifications par Gloton-Debierre.\n2002 : relevage par MBGO.'),
(49, '1984 : orgue Oberthur réutilisant la tuyauterie de l\\\'ancien orgue Weltzel (1870) de Saint-Jean de Belfort.\n'),
(50, 'Orgue attribué à Alizon (Mirecourt début XIXe siècle)\n2007 : reconstruction par MBGO.'),
(51, '1946 : installation dans la tribune de l\\\'église de Chemillé par Gloton-Debierre d\\\'un orgue Merklin construit pour M. et Mme Raimbaud à Angers.\n1969 : l\\\'orgue est descendu dans la nef, électrifié et transformé par Roger Lambert.\n1993 : reconstruction par MBGO.'),
(52, '2003 : construction par MBGO.'),
(53, NULL),
(54, '1960-64 : construction par Bouvet et Renaud.'),
(55, '2002 : orgue neuf François Delhumeau\n2009 : complément de trois jeux neufs François Delhumeau'),
(56, NULL),
(57, 'Offert par une paroissienne\nInauguration en 1935 par André Marchal'),
(58, '1980 : construction par Oberthur, avec réemploi de sommiers Beuchet-Debierre.'),
(59, '1955-59 : Remontage puis agrandissement (1961) de lÂ´ancien orgue Stoltz de St-Laud dÂ´Angers (1892) dans lÂ´ancien buffet Cavaillé-Coll de St-Ferdinand-des-Ternes à Paris.\n1984 : Agrandissement par Jean Renaud.\n'),
(60, '1893 : construction par Louis Debierre.\n1978 : restauration-transformation par Beuchet-Debierre.\n1993 : relevage et réharmonisation par Bernard Hurvy.\n2013 : relevage et pose dÂ´un combinateur par Robert Frères.'),
(61, '1945 : construction par Gloton-Debierre.\n1994 : relevage par Claude Thibaud.'),
(62, '1912 : orgue de Louis Debierre incorporant des éléments anciens et installé successivement chez les Réparatrices (jusquÂ´en 1933), à l\\\'Externat des Enfants Nantais (1944) puis chez les Franciscains (1960, avec modifications).\n1988 : remontage de lÂ´orgue à Thouaré par Claude Thibaud.\n1994 : modifications par Bernard Hurvy.'),
(63, '1851 : construction par Le Logeais (2 cl. 14 jeux).\n1881 : restauration et transformation par Louis Debierre.\n1982 : reconstruction par Dominique Oberthur.'),
(64, '1979-2003 : début de construction par une équipe de bénévoles\n2005 : achèvement par Jean-Pierre Conan\nLe buffet d\\\'orgue allie le classicisme des formes (larges corniches et moulures en chêne massif) et art contemporain : l\\\'ange qui jaillit de l\\\'instrument au milieu des tuyaux est l\\\'oeuvre de l\\\'artiste plasticienne Laurence Bernot (2005).'),
(65, '1896 : construction par les frères Abbey pour l\\\'institution St Nicolas d\\\'Issy-les-Moulineaux\n1950 : travaux par Beuchet-Debierre\n1982 : installation au Poiré-sur-Vie par Bernard Chevrier\n200 : restauration par Robert Frères'),
(66, '1844 : orgue Lapeyre pour St-Symphorien de Tours.\n1890 : reconstruction à Fontenay-le-Comte par Louis Debierre.\n1965 : restauration par Henri Deliancourt.\n1994 : démontage et remisage dans les réserves de la Ville.'),
(67, '1989 : construction par Gérald Guillemin.'),
(68, 'Orgue provenant du conservatoire d\\\'Angoulême, acheté en 1982 et remonté par A. Thomas. Accord général par le même en 1984.'),
(69, '1930 : orgue neuf Gloton-Debierre.\n1968-72 : reconstruction par Michel Alcouffe, interrompus par un dépôt de bilan.\n1972 : achèvement par Jean Renaud.'),
(70, '1623 : \\\"réfection\\\" de l\\\'orgue avec buffet neuf placé dans le bas-côté de la nef.\n1666 : reconstruction par Thomas Alport dans la tribune actuelle (3 cl. 30 jeux)\n1827 : remise en service par Joseph Hamard.\n1833 : révision par Armand-Théodore Guillouard.\n1877 : orgue neuf de Goydadin.\n1939 : ventilateur électrique fourni par Gloton-Debierre.\n1961-64 : restauration du buffet par Beuchet-Debierre et de la partie instrumentale par Roethinger qui étend le pédalier de 25 à 30 n.'),
(71, '2002 : construction par la Manufacture Thomas.'),
(40, '1879 : construction par Aristide Cavaillé-Coll.\n1960 : restauration, avec réharmonisation et modifications de jeux, par Yves Sévère.'),
(41, '2003 : orgue neuf de Rémy Mahler.'),
(42, '1842 : construction par Hulbert pour l\\\'ancienne église St-Laud d\\\'Angers.\n1869 : transfert à la Ménitré par Louis Bonn, avec façade postiche neuve.\n1898 : Restauration par Louis Debierre (Récit neuf ?)\n2007: remise en état par MBGO avec installation d\\\'une soufflerie électrique.'),
(43, '1651 : première mention d\\\'un organiste dans les archives.\n1652 : restauration par Ambroise Levasseur. Travaux en 1691 par Nicolas Vien...\n1767 : orgue neuf de François-Henri Clicquot ?\n1806 : installation d\\\'un orgue d\\\'occasion par Jean-Baptiste Schweickart (3 cl. 14 jeux). Remise en état par Jean-Baptiste Gadault en 1832.\n1853 : nouvel orgue d\\\'Aristide Cavaillé-Coll (2 cl. 26 jeux) et travaux en 1870 et 1893.\n1935 : restauration par Gloton-Debierre.\n1980 : restauration par Jean Renaud.'),
(44, 'v. 1850 : orgue neuf de George Maydwell Holdich pour une église anglaise.\n2006 : achat d\\\'occasion et installation à Noyant par des bénévoles de l\\\'association Orgue et Culture en Noyantais.'),
(86, '1685 : Construction du grand corps par Pierre Le Hellocq, avec pédalier en tirasse. Ajout du Positif par le même facteur en 1690.\n1847 : Restauration par Louis Bonn, avec suppression des mixtures et ajout d\\\'un dessus de Récit expressif.\n2016 : Restauration par MBGO.'),
(87, 'Orgue portatif nÂ° 257'),
(88, NULL),
(89, '1874 : construction par Debierre.\n1935 : ajout de la Soubasse par Gloton-Debierre.\n1983 : Doublette neuve à la place de la Voix céleste par Madigout et Thibaud.'),
(90, '1903 : construction par Debierre.\n1986 : modifications par Thibaud et Madigout (Prestant et Flûte 2Â´ en place de Principal 8Â´ et Voix céleste).'),
(91, ''),
(80, NULL),
(81, '1977 : orgue neuf Boisseau.'),
(82, '1919 : installation par Louis Debierre d\\\'un orgue de chœur Merklin provenant de St-Martin de Mayenne (1 cl. 7 jeux)\n1945 : grand orgue neuf de Gloton-Debierre (2 cl. 19 jeux)\n1981 : construction d\\\'un orgue neuf par Dominique Oberthur, avec réemploi d\\\'éléments du grand orgue Gloton.'),
(83, '1988 : construction par Dominique Oberthur'),
(84, '1998 : construction par Gildas Ménoret et Denis Lacorre\n2002 : installation à Vertou'),
(85, NULL),
(92, '2017 : construction par Bertrand Cattiaux.'),
(93, '1863 : construction par les frères Damiens (Gaillon-27).\n1985 : restauration par Jean-Jacques Mounier (Francheville-27)'),
(94, '1937 : Orgue par Bedel & Isambart offert par le marquis de la Ferronnays.\n1971 : Relevage par Deliancourt.\n2013 : Relevage et agrandissement de lÂ´orgue par la Manufacture dÂ´Orgues Robert Frères (modification des circuits électriques, transmissions modifiées, installation d\\\'une centrale informatique, et ajout de trois jeux supplémentaires : Doublette, Quinte et Plein-Jeu).'),
(95, '1965 : construction par Raymond Bouvet (GO et Pédale).\n1971 : ajout du Récit par Jean Renaud.'),
(96, 'Orgue originel de Le Logeais.\n1886 : reconstruction par Debierre pour le pensionnat de Bel-Air à Nantes.\n1905 : installation par Debierre à St-Similien.\n1935 : restauration par Gloton-Debierre.\n1991 : restauration par Renaud.'),
(97, '1943-46 : Construction par Gloton-Debierre.\n1990 : Restauration par Renaud.'),
(98, '1893 : construction par Debierre.'),
(99, '1865 : orgue Cavaillé-Coll construit pour le cirque-théâtre d\\\'Angers.\n1903 : installation par Debierre à l\\\'église Notre-Dame.\n1950 : relevage par Chéron.\n1963 : restauration par Beuchet-Debierre.'),
(100, '1843 : construction par Ducroquet dans l\\\'ancienne église (14 jeux, pédalier en tirasse).\n1873 : restauration avec ajout de jeux par Debierre.\n1891 : transfert dans la nouvelle église par Stoltz.\n1923 : restauration par Gloton-Debierre avec transmission pneumatique.\n1943 : restauration par Gonzalez avec nouvelle transmission mécanique.\n1977 : restauration par Yves Sévère.\n1995 : restauration par Nicolas Toussaint.'),
(101, NULL),
(102, 'Voir feuillet édité pour les Journées Européennes du Patrimoine 2017\nVoir aussi: www.musiqueorguequebec.ca/orgues/france/scalaisnd.html'),
(103, NULL),
(104, 'Vers 1610 : construction d\\\'un orgue neuf pour l\\\'abbaye de St-Calais, et présence d\\\'un orgue dans l\\\'église Notre-Dame.\n1792 : installation de l\\\'orgue de l\\\'abbaye dans l\\\'église Notre-Dame sur une tribune neuve : fusion des deux instruments ? (28 jeux ?)\n1845 : restauration Daublaine et Callinet (30 jeux dont 3 en attente)\n1904 : remise en état avec amoindrissement par V. Tronchet (15 jeux)\n1952 : ventilateur neuf posé par R. Lambert\n1978 : restauration par Benoist et Sarelot'),
(105, '1973 suppression des transmissions pneumatiques tubulaires par Joseph Beuchet'),
(106, '1942 : construction par Gloton-Debierre.\nRelevage par Renaud en 1977.'),
(107, '1991 : construction par Daniel Birouste.\n2003 : ajout de trois jeux de pédale par Jean-Pascal Villard.'),
(108, 'Orgue offert en action de grâces pour le mariage du comte de La Baume-Pluvinel (les armoiries de la famille sont sur la rampe de la tribune) avec Henriette de Civrac en l\\\'église Ste-Clotilde de Paris.'),
(109, '1878 : construction par Louis Debierre, au fond du chœur.\nTransfert dans le transept dans les années 1970 par Henri Deliancourt.'),
(110, 'Orgue construit par Auguste Tolbecque pour la salle des fêtes de l\\\'Institut des Jeunes Aveugles de Nantes \\\"La Persagotière\\\".\nEnsuite transféré dans la chapelle du même établissement.\n2018 : transfert à Orvault par Nicolas Toussaint.'),
(111, '1925 : orgue neuf Gloton-Debierre\n1973 : électrification par Beuchet-Debierre\n2020 : relevage MBGO.'),
(112, '1791 : installation par Lemaire dÂ´un orgue provenant de lÂ´abbaye de Perseigne (10 jeux, 1 cl.)\n1901 : construction dÂ´un orgue neuf par Van Bever.\n1923 : relevage par Van Bever avec légères modifications sonores.\n1960 : restauration et transformations par Chéron.\n1987 : restauration par Sévère.'),
(113, 'Premier orgue au début du XVIIe siècle (Léonard Lefebvre ?)\nAvant 1627 : réparation par Guillaume d\\\'Argillières.\nOrgue disparu à la Révolution ?\n1932 : orgue neuf par Gloton-Debierre.\n1982 : relevage par Roger Lambert.\n1998 : modification par Claude Thibault.'),
(114, '1869: construction par Henri Thébault (12 jeux, 2 cl.)\n1896 : relevage par Louis Debierre.\n1930 : agrandissement par Victor Tronchet.\n1977 : restauration et modification par Benoist-Sarelot.'),
(115, 'av. 1719 : construction d\\\'un orgue au prieuré de Château-l\\\'Hermitage\n1845 : installation par Armand Guillouard à Château-du-Loir (16 jeux, 3 cl.)\n1859 : transformation par Louis Bonn.\n1914 : reconstruction par Emile Enault-Beauté.\n1967 : relevage par Robert Boisseau.\n1991 : restauration par Jean Renaud.'),
(116, '1644 : orgue neuf de Paul Maillard (14 jeux, 2 cl.)\n1735 : travaux par Glockner.\n1750 : restauration par Jean Dangeville.\n1779 : travaux par Jean Luck.\n1850 : reconstruction par Louis Bonn (14 jeux, 2 cl.)\n1975 : reconstruction par Benoist-Sarelot.\n2016 : ajout d\'un Cornet par Pierre-Yves Le Blé.'),
(117, '2018 : construction par Etienne Fouss'),
(118, '1880 : construction par Debierre pour l\\\'église de Machecoul (44)\n1922 : transfert à la Bernerie avec modification de jeux par Gloton\n1939 : Nasard neuf de Gloton\n1989-98 : agrandissement par Renaud en deux tranches de travaux.'),
(119, '1967 : construction par Walcker Orgelbau pour l\\\'église sainte Hedwig de Brême. Démontage en 1994.\n1996 : achat par la paroisse de La Chapelle-sur-Erdre et remontage par Bernard Hurvy. Inauguration le 4 avril 1997 par Norbert Pétry.\n2011 : transformation par Bernard Hurvy : Sesquialter et Trompete neuves, nouvelle mécanique et réharmonisation. Inauguration le 2 octobre 2011 par Michel Bourcier.'),
(121, 'Buffet du XVIIe siècle (Maillard ?) en provenance du prieuré des bénédictines de la Fontaine-St-Martin, installé au Lude en remplacement d\\\'un orgue ruiné à la Révolution.\n1895 : orgue neuf de Louis Debierre dans le buffet ancien élargi.\n1992 : restauration par Jean-Pierre Conan.'),
(122, '1925 : orgue neuf de Gloton-Debierre.\n1970 : relevage par Beuchet-Debierre.\n1995 : relevage par Jean-Pascal Villard.\n2018-2019 : restauration de l\\\'instrument par Nicolas Toussaint. Changement de ventilateur. Ajout de deux jeux de pédale : flûte 8 et bombarde 16. '),
(123, '1883 : orgue \\\"Médiaphone\\\" de Dumont-Lelièvre\n1909 - transformation par Louis Debierre d\\\'un orgue Bonn provenant du Sacré-Coeur de Marmoutier (14 jeux, 2 cl.)\n1935, 1944, 1949 : travaux par Georges Gloton\n1963 : relevage par Henri Deliancourt\n1981 : relevage par Thibaud et Madigout\n2004 : reconstruction dans un buffet neuf par Olivier Chevron.'),
(120, '1988 : construction par Yves Koenig pour un organiste lyonnais\n2016 : remontage à la Chapelle-sur-Erdre, avec Sesquialter et Cymbale neuves, par Bernard Hurvy et Pierre-Yves Le Blé'),
(124, '1874 : construction par Aristide Cavaillé-Coll\n1990 : restauration à l\'identique par Claude Thibaud'),
(125, '1987 : construction par Barthélémy Formentelli pour un propriétaire privé.\n1998 : installation à St Laurent sur Sèvre et agrandissement par Formentelli.'),
(126, '1880 : construction de l\'orgue par Louis Debierre\n1976-77 : restauration par Jean Renaud\n1983 : ajout d\'un Plein-jeu par Renaud sur la chape du Bourdon 16\' dont les graves sont réutilisés comme Soubasse.'),
(127, '1850 : construction par Louis Bonn pour l\'église Notre-Dame-de-la-Visitation de Saumur.\n194... : Flûte harmonique neuve par Gloton, en remplacement d\'une Trompette.\n1989 : relevage Claude Madigout.\n2014 : Transfert de l\'orgue à Notre-Dame-des-Ardilliers.'),
(128, '1987 : construction pour un particulier à Plouharnel (56)\n2019 : déménagement à Nantes'),
(130, '1857 ? construction par Louis Bonn.\n1874 : installation à Montreuil-Bellay.\n1949 : Relevage par Beuchet-Debierre.'),
(131, '1577 : mention d\'un orgue, toujours en service en 1646\n1660-63? : orgue neuf de Mathurin Legris; achevé par ses enfants Florent et René (12 jeux)\n1696 : relevage par Toussaint Dallam\nOrgue disparu pendant la Révolution.\n1792 : installation de l\'ancien orgue de Fontaine-Daniel (Parizot 1784), détruit à son tour la même année.\n1836 : orgue neuf de Charles Gadault (34 jeux, 4 cl.)\n1855? : restauration par Pierre-Alexandre Ducroquet (Récit expressif 42 n.)\n1903 : installation par Louis Debierre de l\'ancien orgue de l\'abbaye de Ligugé, lui-même reconstruit par lui dix ans auparavant à partir de l\'ancien orgue de Montivilliers (Lefebvre, XVIIIe s.)'),
(132, '1590 : construction par Florentin Lusson\n1595 : restauration par André Thibault\n1605 : restauration par Guillaume Pinot\n1621 : restauration par Didier Duhault\n1652 : travaux par Guy Grohier (soufflerie neuve ?)\n1686 : restauration par Florent Legris\n1702 : restauration par ?\n1727 : travaux par Jean Le Bourdais\n1740 : travaux par Jacques Guitaut (composition notée en 1845)\n1878 : démontage et dépôt dans la sacristie\n? : dépôt dans l\'église St-Martin de Laval\n? : dépôt dans l\'ancienne église de Torcé-Vihiers\n2006 : le \"papotier\", tête articulée placée à la base de la tribune, dont l\'un des yeux remuait de haut en bas tandis que l\'autre tournait de droite à gauche et que la mâchoire inférieure s\'ouvrait dans un \"hiatus effrayant\", qui avait disparu en 1878, est retrouvé lors d\'une vente à l\'hôtel Drouot à Paris. Il est actuellement exposé au musée du Vieux-Château de Laval.'),
(133, '1895 : construction par Louis Debierre\n1924 : relevage par Gloton-Debierre\n1965 : restauration par Roger Lambert\n1995 : travaux par Jean Renaud (console)'),
(134, '2018 : construction par Daniel Birouste'),
(135, '1912 : livraison par Debierre de son Orgue portatif n° 243'),
(136, '1960 : livraison par Beuchet-Debierre'),
(137, '1912 : livraison par Louis Debierre'),
(138, '2013: construction par François Delhumeau, en réutilisant certains jeux de l’ancien orgue Haerpfer-Erman.'),
(139, '1958 : achat par la paroisse d\'un orgue Mutin\n1961 : reconstruction par Beuchet-Debierre\n2012 : restauration par Toussaint'),
(140, '1937 : installation par la paroisse d\'un orgue Lelogeais (1860)\n2005 : rétrocession de propriété à la Ville'),
(141, '2004 : installation d\'un orgue d\'occasion par Lacorre et Robert en 2004'),
(142, NULL),
(143, NULL),
(144, NULL),
(145, '1899 : livraison par Debierre de son Orgue portatif n° 187\n1990 : relevage par Renaud'),
(146, '1857 : installation dans l\'ancienne église d\'un orgue d\'occasion de Le Logeais (8/I).\n1875 : transfert dans la nouvelle église et transformations par Debierre.\n1979-81 : reconstruction par Renaud avec incorporation d\'éléments de l\'ancien orgue des Herbiers (85).\n1994 : complément de travaux par Renaud.'),
(147, '1854 : construction par Pierre-Alexandre Ducroquet.\n1912 : restauration par l\'abbé Victor Tronchet.\n1957 : restauration par Pierre Chéron.\n1973-77-84 : travaux par Benoist-Sarélot puis Claude Madigout et Claude Thibaud.'),
(148, '1884 : construction par Aristide Cavaillé-Coll pour la chapelle privée du comte de Chambrun à Paris, inauguré par Alexandre Guilmant.\n1920 : installation à Nort-sur-Erdre par Gloton-Debierre.\n1958 : restauration avec changements de jeux par Beuchet-Debierre.\n2010 : remise en l\'état d\'origine par Nicolas Toussaint.'),
(149, NULL),
(150, 'Orgue norvégien acheté d\'occasion et remonté au Marillais en 2003.'),
(151, '2020 : construction par Daniel Birouste.'),
(152, 'Orgue portatif n°214 livré le 2 février 1904\nRelavage par Denis Lacorre en 2004');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `inventaire_historique`
--
ALTER TABLE `inventaire_historique`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `inventaire_historique`
--
ALTER TABLE `inventaire_historique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
