-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 08 nov. 2026 à 06:14
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eventle`
--

-- --------------------------------------------------------

--
-- Structure de la table `archive`
--

CREATE TABLE `archive` (
  `game_date` date NOT NULL,
  `event_id` int(11) NOT NULL,
  `comparison1` int(11) NOT NULL,
  `comparison2` int(11) NOT NULL,
  `comparison3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `archive`
--

INSERT INTO `archive` (`game_date`, `event_id`, `comparison1`, `comparison2`, `comparison3`) VALUES
('2026-10-29', 67, 1, 100, 167),
('2026-10-30', 142, 87, 70, 75),
('2026-11-05', 183, 64, 231, 212),
('2026-11-08', 97, 88, 210, 78);

-- --------------------------------------------------------

--
-- Structure de la table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(52) DEFAULT NULL,
  `year` int(5) DEFAULT NULL,
  `location_type` varchar(19) DEFAULT NULL,
  `country` varchar(22) DEFAULT NULL,
  `coordinate_lat` float DEFAULT NULL,
  `coordinate_lng` float DEFAULT NULL,
  `alternative_name` varchar(60) DEFAULT NULL,
  `description` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `name`, `year`, `location_type`, `country`, `coordinate_lat`, `coordinate_lng`, `alternative_name`, `description`) VALUES
(1, 'Agriculture begins to spread', -10000, 'country', 'Iraq', 33.3152, 44.3661, 'The first fields', 'Communities increasingly cultivate plants and settle in parts of Southwest Asia.'),
(2, 'Çatalhöyük settlement develops', -9000, 'coordinates', 'Turkey', 37.6667, 32.8289, 'A crowded early settlement', 'A large Neolithic settlement grows in Anatolia, with dense housing and wall paintings.'),
(3, 'Jericho becomes a major early settlement', -8000, 'coordinates', 'Palestine', 31.8667, 35.45, 'A town beside an ancient spring', 'One of the world\'s oldest continuously inhabited settlement areas expands.'),
(4, 'Jiahu community flourishes', -6000, 'coordinates', 'China', 33.6167, 113.683, 'Flutes and early symbols', 'An early Chinese community leaves evidence of rice use, musical instruments and symbolic markings.'),
(5, 'Austronesian seafaring traditions develop', -5000, 'coordinates', 'Taiwan', 25.033, 121.565, 'Voyagers across the sea', 'Ancestors of Austronesian-speaking peoples develop maritime traditions that later spread across the Pacific.'),
(6, 'Sumerian urban communities expand', -4000, 'country', 'Iraq', 33.3152, 44.3661, 'Cities between two rivers', 'Urban life, specialized crafts and complex administration grow in southern Mesopotamia.'),
(7, 'Cuneiform writing emerges', -3500, 'coordinates', 'Iraq', 31.322, 45.637, 'Marks pressed into clay', 'Scribes in southern Mesopotamia develop one of the earliest known writing systems.'),
(8, 'Egypt is unified under early kings', -3200, 'coordinates', 'Egypt', 30.0444, 31.2357, 'Two lands under one ruler', 'Political unification along the Nile lays foundations for dynastic ancient Egypt.'),
(9, 'Early dynastic state consolidates in Egypt', -2700, 'coordinates', 'Egypt', 30.0444, 31.2357, 'A kingdom along the Nile', 'Royal administration and monumental building strengthen the early Egyptian state.'),
(10, 'Great Pyramid of Giza is built', -2600, 'coordinates', 'Egypt', 29.9792, 31.1342, 'A monumental royal tomb', 'Workers construct the largest pyramid at Giza during the reign of Khufu.'),
(11, 'Megalithic monuments rise at Stonehenge', -2500, 'coordinates', 'United Kingdom', 51.1789, -1.8262, 'A ring of standing stones', 'Communities in southern Britain build and modify a ceremonial monument over many generations.'),
(12, 'Akkadian Empire is established', -2334, 'country', 'Iraq', 33.3152, 44.3661, 'A ruler unites city-states', 'Sargon builds an empire linking many cities of Mesopotamia.'),
(13, 'Epic of Gilgamesh traditions take shape', -2100, 'coordinates', 'Iraq', 33.3152, 44.3661, 'A king seeks lasting life', 'Stories about a legendary Mesopotamian king develop into one of the best-known ancient literary traditions.'),
(14, 'Minoan civilization flourishes', -2000, 'coordinates', 'Greece', 35.2401, 24.8093, 'Palaces on a Mediterranean island', 'Large palace centers and maritime networks thrive on Crete.'),
(15, 'Hammurabi becomes king of Babylon', -1792, 'coordinates', 'Iraq', 32.542, 44.421, 'Rules carved for a kingdom', 'The Babylonian ruler later becomes famous for a surviving collection of laws.'),
(16, 'Shang dynasty emerges', -1600, 'coordinates', 'China', 39.9042, 116.407, 'Bronze cities in the east', 'An early Chinese dynasty leaves archaeological evidence of bronze casting and royal ritual.'),
(17, 'Vedic traditions develop in South Asia', -1500, 'coordinates', 'India', 28.6139, 77.209, 'Hymns passed through generations', 'Oral religious and poetic traditions that become central to early Hindu culture develop.'),
(18, 'Mycenaean palace culture expands', -1450, 'coordinates', 'Greece', 37.9838, 23.7275, 'Fortified palace centers', 'Palatial societies flourish on the Greek mainland during the Late Bronze Age.'),
(19, 'Bronze Age collapse', -1200, 'country', 'World', 0, 0, 'Palaces and kingdoms falter', 'Several eastern Mediterranean palace systems and states collapse or transform amid interconnected crises.'),
(20, 'Zhou dynasty takes power', -1046, 'coordinates', 'China', 39.9042, 116.407, 'A new house replaces the old', 'The Zhou defeat the Shang and establish a long-lasting Chinese dynasty.'),
(21, 'Kingdom of Kush develops around Napata', -1000, 'coordinates', 'Sudan', 15.5007, 32.5599, 'A Nile kingdom south of Egypt', 'A powerful Nubian kingdom grows along the Nile and later rules Egypt for a time.'),
(22, 'Carthage is traditionally founded', -814, 'coordinates', 'Tunisia', 36.8528, 10.3233, 'A harbor city rises in North Africa', 'Phoenician settlers establish a city that becomes a major Mediterranean power; the traditional date is approximate.'),
(23, 'First recorded ancient Olympic Games', -776, 'coordinates', 'Greece', 37.6383, 21.63, 'Athletes gather at a sanctuary', 'The earliest traditionally recorded Olympic festival is held in Greece.'),
(24, 'Maya civilization develops major centers', -650, 'country', 'Guatemala', 14.6349, -90.5069, 'Ceremonial cities in the rainforest', 'Maya communities build important ceremonial and political centers in Mesoamerica.'),
(25, 'Buddhism emerges in northern India', -600, 'coordinates', 'India', 28.6139, 77.209, 'A teacher leaves royal life', 'Siddhartha Gautama\'s teachings develop into a major religious and philosophical tradition; the precise dates are debated.'),
(26, 'Traditional birth year of Siddhartha Gautama', -563, 'coordinates', 'Nepal', 27.7172, 85.324, 'A child born near the Himalayas', 'Traditional chronology places the birth of the future Buddha at Lumbini.'),
(27, 'Persian Empire expands under Cyrus', -550, 'country', 'Iran', 35.6892, 51.389, 'A conqueror builds a vast realm', 'Cyrus the Great establishes a major empire across western and central Asia.'),
(28, 'Roman Republic traditionally begins', -509, 'coordinates', 'Italy', 41.9028, 12.4964, 'Kings are replaced by elected offices', 'Roman tradition dates the establishment of the republic to the end of monarchy.'),
(29, 'Battle of Marathon', -490, 'coordinates', 'Greece', 38.153, 23.962, 'A smaller force resists an invasion', 'Athenian and allied Greek forces defeat a Persian expeditionary army.'),
(30, 'Battle of Thermopylae', -480, 'coordinates', 'Greece', 38.796, 22.536, 'A narrow pass is defended', 'A Greek force led by Spartans resists the Persian advance before being overcome.'),
(31, 'Battle of Salamis', -480, 'coordinates', 'Greece', 37.964, 23.496, 'Ships decide a major campaign', 'Greek naval forces defeat the Persian fleet near Salamis.'),
(32, 'Greek forces win at Plataea', -479, 'coordinates', 'Greece', 38.2167, 23.2667, 'A land battle ends an invasion', 'Greek allies defeat a Persian army, helping end the invasion of mainland Greece.'),
(33, 'Twelve Tables of Roman law', -450, 'coordinates', 'Italy', 41.9028, 12.4964, 'Rules displayed in public', 'Roman legal rules are publicly inscribed, becoming an important foundation of later Roman legal tradition.'),
(34, 'Trial and death of Socrates', -399, 'coordinates', 'Greece', 37.9838, 23.7275, 'A philosopher drinks hemlock', 'The Athenian philosopher is sentenced to death after a trial recorded by his students.'),
(35, 'Alexander begins his Persian campaign', -334, 'coordinates', 'Turkey', 39.9334, 32.8597, 'A young king crosses into Asia', 'Alexander of Macedon launches the campaign that will topple the Achaemenid Persian Empire.'),
(36, 'Battle of Gaugamela', -331, 'coordinates', 'Iraq', 33.3152, 44.3661, 'An empire loses a decisive battle', 'Alexander defeats Darius III\'s forces, accelerating the collapse of Persian imperial rule.'),
(37, 'Death of Alexander the Great', -323, 'coordinates', 'Iraq', 32.542, 44.421, 'A conqueror dies far from home', 'Alexander dies in Babylon, and his commanders struggle over his vast conquests.'),
(38, 'Qin unifies China', -221, 'coordinates', 'China', 39.9042, 116.407, 'Warring states become one empire', 'Qin Shi Huang becomes the first emperor of a unified Chinese state.'),
(39, 'Han dynasty begins', -206, 'country', 'China', 39.9042, 116.407, 'A new dynasty follows upheaval', 'The Han dynasty succeeds the Qin and becomes one of China\'s defining imperial periods.'),
(40, 'Battle of Zama', -202, 'coordinates', 'Tunisia', 36.8065, 10.1815, 'A North African battle changes the balance', 'Roman forces defeat Hannibal\'s Carthaginian army, ending the Second Punic War.'),
(41, 'Carthage is destroyed by Rome', -146, 'coordinates', 'Tunisia', 36.8528, 10.3233, 'A rival harbor city is razed', 'Roman forces destroy Carthage at the end of the Third Punic War.'),
(42, 'Silk Road networks expand', -100, 'country', 'World', 0, 0, 'Caravans link distant markets', 'Overland trade routes increasingly connect East Asia, Central Asia and the Mediterranean.'),
(43, 'Spartacus revolt begins', -73, 'coordinates', 'Italy', 41.9028, 12.4964, 'Enslaved people rise against Rome', 'A major uprising of enslaved people and gladiators challenges the Roman Republic.'),
(44, 'Battle of Actium', -31, 'coordinates', 'Greece', 37.9838, 23.7275, 'A naval showdown settles a civil war', 'Octavian defeats the forces of Mark Antony and Cleopatra, paving the way for sole rule.'),
(45, 'Roman Empire conventionally begins', -27, 'coordinates', 'Italy', 41.9028, 12.4964, 'A republic gives way to one-man rule', 'Octavian receives the title Augustus and becomes Rome\'s first emperor.'),
(46, 'Battle of the Teutoburg Forest', 9, 'coordinates', 'Germany', 52.52, 13.405, 'Legions are ambushed in woodland', 'Germanic forces destroy three Roman legions, limiting Roman expansion east of the Rhine.'),
(47, 'Crucifixion of Jesus', 30, 'country', 'World', 0, 0, 'A preacher is executed outside a city', 'Jesus of Nazareth is executed under Roman authority; the exact year is debated.'),
(48, 'Great Fire of Rome', 64, 'coordinates', 'Italy', 41.9028, 12.4964, 'A blaze devastates an imperial capital', 'A major fire damages much of Rome during Nero\'s reign.'),
(49, 'Eruption of Mount Vesuvius', 79, 'country', 'World', 0, 0, 'Ash buries nearby towns', 'A volcanic eruption devastates Pompeii, Herculaneum and other settlements near the Bay of Naples.'),
(50, 'Papermaking process reported in China', 105, 'coordinates', 'China', 39.9042, 116.407, 'A writing material is improved', 'Tradition credits Cai Lun with reporting improvements to papermaking at the Han court.'),
(51, 'Yellow Turban Rebellion', 184, 'coordinates', 'China', 39.9042, 116.407, 'A religious uprising shakes a dynasty', 'A large rebellion contributes to the weakening of the Eastern Han dynasty.'),
(52, 'Han dynasty ends', 220, 'coordinates', 'China', 39.9042, 116.407, 'An empire fragments into rival states', 'The Han court collapses and China enters the Three Kingdoms era.'),
(53, 'Edict of Milan', 313, 'coordinates', 'Italy', 45.4642, 9.19, 'A new policy permits a faith', 'Roman emperors Constantine and Licinius agree to grant religious toleration, including to Christians.'),
(54, 'Goths cross the Danube into Roman territory', 376, 'coordinates', 'Romania', 44.4268, 26.1025, 'Refugees cross an imperial frontier', 'Gothic groups enter Roman territory, intensifying pressures on the empire.'),
(55, 'Christianity becomes the empire\'s official religion', 380, 'coordinates', 'Greece', 40.6401, 22.9444, 'An imperial decree favors a faith', 'Theodosius I issues an edict supporting Nicene Christianity as the empire\'s official religious standard.'),
(56, 'Roman Empire is permanently divided administratively', 395, 'coordinates', 'Italy', 41.9028, 12.4964, 'Two imperial courts emerge', 'After Theodosius I\'s death, the eastern and western courts develop separately.'),
(57, 'Sack of Rome by the Visigoths', 410, 'coordinates', 'Italy', 41.9028, 12.4964, 'Invaders enter an imperial city', 'Visigothic forces under Alaric sack Rome, a shock to the western empire.'),
(58, 'Battle of the Catalaunian Plains', 451, 'coordinates', 'France', 48.8566, 2.3522, 'A coalition confronts a steppe empire', 'Roman and allied forces fight Attila\'s Huns in a major battle in Gaul.'),
(59, 'Battle of Vouillé', 507, 'coordinates', 'France', 48.8566, 2.3522, 'A Frankish ruler defeats a rival kingdom', 'Clovis\'s forces defeat the Visigoths, expanding Frankish power in Gaul.'),
(60, 'Justinian I becomes Byzantine emperor', 527, 'coordinates', 'Turkey', 41.0082, 28.9784, 'A ruler seeks to restore an empire', 'Justinian begins a reign known for legal reform, monumental architecture and military reconquest.'),
(61, 'Nika riots', 532, 'coordinates', 'Turkey', 41.0082, 28.9784, 'Crowds revolt in an imperial capital', 'Factional unrest erupts into a major uprising against Justinian in Constantinople.'),
(62, 'Traditional founding of Iona monastery', 563, 'coordinates', 'United Kingdom', 55.9533, -3.1883, 'A monastery is founded on an island', 'Columba and companions establish a religious community that becomes influential in early medieval Christianity.'),
(63, 'Traditional birth year of Muhammad', 570, 'coordinates', 'Saudi Arabia', 24.7136, 46.6753, 'A future religious leader is born', 'Traditional accounts place Muhammad\'s birth in Mecca around this year.'),
(64, 'Hijra: Muhammad migrates to Medina', 622, 'coordinates', 'Saudi Arabia', 24.7136, 46.6753, 'A migration marks a new community', 'Muhammad\'s move from Mecca to Medina becomes the starting point of the Islamic calendar.'),
(65, 'Death of Muhammad', 632, 'coordinates', 'Saudi Arabia', 24.7136, 46.6753, 'A religious community loses its founder', 'Muhammad dies in Medina, and leadership of the expanding Muslim community becomes a central issue.'),
(66, 'Battle of Yarmouk', 636, 'coordinates', 'Syria', 33.5138, 36.2765, 'A regional power loses a key battle', 'Arab Muslim forces defeat Byzantine armies, helping shift control of the Levant.'),
(67, 'Umayyad Caliphate begins', 661, 'coordinates', 'Syria', 33.5138, 36.2765, 'A dynasty rules from a new capital', 'The Umayyad dynasty establishes its center in Damascus and governs a rapidly expanding caliphate.'),
(68, 'Umayyad forces enter Iberia', 711, 'coordinates', 'Spain', 40.4168, -3.7038, 'An army crosses a narrow sea', 'Muslim forces cross from North Africa into the Iberian Peninsula.'),
(69, 'Abbasid Revolution', 750, 'coordinates', 'Iraq', 33.3152, 44.3661, 'A dynasty replaces its predecessor', 'The Abbasids overthrow the Umayyads in most of the caliphate and later build a new capital at Baghdad.'),
(70, 'Baghdad is founded', 762, 'country', 'Iraq', 33.3152, 44.3661, 'A planned round city rises', 'The Abbasid caliph al-Mansur establishes Baghdad as a new capital and major intellectual center.'),
(71, 'Raid on Lindisfarne', 793, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A monastery is attacked from the sea', 'A Viking raid on the Northumbrian monastery becomes a famous marker of Viking activity in western Europe.'),
(72, 'Charlemagne is crowned emperor', 800, 'coordinates', 'Italy', 41.9028, 12.4964, 'A western ruler receives an imperial crown', 'Pope Leo III crowns Charlemagne emperor, symbolically reviving an imperial title in western Europe.'),
(73, 'Sailendra-era Borobudur construction begins', 820, 'coordinates', 'Indonesia', -6.2088, 106.846, 'A vast stone monument rises', 'Construction of the Buddhist temple complex in Java begins around this period.'),
(74, 'Diamond Sutra is printed', 868, 'coordinates', 'China', 39.9042, 116.407, 'A dated book survives from a press', 'A Chinese copy of the Buddhist text becomes the oldest known complete dated printed book.'),
(75, 'Tang dynasty ends', 907, 'coordinates', 'China', 39.9042, 116.407, 'A long dynasty collapses', 'The Tang falls, beginning a period of political fragmentation before reunification under the Song.'),
(76, 'Song dynasty begins', 960, 'country', 'China', 39.9042, 116.407, 'A new dynasty reunifies much of China', 'The Song era is noted for urban growth, commerce, printing and technological advances.'),
(77, 'Capetian dynasty begins', 987, 'country', 'France', 48.8566, 2.3522, 'A new royal house takes power', 'Hugh Capet becomes king, beginning a dynasty that shapes French monarchy for centuries.'),
(78, 'Norse settlement at L\'Anse aux Meadows', 1000, 'coordinates', 'Canada', 45.4215, -75.6972, 'Sailors reach a distant western shore', 'Norse explorers establish a short-lived settlement in Newfoundland, evidence of pre-Columbian European arrival in the Americas.'),
(79, 'East–West Schism conventionally dated', 1054, 'coordinates', 'Turkey', 41.0082, 28.9784, 'Churches split between east and west', 'A long process of estrangement between Latin and Greek Christian churches is symbolically dated to this year.'),
(80, 'Norman Conquest of England', 1066, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'An invading duke wins a crown', 'William of Normandy defeats Harold Godwinson at Hastings and takes the English throne.'),
(81, 'Battle of Manzikert', 1071, 'coordinates', 'Turkey', 39.9334, 32.8597, 'An emperor is defeated in Anatolia', 'Seljuk forces defeat the Byzantine army, contributing to changes in Anatolia.'),
(82, 'First Crusade is proclaimed', 1095, 'country', 'France', 48.8566, 2.3522, 'A call brings armies eastward', 'Pope Urban II calls for a military expedition to the eastern Mediterranean.'),
(83, 'Crusaders capture Jerusalem', 1099, 'country', 'World', 0, 0, 'A besieged city is taken', 'Crusader forces seize Jerusalem during the First Crusade.'),
(84, 'Second Crusade begins', 1147, 'coordinates', 'France', 48.8566, 2.3522, 'A new expedition heads east', 'European rulers launch a crusade after the fall of Edessa.'),
(85, 'Battle of Hattin', 1187, 'coordinates', 'Israel', 31.7683, 35.2137, 'A decisive defeat opens the road south', 'Saladin defeats Crusader forces, leading to the recapture of Jerusalem.'),
(86, 'Delhi Sultanate is established', 1206, 'country', 'India', 28.6139, 77.209, 'A new power rises in northern India', 'Qutb al-Din Aibak establishes a sultanate that becomes a major political force in the subcontinent.'),
(87, 'Genghis Khan is proclaimed ruler', 1206, 'country', 'Mongolia', 47.9184, 106.918, 'Steppe clans unite under one leader', 'Temüjin is proclaimed Genghis Khan, beginning the expansion of the Mongol Empire.'),
(88, 'Magna Carta is sealed', 1215, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A king accepts written limits', 'King John agrees to a charter that later becomes a symbol of constraints on royal power.'),
(89, 'Mongols sack Baghdad', 1258, 'coordinates', 'Iraq', 33.3152, 44.3661, 'A great scholarly city is captured', 'Hülegü\'s forces capture Baghdad, ending Abbasid caliphal rule there and devastating the city.'),
(90, 'Yuan dynasty is proclaimed', 1271, 'country', 'China', 39.9042, 116.407, 'A Mongol ruler adopts a Chinese dynasty name', 'Kublai Khan proclaims the Yuan dynasty, later completing the conquest of Song China.'),
(91, 'Song dynasty ends', 1279, 'coordinates', 'China', 39.9042, 116.407, 'A final naval defeat ends a dynasty', 'Yuan forces defeat the Southern Song, bringing all of China under Mongol rule.'),
(92, 'Fall of Acre', 1291, 'coordinates', 'Israel', 31.7683, 35.2137, 'The last major Crusader stronghold falls', 'Mamluk forces capture Acre, ending the Crusader presence in the mainland Levant.'),
(93, 'Tenochtitlan is traditionally founded', 1325, 'coordinates', 'Mexico', 19.4326, -99.1332, 'A city rises on a lake', 'Mexica tradition dates the founding of their island capital in Lake Texcoco to this year.'),
(94, 'Hundred Years\' War begins', 1337, 'country', 'France', 48.8566, 2.3522, 'Two royal houses contest a crown', 'A prolonged conflict between English and French dynasties begins, lasting intermittently for more than a century.'),
(95, 'Black Death reaches Mediterranean Europe', 1347, 'coordinates', 'Italy', 41.9028, 12.4964, 'A deadly disease arrives by ship', 'Plague spreads through Mediterranean ports and across Europe, causing catastrophic mortality.'),
(96, 'Ming dynasty begins', 1368, 'country', 'China', 39.9042, 116.407, 'A new dynasty replaces Mongol rule', 'Zhu Yuanzhang establishes the Ming dynasty after the collapse of Yuan authority.'),
(97, 'Timur rises to power in Transoxiana', 1377, 'coordinates', 'Uzbekistan', 41.2995, 69.2401, 'A conqueror builds a Central Asian realm', 'Timur establishes a base in Central Asia and launches campaigns across western and southern Asia.'),
(98, 'Zheng He begins maritime voyages', 1405, 'coordinates', 'China', 39.9042, 116.407, 'A fleet sails across the Indian Ocean', 'Ming admiral Zheng He leads the first of a series of major state-sponsored voyages.'),
(99, 'Forbidden City construction begins', 1420, 'coordinates', 'China', 39.9042, 116.407, 'An imperial palace complex is built', 'Construction begins on Beijing\'s palace complex, which becomes the center of Ming and Qing rule.'),
(100, 'Joan of Arc is executed', 1431, 'coordinates', 'France', 48.8566, 2.3522, 'A young military figure is burned', 'Joan of Arc is executed after an ecclesiastical trial during the Hundred Years\' War.'),
(101, 'Fall of Constantinople', 1453, 'coordinates', 'Turkey', 41.0082, 28.9784, 'A walled imperial capital is captured', 'Ottoman forces under Mehmed II capture Constantinople, ending the Byzantine Empire.'),
(102, 'Gutenberg Bible is printed', 1455, 'coordinates', 'Germany', 52.52, 13.405, 'A press transforms bookmaking', 'Johannes Gutenberg\'s workshop produces a landmark early European printed Bible.'),
(103, 'Marriage joins the crowns of Castile and Aragon', 1469, 'coordinates', 'Spain', 40.4168, -3.7038, 'Two royal houses unite by marriage', 'The marriage of Isabella and Ferdinand helps lay foundations for a unified Spanish monarchy.'),
(104, 'Columbus reaches the Caribbean', 1492, 'coordinates', 'Bahamas', 25.0343, -77.3963, 'Ships arrive at an island in the west', 'Christopher Columbus\'s expedition reaches the Caribbean, initiating sustained contact between Europe and the Americas.'),
(105, 'Treaty of Tordesillas', 1494, 'coordinates', 'Spain', 40.4168, -3.7038, 'Two monarchies divide overseas claims', 'Spain and Portugal agree to a line dividing their claimed spheres of expansion.'),
(106, 'Vasco da Gama reaches India by sea', 1498, 'coordinates', 'India', 28.6139, 77.209, 'A fleet arrives on the Malabar coast', 'The Portuguese navigator reaches Calicut by sailing around Africa.'),
(107, 'Safavid dynasty takes power', 1501, 'coordinates', 'Iran', 35.6892, 51.389, 'A new dynasty establishes a realm', 'Ismail I establishes Safavid rule and helps make Twelver Shiism central to Iran.'),
(108, 'Protestant Reformation begins', 1517, 'coordinates', 'Germany', 52.52, 13.405, 'A scholar challenges church practices', 'Martin Luther\'s challenge to indulgence practices becomes a major catalyst for religious reform in Europe.'),
(109, 'Smallpox epidemic strikes central Mexico', 1520, 'coordinates', 'Mexico', 19.4326, -99.1332, 'A disease devastates a capital region', 'Disease introduced from Europe contributes to severe population loss during the conquest period.'),
(110, 'Fall of Tenochtitlan', 1521, 'coordinates', 'Mexico', 19.4326, -99.1332, 'A lake capital is conquered', 'Spanish and Indigenous allied forces capture the Mexica capital after a long siege.'),
(111, 'First circumnavigation is completed', 1522, 'country', 'Spain', 40.4168, -3.7038, 'A ship returns after crossing oceans', 'The surviving ship of Magellan\'s expedition returns to Spain under Juan Sebastián Elcano.'),
(112, 'Mughal Empire is founded in India', 1526, 'country', 'India', 28.6139, 77.209, 'A new dynasty wins a northern battle', 'Babur defeats the Delhi Sultanate at Panipat and establishes Mughal rule.'),
(113, 'Spanish capture Atahualpa', 1532, 'country', 'World', 0, 0, 'An emperor is seized at a meeting', 'Francisco Pizarro\'s forces capture the Inca ruler at Cajamarca.'),
(114, 'Copernicus publishes heliocentric model', 1543, 'coordinates', 'Poland', 52.2297, 21.0122, 'A book places the Sun at the center', 'A landmark work argues that Earth and other planets revolve around the Sun.'),
(115, 'Peace of Augsburg', 1555, 'coordinates', 'Germany', 52.52, 13.405, 'Princes reach a religious compromise', 'The agreement allows rulers in the Holy Roman Empire to choose between Catholicism and Lutheranism for their territories.'),
(116, 'Spanish settlement established at Cebu', 1565, 'coordinates', 'Philippines', 14.5995, 120.984, 'A European foothold is founded on islands', 'Miguel López de Legazpi establishes a lasting Spanish colonial foothold in the Philippines.'),
(117, 'Battle of Lepanto', 1571, 'coordinates', 'Greece', 37.9838, 23.7275, 'A major naval coalition wins', 'A Holy League fleet defeats the Ottoman navy in a major Mediterranean engagement.'),
(118, 'Gregorian calendar reform introduced', 1582, 'coordinates', 'Italy', 41.9028, 12.4964, 'A new calendar corrects accumulated drift', 'Pope Gregory XIII promulgates a calendar reform that gradually spreads around the world.'),
(119, 'Japanese invasions of Korea begin', 1592, 'coordinates', 'South Korea', 37.5665, 126.978, 'An army crosses a peninsula', 'Japanese forces invade Korea, beginning a destructive conflict involving Ming China.'),
(120, 'Battle of Sekigahara', 1600, 'coordinates', 'Japan', 35.6762, 139.65, 'A decisive clash reunifies a country', 'Tokugawa Ieyasu\'s victory helps establish the Tokugawa shogunate.'),
(121, 'Jamestown is founded', 1607, 'country', 'United States', 38.9072, -77.0369, 'A permanent English settlement is established', 'English colonists establish Jamestown in Virginia, the first permanent English settlement in North America.'),
(122, 'Galileo observes Jupiter\'s moons', 1610, 'coordinates', 'Italy', 41.9028, 12.4964, 'A telescope reveals orbiting worlds', 'Galileo\'s observations provide important evidence for a changing understanding of the heavens.'),
(123, 'Thirty Years\' War begins', 1618, 'country', 'Czechia', 50.0755, 14.4378, 'A revolt sparks a continental conflict', 'A Bohemian revolt develops into a devastating war involving many European powers.'),
(124, 'Shimabara Rebellion begins', 1637, 'coordinates', 'Japan', 35.6762, 139.65, 'A revolt challenges a shogunate', 'Peasants and Christians rise against local authorities in a major uprising in Japan.'),
(125, 'Ming dynasty falls in Beijing', 1644, 'coordinates', 'China', 39.9042, 116.407, 'A capital is taken amid rebellion', 'Rebel forces capture Beijing; the Qing subsequently consolidate control over China.'),
(126, 'Peace of Westphalia', 1648, 'coordinates', 'Germany', 52.52, 13.405, 'Treaties end a major European war', 'Agreements at Münster and Osnabrück help end the Thirty Years\' War and reshape European diplomacy.'),
(127, 'Execution of Charles I', 1649, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A monarch is put on trial and killed', 'The English king is executed after the Civil War, an extraordinary challenge to hereditary monarchy.'),
(128, 'Siege of Vienna is lifted', 1683, 'coordinates', 'Austria', 48.2082, 16.3738, 'A city withstands a major siege', 'A relief army defeats Ottoman forces outside Vienna, halting the siege.'),
(129, 'Newton publishes Principia', 1687, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A book sets out laws of motion', 'Isaac Newton publishes a work that transforms physics and mathematical astronomy.'),
(130, 'Glorious Revolution', 1688, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A king is replaced with limited resistance', 'James II is overthrown and William and Mary take the throne, contributing to constitutional change.'),
(131, 'Treaty of Ryswick', 1697, 'coordinates', 'Netherlands', 52.3676, 4.9041, 'A European war reaches a settlement', 'The treaty ends the Nine Years\' War between France and a coalition of opponents.'),
(132, 'Acts of Union create Great Britain', 1707, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'Two kingdoms form one state', 'The English and Scottish parliaments unite the Kingdoms of England and Scotland.'),
(133, 'Russian Empire is proclaimed', 1721, 'country', 'Russia', 55.7558, 37.6173, 'A ruler adopts an imperial title', 'Peter the Great declares Russia an empire after victory in the Great Northern War.'),
(134, 'Seven Years\' War begins in Europe', 1756, 'country', 'Germany', 52.52, 13.405, 'A conflict spreads across continents', 'A struggle involving major European powers expands into a global war.'),
(135, 'Battle of Plassey', 1757, 'coordinates', 'India', 28.6139, 77.209, 'A trading company gains decisive influence', 'The East India Company defeats the Nawab of Bengal and allies, marking a turning point in British power in India.'),
(136, 'Treaty of Paris ends the Seven Years\' War', 1763, 'coordinates', 'France', 48.8566, 2.3522, 'A treaty redraws colonial control', 'The settlement transfers major territories and strengthens Britain\'s position in North America.'),
(137, 'Watt\'s improved steam engine patent', 1769, 'coordinates', 'United Kingdom', 55.9533, -3.1883, 'A machine becomes more efficient', 'James Watt patents an important improvement to the steam engine, helping accelerate industrialization.'),
(138, 'Boston Tea Party', 1773, 'coordinates', 'United States', 38.9072, -77.0369, 'Protesters dump cargo into a harbor', 'Colonists protest British taxation by destroying tea in Boston Harbor.'),
(139, 'American Revolutionary War begins', 1775, 'country', 'United States', 38.9072, -77.0369, 'Militia clash with royal troops', 'Fighting at Lexington and Concord marks the outbreak of the American Revolutionary War.'),
(140, 'United States Declaration of Independence', 1776, 'coordinates', 'United States', 38.9072, -77.0369, 'Colonies announce a separation', 'The Continental Congress adopts a declaration asserting independence from Britain.'),
(141, 'Battle of Yorktown', 1781, 'coordinates', 'United States', 38.9072, -77.0369, 'A British army surrenders', 'American and French forces force the surrender of a major British army, effectively deciding the war.'),
(142, 'Treaty of Paris recognizes US independence', 1783, 'coordinates', 'France', 48.8566, 2.3522, 'A treaty recognizes a new nation', 'Britain formally recognizes the independence of the United States.'),
(143, 'Declaration of the Rights of Man and of the Citizen', 1789, 'coordinates', 'France', 48.8566, 2.3522, 'A document proclaims civic rights', 'The National Constituent Assembly adopts a landmark statement of rights and citizenship.'),
(144, 'Haitian Revolution begins', 1791, 'country', 'World', 0, 0, 'Enslaved people rise in a colony', 'A revolution begins in Saint-Domingue and ultimately creates the first independent state founded by formerly enslaved people.'),
(145, 'Execution of Louis XVI', 1793, 'coordinates', 'France', 48.8566, 2.3522, 'A king is guillotined in a public square', 'The former French monarch is executed during the revolution.'),
(146, 'Abolition of slavery in French colonies', 1794, 'coordinates', 'France', 48.8566, 2.3522, 'A revolutionary government ends slavery by decree', 'The French National Convention abolishes slavery in French colonies, though later policy reverses this in some territories.'),
(147, 'Napoleon takes power in France', 1799, 'coordinates', 'France', 48.8566, 2.3522, 'A general stages a political coup', 'Napoleon Bonaparte overthrows the Directory in the coup of 18 Brumaire.'),
(148, 'Napoleon is crowned emperor', 1804, 'coordinates', 'France', 48.8566, 2.3522, 'A general crowns himself ruler', 'Napoleon becomes Emperor of the French in a ceremony at Notre-Dame Cathedral.'),
(149, 'Battle of Trafalgar', 1805, 'coordinates', 'Spain', 40.4168, -3.7038, 'A naval battle changes European strategy', 'The British fleet defeats French and Spanish fleets, securing British naval dominance.'),
(150, 'Battle of Austerlitz', 1805, 'coordinates', 'Czechia', 50.0755, 14.4378, 'An emperor wins a decisive battle', 'Napoleon defeats Russian and Austrian armies in a major engagement.'),
(151, 'Napoleon invades Russia', 1812, 'coordinates', 'Russia', 55.7558, 37.6173, 'A huge army marches east', 'The French-led invasion ends in catastrophic retreat and weakens Napoleon\'s empire.'),
(152, 'Battle of Waterloo', 1815, 'coordinates', 'Belgium', 50.8503, 4.3517, 'A final battle ends an emperor\'s return', 'Coalition forces defeat Napoleon, ending his rule after the Hundred Days.'),
(153, 'Greek War of Independence begins', 1821, 'coordinates', 'Greece', 37.9838, 23.7275, 'An uprising challenges imperial rule', 'Greek rebels begin a struggle that eventually creates an independent state.'),
(154, 'Brazil declares independence', 1822, 'country', 'Brazil', -15.7939, -47.8828, 'A prince breaks with a European crown', 'Pedro declares Brazil\'s independence from Portugal.'),
(155, 'First public railway using steam locomotives opens', 1825, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A steam railway carries passengers and goods', 'The Stockton and Darlington Railway opens, demonstrating the potential of rail transport.'),
(156, 'July Revolution in France', 1830, 'coordinates', 'France', 48.8566, 2.3522, 'A monarch is forced from the throne', 'Three days of uprising lead to the overthrow of Charles X.'),
(157, 'Belgian Revolution', 1831, 'coordinates', 'Belgium', 50.8503, 4.3517, 'A new state separates from a kingdom', 'Revolution leads to Belgium\'s independence from the United Kingdom of the Netherlands.'),
(158, 'Revolutions of 1848', 1848, 'coordinates', 'France', 48.8566, 2.3522, 'Protests spread across European capitals', 'A wave of uprisings challenges monarchies and political systems across Europe.'),
(159, 'Seneca Falls Convention', 1848, 'coordinates', 'United States', 38.9072, -77.0369, 'A meeting demands women\'s rights', 'Activists gather in New York to advocate for women\'s social, civil and religious rights.'),
(160, 'Commodore Perry arrives in Japan', 1853, 'coordinates', 'Japan', 35.6762, 139.65, 'Foreign ships demand access to ports', 'A US naval expedition pressures Japan to open relations with Western powers.'),
(161, 'Indian Rebellion begins', 1857, 'coordinates', 'India', 28.6139, 77.209, 'Soldiers and civilians rise against company rule', 'A major uprising challenges East India Company authority across northern and central India.'),
(162, 'Darwin publishes On the Origin of Species', 1859, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A book explains species change over time', 'Charles Darwin presents a theory of evolution by natural selection.'),
(163, 'Emancipation Proclamation takes effect', 1863, 'coordinates', 'United States', 38.9072, -77.0369, 'A wartime order declares enslaved people free in rebel areas', 'Abraham Lincoln\'s proclamation changes the Union war aims and the legal status of enslaved people in areas in rebellion.'),
(164, 'American Civil War ends', 1865, 'country', 'United States', 38.9072, -77.0369, 'A major Confederate army surrenders', 'Robert E. Lee surrenders at Appomattox Court House, a key step in ending the war.'),
(165, 'Abolition of slavery in the United States', 1865, 'coordinates', 'United States', 38.9072, -77.0369, 'A constitutional amendment ends legal slavery', 'The Thirteenth Amendment abolishes slavery, except as punishment for crime, across the United States.'),
(166, 'Meiji Restoration', 1868, 'coordinates', 'Japan', 35.6762, 139.65, 'Imperial rule is restored', 'Political power shifts from the Tokugawa shogunate to the emperor, launching rapid reforms.'),
(167, 'Suez Canal opens', 1869, 'coordinates', 'Egypt', 30.0444, 31.2357, 'A canal links two seas', 'The waterway connecting the Mediterranean and Red Sea opens to international shipping.'),
(168, 'German Empire is proclaimed', 1871, 'country', 'France', 48.8566, 2.3522, 'A new empire is declared in a palace', 'German states unite under Prussian leadership in the Hall of Mirrors at Versailles.'),
(169, 'First telephone patent is granted', 1876, 'coordinates', 'United States', 38.9072, -77.0369, 'A device carries voices electrically', 'Alexander Graham Bell receives a patent for a telephone design.'),
(170, 'Berlin Conference begins', 1884, 'coordinates', 'Germany', 52.52, 13.405, 'European powers negotiate claims in Africa', 'The conference sets rules for European claims in Africa and accelerates colonial partition.'),
(171, 'Scramble for Africa intensifies', 1885, 'country', 'Africa', 0, 20, 'European powers divide a continent', 'European states expand territorial control across Africa in the late nineteenth century.'),
(172, 'Eiffel Tower opens', 1889, 'coordinates', 'France', 48.8566, 2.3522, 'A metal tower rises over a world fair', 'The tower is completed for the Exposition Universelle in Paris.'),
(173, 'First modern Olympic Games', 1896, 'coordinates', 'Greece', 37.9838, 23.7275, 'An international sports festival returns', 'Athletes gather in Athens for the first modern Olympic Games.'),
(174, 'Spanish-American War', 1898, 'coordinates', 'Cuba', 23.1136, -82.3666, 'A war shifts overseas power', 'The United States defeats Spain, contributing to the end of Spain\'s major colonial empire.'),
(175, 'Federation of Australia', 1901, 'country', 'Australia', -35.2809, 149.13, 'Colonies form a commonwealth', 'Six British colonies unite to create the Commonwealth of Australia.'),
(176, 'First powered airplane flight', 1903, 'coordinates', 'United States', 38.9072, -77.0369, 'A machine flies under its own power', 'The Wright brothers achieve a controlled powered flight at Kitty Hawk, North Carolina.'),
(177, 'Russian Revolution of 1905', 1905, 'coordinates', 'Russia', 55.7558, 37.6173, 'Protests challenge an autocratic ruler', 'Strikes, demonstrations and unrest force limited reforms in the Russian Empire.'),
(178, 'Xinhai Revolution begins', 1911, 'country', 'China', 39.9042, 116.407, 'An uprising ends an imperial dynasty', 'The revolution leads to the abdication of the Qing emperor and the establishment of a republic.'),
(179, 'Titanic sinks', 1912, 'country', 'International waters', 45, -45, 'A passenger liner hits an iceberg', 'The RMS Titanic sinks on its maiden voyage after striking an iceberg.'),
(180, 'World War I begins', 1914, 'coordinates', 'Bosnia and Herzegovina', 43.8563, 18.4131, 'An assassination triggers a crisis', 'The killing of Archduke Franz Ferdinand in Sarajevo helps trigger a chain of declarations of war.'),
(181, 'Armenian deportations and mass killings', 1915, 'country', 'Turkey', 39.9334, 32.8597, 'A population is forcibly displaced', 'Ottoman authorities deport Armenians and mass atrocities occur during World War I.'),
(182, 'Battle of the Somme', 1916, 'coordinates', 'France', 48.8566, 2.3522, 'A costly offensive begins', 'British and French forces launch a major offensive on the Western Front during World War I.'),
(183, 'World War I armistice', 1918, 'coordinates', 'France', 48.8566, 2.3522, 'The guns fall silent on the Western Front', 'An armistice takes effect on 11 November, ending fighting between the Allies and Germany.'),
(184, 'Treaty of Versailles signed', 1919, 'coordinates', 'France', 48.8566, 2.3522, 'A peace treaty is signed in a palace', 'The treaty sets terms for peace with Germany after World War I.'),
(185, 'League of Nations begins work', 1920, 'coordinates', 'Switzerland', 46.948, 7.4474, 'A new international organization convenes', 'The League of Nations holds its first council meeting as part of efforts to prevent future wars.'),
(186, 'Soviet Union is established', 1922, 'country', 'Russia', 55.7558, 37.6173, 'Several republics form a union', 'The Union of Soviet Socialist Republics is formally created.'),
(187, 'Republic of Turkey is proclaimed', 1923, 'country', 'Turkey', 39.9334, 32.8597, 'A new republic replaces an empire', 'Mustafa Kemal Atatürk and colleagues establish the Republic of Turkey after the Ottoman Empire\'s collapse.'),
(188, 'Wall Street Crash', 1929, 'coordinates', 'United States', 38.9072, -77.0369, 'Markets plunge in New York', 'A dramatic stock-market collapse helps usher in the Great Depression.'),
(189, 'Salt March', 1930, 'coordinates', 'India', 28.6139, 77.209, 'A long walk challenges a colonial tax', 'Mahatma Gandhi leads a protest against the British salt monopoly.'),
(190, 'Mukden Incident', 1931, 'coordinates', 'China', 39.9042, 116.407, 'A railway explosion becomes a pretext for invasion', 'Japanese forces use an incident in Manchuria to expand military occupation.'),
(191, 'Hitler becomes German chancellor', 1933, 'coordinates', 'Germany', 52.52, 13.405, 'A radical leader enters government', 'Adolf Hitler is appointed chancellor, enabling the Nazi dictatorship to consolidate power.'),
(192, 'Spanish Civil War begins', 1936, 'country', 'Spain', 40.4168, -3.7038, 'A military revolt divides a country', 'A coup attempt leads to a civil war between Republican and Nationalist forces.'),
(193, 'World War II begins in Europe', 1939, 'coordinates', 'Poland', 52.2297, 21.0122, 'An invasion starts a global conflict', 'Germany invades Poland on 1 September, prompting Britain and France to declare war.'),
(194, 'Battle of Britain', 1940, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'Air forces fight over an island nation', 'The Royal Air Force resists the German air campaign against Britain.'),
(195, 'Attack on Pearl Harbor', 1941, 'coordinates', 'United States', 38.9072, -77.0369, 'A surprise air raid strikes a naval base', 'Japanese forces attack the US Pacific Fleet at Pearl Harbor, bringing the United States into World War II.'),
(196, 'Battle of Midway', 1942, 'coordinates', 'United States', 38.9072, -77.0369, 'A Pacific naval battle turns the tide', 'US forces defeat a Japanese fleet near Midway Atoll, shifting momentum in the Pacific War.'),
(197, 'D-Day landings', 1944, 'coordinates', 'France', 48.8566, 2.3522, 'Allied troops land on a fortified coast', 'Allied forces land in Normandy, opening a major western front against Nazi Germany.'),
(198, 'Atomic bombing of Nagasaki', 1945, 'coordinates', 'Japan', 35.6762, 139.65, 'A second city is struck by an atomic weapon', 'The United States drops an atomic bomb on Nagasaki on 9 August.'),
(199, 'World War II ends', 1945, 'coordinates', 'Japan', 35.6762, 139.65, 'Japan announces surrender', 'Japan accepts Allied surrender terms, ending World War II after formal signing in September.'),
(200, 'United Nations is founded', 1945, 'country', 'United States', 38.9072, -77.0369, 'A new global organization is established', 'The UN Charter enters into force, creating an international organization for peace and cooperation.'),
(201, 'Partition of British India', 1947, 'country', 'India', 28.6139, 77.209, 'A subcontinent is divided at independence', 'British India is partitioned into India and Pakistan, accompanied by mass migration and communal violence.'),
(202, 'State of Israel is declared', 1948, 'country', 'Israel', 31.7683, 35.2137, 'A new state is proclaimed in the eastern Mediterranean', 'Israel declares independence, followed by war with neighboring Arab states and displacement of Palestinians.'),
(203, 'People\'s Republic of China is proclaimed', 1949, 'country', 'China', 39.9042, 116.407, 'A new government takes power', 'Mao Zedong proclaims the People\'s Republic after the Communist victory in the Chinese Civil War.'),
(204, 'Korean War begins', 1950, 'country', 'South Korea', 37.5665, 126.978, 'An invasion crosses a divided peninsula', 'North Korean forces cross the 38th parallel, beginning a war involving UN and Chinese forces.'),
(205, 'DNA double-helix structure is announced', 1953, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A molecular structure is described', 'Researchers publish a model of DNA\'s double-helix structure, a landmark in molecular biology.'),
(206, 'Bandung Conference', 1955, 'coordinates', 'Indonesia', -6.2088, 106.846, 'Asian and African leaders meet', 'Delegates from Asian and African countries gather to discuss cooperation, colonialism and global politics.'),
(207, 'Sputnik 1 launches', 1957, 'coordinates', 'Kazakhstan', 51.1694, 71.4491, 'A small satellite circles Earth', 'The Soviet Union launches the first artificial satellite, beginning the space age.'),
(208, 'Year of Africa independence wave', 1960, 'country', 'Africa', 0, 20, 'Many territories gain independence', 'A large number of African countries gain independence during a pivotal year of decolonization.'),
(209, 'Berlin Wall construction begins', 1961, 'coordinates', 'Germany', 52.52, 13.405, 'A barrier divides a city', 'East German authorities begin building a barrier separating East and West Berlin.'),
(210, 'Cuban Missile Crisis', 1962, 'coordinates', 'Cuba', 23.1136, -82.3666, 'A nuclear standoff brings the world close to war', 'The Soviet deployment of missiles in Cuba triggers a dangerous confrontation with the United States.'),
(211, 'March on Washington', 1963, 'coordinates', 'United States', 38.9072, -77.0369, 'A huge crowd gathers for civil rights', 'Demonstrators assemble in Washington, D.C., where Martin Luther King Jr. delivers his famous speech.'),
(212, 'Civil Rights Act signed', 1964, 'coordinates', 'United States', 38.9072, -77.0369, 'A law bans discrimination in public life', 'The US law prohibits discrimination based on race, color, religion, sex or national origin in several domains.'),
(213, 'Cultural Revolution begins', 1966, 'country', 'China', 39.9042, 116.407, 'A political campaign transforms society', 'Mao launches a mass campaign that causes widespread persecution and disruption in China.'),
(214, 'Six-Day War', 1967, 'coordinates', 'Israel', 31.7683, 35.2137, 'A short war redraws regional control', 'Israel fights Egypt, Jordan and Syria and occupies several territories.'),
(215, 'Prague Spring is suppressed', 1968, 'coordinates', 'Czechia', 50.0755, 14.4378, 'Troops enter a reforming capital', 'Warsaw Pact forces invade Czechoslovakia to end a reform movement.'),
(216, 'Apollo 11 Moon landing', 1969, 'coordinates', 'United States', 38.9072, -77.0369, 'Humans first walk on another world', 'Neil Armstrong and Buzz Aldrin walk on the Moon during NASA\'s Apollo 11 mission.'),
(217, 'Bangladesh Liberation War ends', 1971, 'country', 'Bangladesh', 23.8103, 90.4125, 'A new country emerges after war', 'Bangladesh becomes independent after conflict between Pakistani forces and Bengali nationalists, with Indian intervention.'),
(218, 'Military coup in Chile', 1973, 'coordinates', 'Chile', -33.4489, -70.6693, 'Armed forces overthrow an elected government', 'The coup removes President Salvador Allende and begins Augusto Pinochet\'s dictatorship.'),
(219, 'Fall of Saigon', 1975, 'coordinates', 'Vietnam', 21.0285, 105.854, 'A capital falls at the end of a long war', 'North Vietnamese forces take Saigon, ending the Vietnam War and reunifying Vietnam under communist rule.'),
(220, 'Camp David Accords', 1978, 'coordinates', 'United States', 38.9072, -77.0369, 'Leaders negotiate a peace framework', 'Egyptian and Israeli leaders reach agreements that lead to a peace treaty.'),
(221, 'Iranian Revolution', 1979, 'coordinates', 'Iran', 35.6892, 51.389, 'A monarchy is overthrown', 'Mass protests and political upheaval lead to the establishment of the Islamic Republic.'),
(222, 'Soviet invasion of Afghanistan', 1979, 'coordinates', 'Afghanistan', 34.5553, 69.2075, 'Foreign troops enter a mountainous country', 'Soviet forces intervene militarily, beginning a long and destructive war.'),
(223, 'Bhopal gas disaster', 1984, 'coordinates', 'India', 28.6139, 77.209, 'A toxic leak devastates a city', 'A chemical leak at a pesticide plant causes thousands of deaths and long-term health effects.'),
(224, 'Chernobyl nuclear disaster', 1986, 'coordinates', 'Ukraine', 50.4501, 30.5234, 'A reactor accident releases radiation', 'An explosion and fire at the Chernobyl nuclear power plant contaminate large areas.'),
(225, 'Fall of the Berlin Wall', 1989, 'coordinates', 'Germany', 52.52, 13.405, 'A border barrier opens unexpectedly', 'East German authorities open border crossings, becoming a symbol of the end of Cold War division in Europe.'),
(226, 'Tiananmen Square protests and crackdown', 1989, 'coordinates', 'China', 39.9042, 116.407, 'A protest movement is violently suppressed', 'Protests in Beijing are ended by a military crackdown; casualty estimates remain contested.'),
(227, 'Nelson Mandela is released from prison', 1990, 'coordinates', 'South Africa', -25.7479, 28.2293, 'A political prisoner walks free', 'Mandela\'s release becomes a key turning point in negotiations to end apartheid.'),
(228, 'Maastricht Treaty signed', 1992, 'coordinates', 'Netherlands', 52.3676, 4.9041, 'A treaty lays foundations for a union', 'European leaders sign the treaty that establishes the European Union framework.'),
(229, 'Rwandan genocide', 1994, 'country', 'Rwanda', -1.9441, 30.0619, 'Mass killings target a population', 'Extremist forces and others kill large numbers of Tutsi and moderate Hutu in a genocide.'),
(230, 'End of apartheid and first multiracial election', 1994, 'coordinates', 'South Africa', -25.7479, 28.2293, 'A nation votes in a historic election', 'South Africans elect Nelson Mandela president in the first national election open to all races.'),
(231, 'Hong Kong handover', 1997, 'coordinates', 'China', 22.3193, 114.169, 'A city changes sovereign administration', 'The United Kingdom transfers sovereignty over Hong Kong to China.'),
(232, 'Good Friday Agreement', 1998, 'coordinates', 'United Kingdom', 54.5973, -5.9301, 'A peace accord addresses a long conflict', 'The agreement establishes power-sharing arrangements and a framework for peace in Northern Ireland.'),
(233, 'September 11 attacks', 2001, 'coordinates', 'United States', 38.9072, -77.0369, 'Hijacked planes strike major landmarks', 'Al-Qaeda attacks New York and Washington, D.C., killing thousands and reshaping global security policy.'),
(234, 'Human Genome Project is completed', 2003, 'country', 'United States', 38.9072, -77.0369, 'A scientific project maps human DNA', 'Researchers announce completion of the international effort to sequence the human genome.'),
(235, 'Indian Ocean earthquake and tsunami', 2004, 'coordinates', 'Indonesia', -6.2088, 106.846, 'A huge wave crosses an ocean basin', 'A powerful undersea earthquake triggers a tsunami that kills people across countries bordering the Indian Ocean.');
INSERT INTO `events` (`id`, `name`, `year`, `location_type`, `country`, `coordinate_lat`, `coordinate_lng`, `alternative_name`, `description`) VALUES
(236, 'Kyoto Protocol enters into force', 2005, 'country', 'World', 0, 0, 'A climate treaty becomes binding', 'The international agreement commits participating industrialized countries to emissions targets.'),
(237, 'Global financial crisis intensifies', 2008, 'coordinates', 'United States', 38.9072, -77.0369, 'A banking collapse shakes world markets', 'The crisis accelerates after major financial institutions fail or require rescue, causing a global recession.'),
(238, 'Fukushima nuclear disaster', 2011, 'coordinates', 'Japan', 35.6762, 139.65, 'A tsunami disables a power station', 'An earthquake and tsunami cause a severe nuclear accident at Fukushima Daiichi.'),
(239, 'South Sudan becomes independent', 2011, 'country', 'South Sudan', 4.8594, 31.5713, 'A new country is born', 'South Sudan becomes independent after a referendum following decades of conflict.'),
(240, 'Annexation of Crimea by Russia', 2014, 'coordinates', 'Ukraine', 50.4501, 30.5234, 'A peninsula changes control after intervention', 'Russia takes control of Crimea following military intervention and a disputed referendum, widely rejected internationally.'),
(241, 'Paris climate agreement adopted', 2015, 'coordinates', 'France', 48.8566, 2.3522, 'Countries agree on a climate framework', 'Nearly all countries adopt a global agreement to limit warming and strengthen climate action.'),
(242, 'United Kingdom votes for Brexit', 2016, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A referendum favors leaving a union', 'A majority of voters choose to leave the European Union in a national referendum.'),
(243, 'First COVID-19 cases recognized', 2019, 'coordinates', 'China', 39.9042, 116.407, 'A new respiratory disease is identified', 'Cases of a novel coronavirus are identified in Wuhan in late 2019.'),
(244, 'COVID-19 declared a pandemic', 2020, 'country', 'World', 0, 0, 'A disease outbreak becomes a global emergency', 'The World Health Organization characterizes COVID-19 as a pandemic as outbreaks spread worldwide.'),
(245, 'Taliban returns to power in Afghanistan', 2021, 'coordinates', 'Afghanistan', 34.5553, 69.2075, 'A government collapses as fighters enter a capital', 'The Taliban takes Kabul as the Afghan government collapses during the withdrawal of foreign forces.'),
(246, 'Russia launches full-scale invasion of Ukraine', 2022, 'coordinates', 'Ukraine', 50.4501, 30.5234, 'A large-scale invasion begins in Europe', 'Russian forces begin a full-scale invasion of Ukraine on 24 February, escalating a conflict that began in 2014.'),
(247, 'Türkiye–Syria earthquakes', 2023, 'coordinates', 'Turkey', 39.9334, 32.8597, 'Powerful earthquakes devastate a region', 'Major earthquakes strike southern Türkiye and northern Syria, causing widespread destruction and loss of life.'),
(248, 'Paris Summer Olympics', 2024, 'coordinates', 'France', 48.8566, 2.3522, 'A global sporting festival returns to a capital', 'Paris hosts the Summer Olympic Games, with events staged across the city and nearby venues.'),
(249, 'Total solar eclipse crosses North America', 2024, 'coordinates', 'Mexico', 19.4326, -99.1332, 'Day briefly turns to night along a continent', 'A total solar eclipse passes across parts of Mexico, the United States and Canada.'),
(250, 'Expo 2025 opens in Osaka', 2025, 'coordinates', 'Japan', 35.6762, 139.65, 'A world exposition opens on an artificial island', 'Osaka hosts a world exposition focused on future society, technology and international exchange.');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isadmin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `isadmin`) VALUES
(1, 'admin', 'admin@eventle.com', '$2b$10$K9cRbK0mMKeblRwD5UTtNuEa232gnfgRLjPgSY0G6BhSUpJli79Ly', 0),
(2, 'a', 'a@eventle.com', '$2b$10$JamCiyNP9mv1YXEcC6OfwOW38S.Taxk01duIMLTq89dPT5eluj77m', 0),
(3, 'b', 'b@eventle.com', '$2b$10$8iDpavsmfg23HQ0l/yr54ekr4OeQrorbTsYfJVKTLmYSNsrVay8PW', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`game_date`),
  ADD KEY `fk_archive_event` (`event_id`),
  ADD KEY `fk_archive_comparison1` (`comparison1`),
  ADD KEY `fk_archive_comparison2` (`comparison2`),
  ADD KEY `fk_archive_comparison3` (`comparison3`);

--
-- Index pour la table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `archive`
--
ALTER TABLE `archive`
  ADD CONSTRAINT `fk_archive_comparison1` FOREIGN KEY (`comparison1`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `fk_archive_comparison2` FOREIGN KEY (`comparison2`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `fk_archive_comparison3` FOREIGN KEY (`comparison3`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `fk_archive_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
