-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 25 nov. 2026 à 13:33
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
('2026-10-29', 63, 1, 95, 160);

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
  `alternative_name` varchar(200) DEFAULT NULL,
  `description` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `events`
--

INSERT INTO `events` (`id`, `name`, `year`, `location_type`, `country`, `coordinate_lat`, `coordinate_lng`, `alternative_name`, `description`) VALUES
(1, 'Agriculture begins to spread', -10000, 'country', 'Iraq', 33.3152, 44.3661, 'Hunter-gatherers begin sowing wild cereals and keeping livestock, the first step toward farming villages.', 'Communities increasingly cultivate plants and settle in parts of Southwest Asia.'),
(2, 'Çatalhöyük settlement develops', -9000, 'coordinates', 'Turkey', 37.6667, 32.8289, 'A Neolithic town of mud-brick houses with no streets, entered through roof hatches, is home to thousands of people.', 'A large Neolithic settlement grows in Anatolia, with dense housing and wall paintings.'),
(3, 'Jericho becomes a major early settlement', -8000, 'coordinates', 'Palestine', 31.8667, 35.45, 'A walled settlement beside a freshwater spring grows around a stone tower in one of the oldest continuously inhabited towns.', 'One of the world\'s oldest continuously inhabited settlement areas expands.'),
(4, 'Jiahu community flourishes', -6000, 'coordinates', 'China', 33.6167, 113.683, 'A Neolithic village is known for its bone flutes and early symbols carved on tortoise shells.', 'An early Chinese community leaves evidence of rice use, musical instruments and symbolic markings.'),
(5, 'Austronesian seafaring traditions develop', -5000, 'coordinates', 'Taiwan', 25.033, 121.565, 'Outrigger-canoe sailors from an island begin settling the far-flung islands of the Pacific and Indian Oceans.', 'Ancestors of Austronesian-speaking peoples develop maritime traditions that later spread across the Pacific.'),
(6, 'Sumerian urban communities expand', -4000, 'country', 'Iraq', 33.3152, 44.3661, 'Temple-centered city-states with stepped ziggurats grow on the flat plain between two great rivers.', 'Urban life, specialized crafts and complex administration grow in southern Mesopotamia.'),
(7, 'Cuneiform writing emerges', -3500, 'coordinates', 'Iraq', 31.322, 45.637, 'Scribes press wedge-shaped marks into wet clay tablets, creating one of the earliest known writing systems.', 'Scribes in southern Mesopotamia develop one of the earliest known writing systems.'),
(8, 'Egypt is unified under early kings', -3200, 'coordinates', 'Egypt', 30.0444, 31.2357, 'A legendary king wearing a double crown joins a river\'s upper and lower lands into a single kingdom.', 'Political unification along the Nile lays foundations for dynastic ancient Egypt.'),
(9, 'Early dynastic state consolidates in Egypt', -2700, 'coordinates', 'Egypt', 30.0444, 31.2357, 'Pharaohs consolidate a centralized state, and the first monumental stone tomb with stepped sides is raised for a king.', 'Royal administration and monumental building strengthen the early Egyptian state.'),
(10, 'Great Pyramid of Giza is built', -2600, 'coordinates', 'Egypt', 29.9792, 31.1342, 'The largest of the ancient pyramids is raised as a pharaoh\'s tomb and stays the tallest human-made structure for millennia.', 'Workers construct the largest pyramid at Giza during the reign of Khufu.'),
(11, 'Megalithic monuments rise at Stonehenge', -2500, 'coordinates', 'United Kingdom', 51.1789, -1.8262, 'Huge standing stones, some hauled from quarries far away, are arranged in a circle in a prehistoric ceremonial monument.', 'Communities in southern Britain build and modify a ceremonial monument over many generations.'),
(12, 'Akkadian Empire is established', -2334, 'country', 'Iraq', 33.3152, 44.3661, 'Sargon of Akkad conquers rival city-states to create what is often called the world\'s first empire.', 'Sargon builds an empire linking many cities of Mesopotamia.'),
(13, 'Epic of Gilgamesh traditions take shape', -2100, 'coordinates', 'Iraq', 33.3152, 44.3661, 'Poems about a king who befriends a wild man and then searches in vain for eternal life begin to be composed.', 'Stories about a legendary Mesopotamian king develop into one of the best-known ancient literary traditions.'),
(14, 'Minoan civilization flourishes', -2000, 'coordinates', 'Greece', 35.2401, 24.8093, 'A sea-trading Bronze Age culture builds maze-like palaces decorated with frescoes of bull-leaping and dolphins.', 'Large palace centers and maritime networks thrive on Crete.'),
(15, 'Hammurabi becomes king of Babylon', -1792, 'coordinates', 'Iraq', 32.542, 44.421, 'A king has his laws engraved on a tall black stone, including the principle of an eye for an eye.', 'The Babylonian ruler later becomes famous for a surviving collection of laws.'),
(16, 'Shang dynasty emerges', -1600, 'coordinates', 'China', 39.9042, 116.407, 'A Bronze Age dynasty casts ritual vessels and cracks oracle bones to ask questions of its ancestors.', 'An early Chinese dynasty leaves archaeological evidence of bronze casting and royal ritual.'),
(17, 'Vedic traditions develop in South Asia', -1500, 'coordinates', 'India', 28.6139, 77.209, 'Priests compose and memorize sacred Sanskrit hymns that will form the oldest layer of a vast religious tradition.', 'Oral religious and poetic traditions that become central to early Hindu culture develop.'),
(18, 'Mycenaean palace culture expands', -1450, 'coordinates', 'Greece', 37.9838, 23.7275, 'Warrior kings rule from hilltop citadels with massive stone gates, one of them decorated with a pair of carved lions.', 'Palatial societies flourish on the Greek mainland during the Late Bronze Age.'),
(19, 'Zhou dynasty takes power', -1046, 'coordinates', 'China', 39.9042, 116.407, 'A dynasty overthrows its predecessor and claims the Mandate of Heaven to justify its rule.', 'The Zhou defeat the Shang and establish a long-lasting Chinese dynasty.'),
(20, 'Kingdom of Kush develops around Napata', -1000, 'coordinates', 'Sudan', 15.5007, 32.5599, 'A powerful African kingdom with its capital beneath a sacred mountain builds small steep pyramids and later conquers its northern neighbor.', 'A powerful Nubian kingdom grows along the Nile and later rules Egypt for a time.'),
(21, 'Carthage is traditionally founded', -814, 'coordinates', 'Tunisia', 36.8528, 10.3233, 'According to legend, Queen Dido leads Phoenician settlers who found a city that will become Rome\'s greatest rival.', 'Phoenician settlers establish a city that becomes a major Mediterranean power; the traditional date is approximate.'),
(22, 'First recorded ancient Olympic Games', -776, 'coordinates', 'Greece', 37.6383, 21.63, 'A festival of foot races in honor of Zeus becomes the first to be officially recorded, crowning winners with olive wreaths.', 'The earliest traditionally recorded Olympic festival is held in Greece.'),
(23, 'Maya civilization develops major centers', -650, 'country', 'Guatemala', 14.6349, -90.5069, 'Dense jungle cities with stepped temples and hieroglyphic inscriptions begin growing into powerful city-states.', 'Maya communities build important ceremonial and political centers in Mesoamerica.'),
(24, 'Buddhism emerges in northern India', -600, 'coordinates', 'India', 28.6139, 77.209, 'A path of meditation and ethical living, promising an end to suffering without priests or gods, attracts its first followers.', 'Siddhartha Gautama\'s teachings develop into a major religious and philosophical tradition; the precise dates are debated.'),
(25, 'Traditional birth year of Siddhartha Gautama', -563, 'coordinates', 'Nepal', 27.7172, 85.324, 'A prince is born in a garden grove, and legend says sages foretold he would become either a great king or a great teacher.', 'Traditional chronology places the birth of the future Buddha at Lumbini.'),
(26, 'Persian Empire expands under Cyrus', -550, 'country', 'Iran', 35.6892, 51.389, 'A conqueror topples the Median and Babylonian kings and builds the largest empire yet seen, remembered for freeing captive peoples.', 'Cyrus the Great establishes a major empire across western and central Asia.'),
(27, 'Roman Republic traditionally begins', -509, 'coordinates', 'Italy', 41.9028, 12.4964, 'After the last king is expelled, a city replaces monarchy with two annually elected leaders called consuls.', 'Roman tradition dates the establishment of the republic to the end of monarchy.'),
(28, 'Battle of Marathon', -490, 'coordinates', 'Greece', 38.153, 23.962, 'Outnumbered city-state soldiers repel a landing by the Persian king\'s army, and a legendary runner carries the news home.', 'Athenian and allied Greek forces defeat a Persian expeditionary army.'),
(29, 'Battle of Thermopylae', -480, 'coordinates', 'Greece', 38.796, 22.536, 'A small band of three hundred Spartans and their allies holds a narrow coastal pass against a vast Persian army.', 'A Greek force led by Spartans resists the Persian advance before being overcome.'),
(30, 'Battle of Salamis', -480, 'coordinates', 'Greece', 37.964, 23.496, 'In a narrow strait, allied triremes lure a much larger Persian navy into a trap and destroy it.', 'Greek naval forces defeat the Persian fleet near Salamis.'),
(31, 'Greek forces win at Plataea', -479, 'coordinates', 'Greece', 38.2167, 23.2667, 'The final land battle of a great invasion sees allied city-states crush the remaining Persian army after its naval defeat.', 'Greek allies defeat a Persian army, helping end the invasion of mainland Greece.'),
(32, 'Twelve Tables of Roman law', -450, 'coordinates', 'Italy', 41.9028, 12.4964, 'A republic carves its first written laws on twelve bronze tablets and displays them in the public square.', 'Roman legal rules are publicly inscribed, becoming an important foundation of later Roman legal tradition.'),
(33, 'Trial and death of Socrates', -399, 'coordinates', 'Greece', 37.9838, 23.7275, 'A philosopher known for relentless questioning is convicted of corrupting the youth and drinks poison hemlock.', 'The Athenian philosopher is sentenced to death after a trial recorded by his students.'),
(34, 'Alexander begins his Persian campaign', -334, 'coordinates', 'Turkey', 39.9334, 32.8597, 'A young Macedonian king leads his army across a narrow strait to begin his invasion of the Persian Empire.', 'Alexander of Macedon launches the campaign that will topple the Achaemenid Persian Empire.'),
(35, 'Battle of Gaugamela', -331, 'coordinates', 'Iraq', 33.3152, 44.3661, 'A smaller army defeats the Persian king\'s vast force, including scythed chariots, and opens the way to his capitals.', 'Alexander defeats Darius III\'s forces, accelerating the collapse of Persian imperial rule.'),
(36, 'Death of Alexander the Great', -323, 'coordinates', 'Iraq', 32.542, 44.421, 'A conqueror who never lost a battle dies of fever at about thirty-two, and his generals begin fighting over his empire.', 'Alexander dies in Babylon, and his commanders struggle over his vast conquests.'),
(37, 'Qin unifies China', -221, 'coordinates', 'China', 39.9042, 116.407, 'A ruthless king defeats the last rival states and becomes the First Emperor, standardizing writing, weights and measures.', 'Qin Shi Huang becomes the first emperor of a unified Chinese state.'),
(38, 'Han dynasty begins', -206, 'country', 'China', 39.9042, 116.407, 'A peasant-born rebel founds a dynasty that will rule for four centuries after the harsh regime before it collapses.', 'The Han dynasty succeeds the Qin and becomes one of China\'s defining imperial periods.'),
(39, 'Battle of Zama', -202, 'coordinates', 'Tunisia', 36.8065, 10.1815, 'Hannibal\'s army, including war elephants, is defeated by a Roman general, ending the Second Punic War.', 'Roman forces defeat Hannibal\'s Carthaginian army, ending the Second Punic War.'),
(40, 'Carthage is destroyed by Rome', -146, 'coordinates', 'Tunisia', 36.8528, 10.3233, 'Rome finally levels its old rival after a long siege, burning the city for days and, as legend says, sowing it with salt.', 'Roman forces destroy Carthage at the end of the Third Punic War.'),
(41, 'Spartacus revolt begins', -73, 'coordinates', 'Italy', 41.9028, 12.4964, 'A gladiator escapes his training school and leads a huge slave army that defeats several Roman legions.', 'A major uprising of enslaved people and gladiators challenges the Roman Republic.'),
(42, 'Battle of Actium', -31, 'coordinates', 'Greece', 37.9838, 23.7275, 'A naval battle sees Octavian\'s fleet rout the combined forces of Antony and Cleopatra.', 'Octavian defeats the forces of Mark Antony and Cleopatra, paving the way for sole rule.'),
(43, 'Roman Empire conventionally begins', -27, 'coordinates', 'Italy', 41.9028, 12.4964, 'A victorious general is given the name Augustus and quietly becomes the first emperor while keeping up republican appearances.', 'Octavian receives the title Augustus and becomes Rome\'s first emperor.'),
(44, 'Battle of the Teutoburg Forest', 9, 'coordinates', 'Germany', 52.52, 13.405, 'Three Roman legions are wiped out in a woodland ambush by tribal warriors under a chieftain named Arminius, halting Rome\'s expansion.', 'Germanic forces destroy three Roman legions, limiting Roman expansion east of the Rhine.'),
(45, 'Great Fire of Rome', 64, 'coordinates', 'Italy', 41.9028, 12.4964, 'A blaze burns for days through crowded wooden neighborhoods, and a notorious emperor is rumored to have fiddled as it burned.', 'A major fire damages much of Rome during Nero\'s reign.'),
(46, 'Papermaking process reported in China', 105, 'coordinates', 'China', 39.9042, 116.407, 'A court official reports a new writing material made from rags, bark and old fishing nets, cheaper than silk or bamboo.', 'Tradition credits Cai Lun with reporting improvements to papermaking at the Han court.'),
(47, 'Yellow Turban Rebellion', 184, 'coordinates', 'China', 39.9042, 116.407, 'Rebels wearing colored headcloths and following a faith-healing movement rise up against a weakening dynasty.', 'A large rebellion contributes to the weakening of the Eastern Han dynasty.'),
(48, 'Han dynasty ends', 220, 'coordinates', 'China', 39.9042, 116.407, 'The last emperor of a four-century dynasty is forced to abdicate, and the land splits into three rival kingdoms.', 'The Han court collapses and China enters the Three Kingdoms era.'),
(49, 'Edict of Milan', 313, 'coordinates', 'Italy', 45.4642, 9.19, 'Two co-emperors agree to end the persecution of a once-banned religion and grant freedom of worship.', 'Roman emperors Constantine and Licinius agree to grant religious toleration, including to Christians.'),
(50, 'Goths cross the Danube into Roman territory', 376, 'coordinates', 'Romania', 44.4268, 26.1025, 'Fleeing the Huns, thousands of Gothic refugees are let into the empire, but mistreatment soon turns them into rebels.', 'Gothic groups enter Roman territory, intensifying pressures on the empire.'),
(51, 'Christianity becomes the empire\'s official religion', 380, 'coordinates', 'Greece', 40.6401, 22.9444, 'An emperor decrees that all his subjects should follow the faith of the bishops, making a once-persecuted religion the official one.', 'Theodosius I issues an edict supporting Nicene Christianity as the empire\'s official religious standard.'),
(52, 'Roman Empire is permanently divided administratively', 395, 'coordinates', 'Italy', 41.9028, 12.4964, 'After an emperor\'s death, his two sons inherit separate halves of the empire, and the split is never reversed.', 'After Theodosius I\'s death, the eastern and western courts develop separately.'),
(53, 'Sack of Rome by the Visigoths', 410, 'coordinates', 'Italy', 41.9028, 12.4964, 'A Gothic king and his army breach the walls of the ancient capital and plunder it for three days, shocking the Mediterranean world.', 'Visigothic forces under Alaric sack Rome, a shock to the western empire.'),
(54, 'Battle of the Catalaunian Plains', 451, 'coordinates', 'France', 48.8566, 2.3522, 'A Roman-Gothic alliance halts the invasion led by Attila the Hun, known as the Scourge of God.', 'Roman and allied forces fight Attila\'s Huns in a major battle in Gaul.'),
(55, 'Battle of Vouillé', 507, 'coordinates', 'France', 48.8566, 2.3522, 'Clovis and his Franks defeat the Visigothic king, driving the Goths out of most of the lands north of the Pyrenees.', 'Clovis\'s forces defeat the Visigoths, expanding Frankish power in Gaul.'),
(56, 'Justinian I becomes Byzantine emperor', 527, 'coordinates', 'Turkey', 41.0082, 28.9784, 'A peasant-born emperor takes the throne determined to reconquer the lost western provinces and codify Roman law.', 'Justinian begins a reign known for legal reform, monumental architecture and military reconquest.'),
(57, 'Nika riots', 532, 'coordinates', 'Turkey', 41.0082, 28.9784, 'Chariot-racing factions unite against the emperor, and a huge riot burns much of the capital, including its great church.', 'Factional unrest erupts into a major uprising against Justinian in Constantinople.'),
(58, 'Traditional founding of Iona monastery', 563, 'coordinates', 'United Kingdom', 55.9533, -3.1883, 'An exiled Irish monk founds an island monastery that will spread Christianity among northern peoples.', 'Columba and companions establish a religious community that becomes influential in early medieval Christianity.'),
(59, 'Traditional birth year of Muhammad', 570, 'coordinates', 'Saudi Arabia', 24.7136, 46.6753, 'The future founder of Islam is born into a merchant clan in a caravan city, according to tradition.', 'Traditional accounts place Muhammad\'s birth in Mecca around this year.'),
(60, 'Hijra: Muhammad migrates to Medina', 622, 'coordinates', 'Saudi Arabia', 24.7136, 46.6753, 'A persecuted prophet and his followers leave their home town for an oasis city, a journey that begins a new calendar.', 'Muhammad\'s move from Mecca to Medina becomes the starting point of the Islamic calendar.'),
(61, 'Death of Muhammad', 632, 'coordinates', 'Saudi Arabia', 24.7136, 46.6753, 'The prophet dies after a short illness, leaving his young community to choose a successor, or caliph.', 'Muhammad dies in Medina, and leadership of the expanding Muslim community becomes a central issue.'),
(62, 'Battle of Yarmouk', 636, 'coordinates', 'Syria', 33.5138, 36.2765, 'In a river-valley battle, an Arab army defeats the Byzantine emperor\'s forces and opens the eastern provinces to conquest.', 'Arab Muslim forces defeat Byzantine armies, helping shift control of the Levant.'),
(63, 'Umayyad Caliphate begins', 661, 'coordinates', 'Syria', 33.5138, 36.2765, 'A governor founds the first hereditary caliphate and moves its capital away from Arabia.', 'The Umayyad dynasty establishes its center in Damascus and governs a rapidly expanding caliphate.'),
(64, 'Umayyad forces enter Iberia', 711, 'coordinates', 'Spain', 40.4168, -3.7038, 'An army led by Tariq crosses a narrow strait and defeats the last Visigothic king, beginning centuries of Muslim rule in the west.', 'Muslim forces cross from North Africa into the Iberian Peninsula.'),
(65, 'Abbasid Revolution', 750, 'coordinates', 'Iraq', 33.3152, 44.3661, 'Rebels carrying black banners topple the ruling caliph\'s family and start a dynasty claiming descent from the Prophet\'s uncle.', 'The Abbasids overthrow the Umayyads in most of the caliphate and later build a new capital at Baghdad.'),
(66, 'Baghdad is founded', 762, 'country', 'Iraq', 33.3152, 44.3661, 'A caliph lays out a circular City of Peace as his new capital, which soon becomes a famous center of learning.', 'The Abbasid caliph al-Mansur establishes Baghdad as a new capital and major intellectual center.'),
(67, 'Raid on Lindisfarne', 793, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'Longships land warriors who plunder a holy island\'s monastery, an attack often seen as the start of the Viking Age.', 'A Viking raid on the Northumbrian monastery becomes a famous marker of Viking activity in western Europe.'),
(68, 'Charlemagne is crowned emperor', 800, 'coordinates', 'Italy', 41.9028, 12.4964, 'On Christmas Day, the pope places a crown on a Frankish king and proclaims him emperor of the Romans.', 'Pope Leo III crowns Charlemagne emperor, symbolically reviving an imperial title in western Europe.'),
(69, 'Sailendra-era Borobudur construction begins', 820, 'coordinates', 'Indonesia', -6.2088, 106.846, 'A giant Buddhist monument shaped like a mandala, with hundreds of carved panels and stupas, begins to rise from volcanic soil.', 'Construction of the Buddhist temple complex in Java begins around this period.'),
(70, 'Diamond Sutra is printed', 868, 'coordinates', 'China', 39.9042, 116.407, 'The oldest dated printed book, a Buddhist scroll, is produced using carved wooden blocks.', 'A Chinese copy of the Buddhist text becomes the oldest known complete dated printed book.'),
(71, 'Tang dynasty ends', 907, 'coordinates', 'China', 39.9042, 116.407, 'A dynasty famed for its poets and cosmopolitan capital is deposed by a warlord, and the land splits into the Five Dynasties.', 'The Tang falls, beginning a period of political fragmentation before reunification under the Song.'),
(72, 'Song dynasty begins', 960, 'country', 'China', 39.9042, 116.407, 'A general is hailed as emperor by his own soldiers and reunites most of the land after the Five Dynasties period.', 'The Song era is noted for urban growth, commerce, printing and technological advances.'),
(73, 'Capetian dynasty begins', 987, 'country', 'France', 48.8566, 2.3522, 'Hugh Capet is chosen king by the nobles, founding a dynasty that would rule for centuries.', 'Hugh Capet becomes king, beginning a dynasty that shapes French monarchy for centuries.'),
(74, 'Norse settlement at L\'Anse aux Meadows', 1000, 'coordinates', 'Canada', 45.4215, -75.6972, 'Norse sailors build turf-walled halls on a far western shore, the earliest known European presence across the Atlantic.', 'Norse explorers establish a short-lived settlement in Newfoundland, evidence of pre-Columbian European arrival in the Americas.'),
(75, 'East–West Schism conventionally dated', 1054, 'coordinates', 'Turkey', 41.0082, 28.9784, 'Mutual excommunications between the pope\'s legate and a patriarch split Christendom into Catholic and Orthodox halves.', 'A long process of estrangement between Latin and Greek Christian churches is symbolically dated to this year.'),
(76, 'Norman Conquest of England', 1066, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A duke\'s army lands on the south coast and kills the Anglo-Saxon king, and the winner is crowned at Christmas.', 'William of Normandy defeats Harold Godwinson at Hastings and takes the English throne.'),
(77, 'Battle of Manzikert', 1071, 'coordinates', 'Turkey', 39.9334, 32.8597, 'The Byzantine emperor is captured by a Seljuk sultan\'s army, opening the empire\'s heartland to settlement by steppe nomads.', 'Seljuk forces defeat the Byzantine army, contributing to changes in Anatolia.'),
(78, 'First Crusade is proclaimed', 1095, 'country', 'France', 48.8566, 2.3522, 'At a church council, the pope urges Christian knights to march east to aid the Byzantines and win back the Holy Land.', 'Pope Urban II calls for a military expedition to the eastern Mediterranean.'),
(79, 'Second Crusade begins', 1147, 'coordinates', 'France', 48.8566, 2.3522, 'A saint\'s preaching rallies two kings, of the Franks and the Germans, to march east after a Crusader county falls.', 'European rulers launch a crusade after the fall of Edessa.'),
(80, 'Battle of Hattin', 1187, 'coordinates', 'Israel', 31.7683, 35.2137, 'Saladin\'s army surrounds and destroys a Crusader force on a waterless plain, leading to the loss of Jerusalem.', 'Saladin defeats Crusader forces, leading to the recapture of Jerusalem.'),
(81, 'Delhi Sultanate is established', 1206, 'country', 'India', 28.6139, 77.209, 'A former slave-commander founds the first of a series of Muslim sultanates ruling the northern plains of the subcontinent.', 'Qutb al-Din Aibak establishes a sultanate that becomes a major political force in the subcontinent.'),
(82, 'Genghis Khan is proclaimed ruler', 1206, 'country', 'Mongolia', 47.9184, 106.918, 'A great assembly of steppe clans gives a unifier the title meaning universal ruler.', 'Temüjin is proclaimed Genghis Khan, beginning the expansion of the Mongol Empire.'),
(83, 'Magna Carta is sealed', 1215, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'Rebel barons force an unpopular king to seal a charter promising that even he must obey the law.', 'King John agrees to a charter that later becomes a symbol of constraints on royal power.'),
(84, 'Mongols sack Baghdad', 1258, 'coordinates', 'Iraq', 33.3152, 44.3661, 'A Mongol army storms the seat of the caliphate, kills the caliph and, tradition says, turns a river black with the ink of destroyed books.', 'Hülegü\'s forces capture Baghdad, ending Abbasid caliphal rule there and devastating the city.'),
(85, 'Yuan dynasty is proclaimed', 1271, 'country', 'China', 39.9042, 116.407, 'Kublai Khan adopts a traditional dynastic name for his Mongol regime and rules from a new capital.', 'Kublai Khan proclaims the Yuan dynasty, later completing the conquest of Song China.'),
(86, 'Song dynasty ends', 1279, 'coordinates', 'China', 39.9042, 116.407, 'In a final sea battle, a boy emperor is carried to his death in the waves, ending the last independent southern dynasty.', 'Yuan forces defeat the Southern Song, bringing all of China under Mongol rule.'),
(87, 'Fall of Acre', 1291, 'coordinates', 'Israel', 31.7683, 35.2137, 'The last big Crusader stronghold on the mainland falls to the Mamluks, ending Latin rule in the Holy Land.', 'Mamluk forces capture Acre, ending the Crusader presence in the mainland Levant.'),
(88, 'Tenochtitlan is traditionally founded', 1325, 'coordinates', 'Mexico', 19.4326, -99.1332, 'According to legend, wandering people see an eagle perched on a cactus and build their capital on an island in a lake.', 'Mexica tradition dates the founding of their island capital in Lake Texcoco to this year.'),
(89, 'Hundred Years\' War begins', 1337, 'country', 'France', 48.8566, 2.3522, 'A dispute over who should wear a crown begins a long, on-and-off struggle between two monarchies on either side of a channel.', 'A prolonged conflict between English and French dynasties begins, lasting intermittently for more than a century.'),
(90, 'Black Death reaches Mediterranean Europe', 1347, 'coordinates', 'Italy', 41.9028, 12.4964, 'Galleys from the Black Sea bring a plague to the ports, beginning a pandemic that will kill about a third of the continent.', 'Plague spreads through Mediterranean ports and across Europe, causing catastrophic mortality.'),
(91, 'Ming dynasty begins', 1368, 'country', 'China', 39.9042, 116.407, 'A peasant-born rebel leader drives out the Mongol rulers and proclaims himself the Hongwu Emperor.', 'Zhu Yuanzhang establishes the Ming dynasty after the collapse of Yuan authority.'),
(92, 'Timur rises to power in Transoxiana', 1377, 'coordinates', 'Uzbekistan', 41.2995, 69.2401, 'A limping warlord who claimed descent from Genghis Khan seizes power and begins building his own vast empire.', 'Timur establishes a base in Central Asia and launches campaigns across western and southern Asia.'),
(93, 'Zheng He begins maritime voyages', 1405, 'coordinates', 'China', 39.9042, 116.407, 'A eunuch admiral sets sail with a huge treasure fleet of giant ships to display an emperor\'s power across the seas.', 'Ming admiral Zheng He leads the first of a series of major state-sponsored voyages.'),
(94, 'Forbidden City construction begins', 1420, 'coordinates', 'China', 39.9042, 116.407, 'Hundreds of thousands of laborers begin building a vast palace of nearly a thousand buildings, closed to ordinary people.', 'Construction begins on Beijing\'s palace complex, which becomes the center of Ming and Qing rule.'),
(95, 'Joan of Arc is executed', 1431, 'coordinates', 'France', 48.8566, 2.3522, 'A teenage peasant girl who led an army after claiming divine visions is burned at the stake as a heretic.', 'Joan of Arc is executed after an ecclesiastical trial during the Hundred Years\' War.'),
(96, 'Fall of Constantinople', 1453, 'coordinates', 'Turkey', 41.0082, 28.9784, 'Giant cannons breach the triple walls, and the Ottoman sultan enters the last Byzantine city, ending an empire.', 'Ottoman forces under Mehmed II capture Constantinople, ending the Byzantine Empire.'),
(97, 'Gutenberg Bible is printed', 1455, 'coordinates', 'Germany', 52.52, 13.405, 'A goldsmith\'s movable-type press produces a monumental Latin Bible, launching a revolution in printing.', 'Johannes Gutenberg\'s workshop produces a landmark early European printed Bible.'),
(98, 'Marriage joins the crowns of Castile and Aragon', 1469, 'coordinates', 'Spain', 40.4168, -3.7038, 'A prince and princess marry in secret, uniting two powerful kingdoms that will form a single country.', 'The marriage of Isabella and Ferdinand helps lay foundations for a unified Spanish monarchy.'),
(99, 'Columbus reaches the Caribbean', 1492, 'coordinates', 'Bahamas', 25.0343, -77.3963, 'An Italian captain sailing for Spain sights land after weeks at sea, believing he has reached the Indies.', 'Christopher Columbus\'s expedition reaches the Caribbean, initiating sustained contact between Europe and the Americas.'),
(100, 'Treaty of Tordesillas', 1494, 'coordinates', 'Spain', 40.4168, -3.7038, 'A pope-backed treaty splits all newly found lands outside Europe between two rival crowns along a north-south line.', 'Spain and Portugal agree to a line dividing their claimed spheres of expansion.'),
(101, 'Vasco da Gama reaches India by sea', 1498, 'coordinates', 'India', 28.6139, 77.209, 'A Portuguese fleet rounds Africa and anchors off a spice-trading port, opening a sea route to the East.', 'The Portuguese navigator reaches Calicut by sailing around Africa.'),
(102, 'Safavid dynasty takes power', 1501, 'coordinates', 'Iran', 35.6892, 51.389, 'A teenage shah, head of a Sufi order, takes the throne and makes Twelver Shia Islam the state religion of a new empire.', 'Ismail I establishes Safavid rule and helps make Twelver Shiism central to Iran.'),
(103, 'Protestant Reformation begins', 1517, 'coordinates', 'Germany', 52.52, 13.405, 'A monk is said to have nailed his Ninety-five Theses against the sale of indulgences to a church door.', 'Martin Luther\'s challenge to indulgence practices becomes a major catalyst for religious reform in Europe.'),
(104, 'Smallpox epidemic strikes central Mexico', 1520, 'coordinates', 'Mexico', 19.4326, -99.1332, 'A fatal fever unknown in the Americas, brought by a sick newcomer, sweeps through the Aztec lands and kills multitudes.', 'Disease introduced from Europe contributes to severe population loss during the conquest period.'),
(105, 'Fall of Tenochtitlan', 1521, 'coordinates', 'Mexico', 19.4326, -99.1332, 'After a months-long siege with brigantine ships on the lake, an Aztec capital is taken and its last emperor captured.', 'Spanish and Indigenous allied forces capture the Mexica capital after a long siege.'),
(106, 'First circumnavigation is completed', 1522, 'country', 'Spain', 40.4168, -3.7038, 'One battered ship of a five-vessel fleet returns home, completing the first voyage around the world after its captain was killed.', 'The surviving ship of Magellan\'s expedition returns to Spain under Juan Sebastián Elcano.'),
(107, 'Mughal Empire is founded in India', 1526, 'country', 'India', 28.6139, 77.209, 'A Central Asian prince using gunpowder and cannon defeats the Sultan of Delhi at Panipat and founds a new dynasty.', 'Babur defeats the Delhi Sultanate at Panipat and establishes Mughal rule.'),
(108, 'Copernicus publishes heliocentric model', 1543, 'coordinates', 'Poland', 52.2297, 21.0122, 'A canon\'s book, published as he lay dying, argues that the Earth and the planets orbit the Sun.', 'A landmark work argues that Earth and other planets revolve around the Sun.'),
(109, 'Peace of Augsburg', 1555, 'coordinates', 'Germany', 52.52, 13.405, 'Princes of a patchwork empire agree that each ruler may choose between Lutheranism and Catholicism for his subjects.', 'The agreement allows rulers in the Holy Roman Empire to choose between Catholicism and Lutheranism for their territories.'),
(110, 'Spanish settlement established at Cebu', 1565, 'coordinates', 'Philippines', 14.5995, 120.984, 'A conquistador builds a fort and founds the first lasting Spanish town in a far eastern archipelago.', 'Miguel López de Legazpi establishes a lasting Spanish colonial foothold in the Philippines.'),
(111, 'Battle of Lepanto', 1571, 'coordinates', 'Greece', 37.9838, 23.7275, 'A Holy League fleet of galleys destroys the Ottoman navy in a battle where the author Cervantes was wounded.', 'A Holy League fleet defeats the Ottoman navy in a major Mediterranean engagement.'),
(112, 'Gregorian calendar reform introduced', 1582, 'coordinates', 'Italy', 41.9028, 12.4964, 'A pope drops ten days from the calendar to fix the drifting date of Easter.', 'Pope Gregory XIII promulgates a calendar reform that gradually spreads around the world.'),
(113, 'Japanese invasions of Korea begin', 1592, 'coordinates', 'South Korea', 37.5665, 126.978, 'A powerful regent sends an army across a strait aiming to conquer a peninsula and, ultimately, the empire beyond.', 'Japanese forces invade Korea, beginning a destructive conflict involving Ming China.'),
(114, 'Battle of Sekigahara', 1600, 'coordinates', 'Japan', 35.6762, 139.65, 'A decisive clash between eastern and western clans reunites the realm under a new shogun, founder of a long-lasting dynasty.', 'Tokugawa Ieyasu\'s victory helps establish the Tokugawa shogunate.'),
(115, 'Jamestown is founded', 1607, 'country', 'United States', 38.9072, -77.0369, 'Colonists funded by a joint-stock company found England\'s first lasting settlement in North America, nearly dying in the starving time.', 'English colonists establish Jamestown in Virginia, the first permanent English settlement in North America.'),
(116, 'Galileo observes Jupiter\'s moons', 1610, 'coordinates', 'Italy', 41.9028, 12.4964, 'An astronomer with a new telescope spots four small lights circling a planet, undermining the idea that everything orbits Earth.', 'Galileo\'s observations provide important evidence for a changing understanding of the heavens.'),
(117, 'Thirty Years\' War begins', 1618, 'country', 'Czechia', 50.0755, 14.4378, 'Protestant nobles throw royal officials out of a castle window, setting off a devastating religious war.', 'A Bohemian revolt develops into a devastating war involving many European powers.'),
(118, 'Shimabara Rebellion begins', 1637, 'coordinates', 'Japan', 35.6762, 139.65, 'Mostly Christian peasants and masterless samurai rise against heavy taxes and persecution on a southern peninsula.', 'Peasants and Christians rise against local authorities in a major uprising in Japan.'),
(119, 'Ming dynasty falls in Beijing', 1644, 'coordinates', 'China', 39.9042, 116.407, 'A rebel leader enters the capital, and the last Ming emperor hangs himself on a hill behind his palace.', 'Rebel forces capture Beijing; the Qing subsequently consolidate control over China.'),
(120, 'Peace of Westphalia', 1648, 'coordinates', 'Germany', 52.52, 13.405, 'Delegates sign treaties in two cities, ending a thirty-year war and establishing the idea of sovereign states.', 'Agreements at Münster and Osnabrück help end the Thirty Years\' War and reshape European diplomacy.'),
(121, 'Execution of Charles I', 1649, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A king is tried by Parliament and beheaded outside his own banqueting hall, and the monarchy is abolished.', 'The English king is executed after the Civil War, an extraordinary challenge to hereditary monarchy.'),
(122, 'Siege of Vienna is lifted', 1683, 'coordinates', 'Austria', 48.2082, 16.3738, 'A relief army led by a Polish king, with a huge winged-cavalry charge, ends an Ottoman siege of a Habsburg capital.', 'A relief army defeats Ottoman forces outside Vienna, halting the siege.'),
(123, 'Newton publishes Principia', 1687, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A professor publishes a book setting out the three laws of motion and the law of universal gravitation.', 'Isaac Newton publishes a work that transforms physics and mathematical astronomy.'),
(124, 'Glorious Revolution', 1688, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A Dutch prince invited by Protestant nobles lands with an army, and the Catholic king flees without a real fight.', 'James II is overthrown and William and Mary take the throne, contributing to constitutional change.'),
(125, 'Treaty of Ryswick', 1697, 'coordinates', 'Netherlands', 52.3676, 4.9041, 'A treaty ends the Nine Years\' War between Louis XIV and a European coalition, and he returns most of his conquests.', 'The treaty ends the Nine Years\' War between France and a coalition of opponents.'),
(126, 'Acts of Union create Great Britain', 1707, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'Parliaments pass acts merging two kingdoms that already shared a monarch, creating a new state and a new flag.', 'The English and Scottish parliaments unite the Kingdoms of England and Scotland.'),
(127, 'Russian Empire is proclaimed', 1721, 'country', 'Russia', 55.7558, 37.6173, 'After a long northern war, the Senate offers a tsar the title of Emperor and Father of the Fatherland.', 'Peter the Great declares Russia an empire after victory in the Great Northern War.'),
(128, 'Seven Years\' War begins in Europe', 1756, 'country', 'Germany', 52.52, 13.405, 'A king launches a pre-emptive invasion of a neighboring state, igniting a worldwide struggle between rival alliances.', 'A struggle involving major European powers expands into a global war.'),
(129, 'Battle of Plassey', 1757, 'coordinates', 'India', 28.6139, 77.209, 'A trading company\'s small army, helped by a traitorous commander, defeats a nawab and gains control of a rich province.', 'The East India Company defeats the Nawab of Bengal and allies, marking a turning point in British power in India.'),
(130, 'Treaty of Paris ends the Seven Years\' War', 1763, 'coordinates', 'France', 48.8566, 2.3522, 'A peace treaty ends a global war and transfers most of a rival\'s North American empire to Britain.', 'The settlement transfers major territories and strengthens Britain\'s position in North America.'),
(131, 'Watt\'s improved steam engine patent', 1769, 'coordinates', 'United Kingdom', 55.9533, -3.1883, 'A Scottish instrument maker patents a separate condenser, making the steam engine far more fuel-efficient.', 'James Watt patents an important improvement to the steam engine, helping accelerate industrialization.'),
(132, 'Boston Tea Party', 1773, 'coordinates', 'United States', 38.9072, -77.0369, 'Colonists disguised as Mohawks dump crates of taxed tea into a harbor to protest taxation without representation.', 'Colonists protest British taxation by destroying tea in Boston Harbor.'),
(133, 'American Revolutionary War begins', 1775, 'country', 'United States', 38.9072, -77.0369, 'Militiamen and redcoats exchange the shot heard round the world at a village green and a nearby bridge.', 'Fighting at Lexington and Concord marks the outbreak of the American Revolutionary War.'),
(134, 'United States Declaration of Independence', 1776, 'coordinates', 'United States', 38.9072, -77.0369, 'A congress adopts a document written mainly by a Virginian that declares thirteen colonies free from a crown.', 'The Continental Congress adopts a declaration asserting independence from Britain.'),
(135, 'Battle of Yorktown', 1781, 'coordinates', 'United States', 38.9072, -77.0369, 'A British general surrenders his army, trapped between a French fleet and allied land forces, ending major fighting.', 'American and French forces force the surrender of a major British army, effectively deciding the war.'),
(136, 'Treaty of Paris recognizes US independence', 1783, 'coordinates', 'France', 48.8566, 2.3522, 'Britain formally recognizes the independence of its former colonies and sets their western boundary at a great river.', 'Britain formally recognizes the independence of the United States.'),
(137, 'Declaration of the Rights of Man and of the Citizen', 1789, 'coordinates', 'France', 48.8566, 2.3522, 'A revolutionary assembly proclaims that men are born free and equal in rights.', 'The National Constituent Assembly adopts a landmark statement of rights and citizenship.'),
(138, 'Execution of Louis XVI', 1793, 'coordinates', 'France', 48.8566, 2.3522, 'A deposed king, tried for treason, is beheaded by the guillotine before a crowd in a great public square.', 'The former French monarch is executed during the revolution.'),
(139, 'Abolition of slavery in French colonies', 1794, 'coordinates', 'France', 48.8566, 2.3522, 'A revolutionary assembly declares slavery abolished in all overseas territories, a decision Napoleon later reverses.', 'The French National Convention abolishes slavery in French colonies, though later policy reverses this in some territories.'),
(140, 'Napoleon takes power in France', 1799, 'coordinates', 'France', 48.8566, 2.3522, 'A victorious general overthrows the government in the coup of 18 Brumaire and becomes First Consul.', 'Napoleon Bonaparte overthrows the Directory in the coup of 18 Brumaire.'),
(141, 'Napoleon is crowned emperor', 1804, 'coordinates', 'France', 48.8566, 2.3522, 'A general takes the crown from the pope\'s hands and places it on his own head in a grand cathedral.', 'Napoleon becomes Emperor of the French in a ceremony at Notre-Dame Cathedral.'),
(142, 'Battle of Trafalgar', 1805, 'coordinates', 'Spain', 40.4168, -3.7038, 'A British admiral dies victorious after his fleet shatters a combined enemy navy that was meant to cover an invasion of his homeland.', 'The British fleet defeats French and Spanish fleets, securing British naval dominance.'),
(143, 'Battle of Austerlitz', 1805, 'coordinates', 'Czechia', 50.0755, 14.4378, 'In the Battle of the Three Emperors, an emperor\'s army routs the Russian and Austrian monarchs on the anniversary of his coronation.', 'Napoleon defeats Russian and Austrian armies in a major engagement.'),
(144, 'Napoleon invades Russia', 1812, 'coordinates', 'Russia', 55.7558, 37.6173, 'A multinational army of about six hundred thousand crosses a river, only to be destroyed by distance, scorched earth and winter.', 'The French-led invasion ends in catastrophic retreat and weakens Napoleon\'s empire.'),
(145, 'Battle of Waterloo', 1815, 'coordinates', 'Belgium', 50.8503, 4.3517, 'A coalition led by Wellington and Blucher defeats an emperor who had escaped exile, ending his Hundred Days.', 'Coalition forces defeat Napoleon, ending his rule after the Hundred Days.'),
(146, 'Greek War of Independence begins', 1821, 'coordinates', 'Greece', 37.9838, 23.7275, 'A revolt against Ottoman rule begins on a southern peninsula, drawing foreign volunteers such as Lord Byron.', 'Greek rebels begin a struggle that eventually creates an independent state.'),
(147, 'Brazil declares independence', 1822, 'country', 'Brazil', -15.7939, -47.8828, 'A prince declares Independence or Death beside a stream, breaking with his father\'s European kingdom.', 'Pedro declares Brazil\'s independence from Portugal.'),
(148, 'First public railway using steam locomotives opens', 1825, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A locomotive pulls coal wagons and passengers on the first public line to use steam power.', 'The Stockton and Darlington Railway opens, demonstrating the potential of rail transport.'),
(149, 'July Revolution in France', 1830, 'coordinates', 'France', 48.8566, 2.3522, 'After three days of barricades in the capital, a king who tried to curb press freedom is replaced by his cousin, the Citizen King.', 'Three days of uprising lead to the overthrow of Charles X.'),
(150, 'Belgian Revolution', 1831, 'coordinates', 'Belgium', 50.8503, 4.3517, 'An opera performance sparks an uprising in which southern provinces break away from a Dutch-led kingdom.', 'Revolution leads to Belgium\'s independence from the United Kingdom of the Netherlands.'),
(151, 'Revolutions of 1848', 1848, 'coordinates', 'France', 48.8566, 2.3522, 'A Springtime of Peoples sees uprisings against monarchies in many cities across Europe within a few months.', 'A wave of uprisings challenges monarchies and political systems across Europe.'),
(152, 'Seneca Falls Convention', 1848, 'coordinates', 'United States', 38.9072, -77.0369, 'A convention in a small town issues a Declaration of Sentiments demanding votes and equal rights for women.', 'Activists gather in New York to advocate for women\'s social, civil and religious rights.'),
(153, 'Commodore Perry arrives in Japan', 1853, 'coordinates', 'Japan', 35.6762, 139.65, 'Black-hulled steamships under an American commodore anchor in a bay and demand that an isolated nation open its ports.', 'A US naval expedition pressures Japan to open relations with Western powers.'),
(154, 'Indian Rebellion begins', 1857, 'coordinates', 'India', 28.6139, 77.209, 'Sepoys revolt over rumored greased cartridges, and the uprising spreads through northern lands controlled by a trading company.', 'A major uprising challenges East India Company authority across northern and central India.'),
(155, 'Darwin publishes On the Origin of Species', 1859, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A naturalist publishes his theory of evolution by natural selection after twenty years of delay, based on his voyage on the Beagle.', 'Charles Darwin presents a theory of evolution by natural selection.'),
(156, 'Emancipation Proclamation takes effect', 1863, 'coordinates', 'United States', 38.9072, -77.0369, 'A president\'s wartime order declares enslaved people in the rebelling states to be free.', 'Abraham Lincoln\'s proclamation changes the Union war aims and the legal status of enslaved people in areas in rebellion.'),
(157, 'American Civil War ends', 1865, 'country', 'United States', 38.9072, -77.0369, 'A Confederate general surrenders his army to his Union counterpart in a village courthouse.', 'Robert E. Lee surrenders at Appomattox Court House, a key step in ending the war.'),
(158, 'Abolition of slavery in the United States', 1865, 'coordinates', 'United States', 38.9072, -77.0369, 'The Thirteenth Amendment is ratified, making slavery illegal throughout the nation.', 'The Thirteenth Amendment abolishes slavery, except as punishment for crime, across the United States.'),
(159, 'Meiji Restoration', 1868, 'coordinates', 'Japan', 35.6762, 139.65, 'A teenage emperor is restored to real power after centuries of shogun rule, beginning rapid modernization.', 'Political power shifts from the Tokugawa shogunate to the emperor, launching rapid reforms.'),
(160, 'Suez Canal opens', 1869, 'coordinates', 'Egypt', 30.0444, 31.2357, 'A French-built waterway opens, letting ships sail between the Mediterranean and the Red Sea without rounding Africa.', 'The waterway connecting the Mediterranean and Red Sea opens to international shipping.'),
(161, 'German Empire is proclaimed', 1871, 'country', 'France', 48.8566, 2.3522, 'A Prussian king is proclaimed Kaiser in a hall of mirrors in the palace of a defeated enemy.', 'German states unite under Prussian leadership in the Hall of Mirrors at Versailles.'),
(162, 'First telephone patent is granted', 1876, 'coordinates', 'United States', 38.9072, -77.0369, 'Alexander Graham Bell wins a patent for a device that transmits speech over wires.', 'Alexander Graham Bell receives a patent for a telephone design.'),
(163, 'Berlin Conference begins', 1884, 'coordinates', 'Germany', 52.52, 13.405, 'Bismarck hosts a meeting of powers to set rules for claiming land overseas, with no African representative present.', 'The conference sets rules for European claims in Africa and accelerates colonial partition.'),
(164, 'Scramble for Africa intensifies', 1885, 'country', 'Africa', 0, 20, 'Rival powers race to plant flags and sign treaties with local chiefs until nearly an entire continent is partitioned into colonies.', 'European states expand territorial control across Africa in the late nineteenth century.'),
(165, 'Eiffel Tower opens', 1889, 'coordinates', 'France', 48.8566, 2.3522, 'An iron lattice tower, the tallest structure in the world at the time, is unveiled as the entrance to a world\'s fair.', 'The tower is completed for the Exposition Universelle in Paris.');
INSERT INTO `events` (`id`, `name`, `year`, `location_type`, `country`, `coordinate_lat`, `coordinate_lng`, `alternative_name`, `description`) VALUES
(166, 'First modern Olympic Games', 1896, 'coordinates', 'Greece', 37.9838, 23.7275, 'A French baron\'s revival of an ancient athletic festival gathers athletes from fourteen nations, with a marathon as its highlight.', 'Athletes gather in Athens for the first modern Olympic Games.'),
(167, 'Spanish-American War', 1898, 'coordinates', 'Cuba', 23.1136, -82.3666, 'The sinking of a battleship in a harbor leads to a short war in which the US takes over Spain\'s remaining colonies.', 'The United States defeats Spain, contributing to the end of Spain\'s major colonial empire.'),
(168, 'Federation of Australia', 1901, 'country', 'Australia', -35.2809, 149.13, 'Six self-governing colonies join to form a single commonwealth within the British Empire.', 'Six British colonies unite to create the Commonwealth of Australia.'),
(169, 'First powered airplane flight', 1903, 'coordinates', 'United States', 38.9072, -77.0369, 'Two bicycle makers keep a powered, heavier-than-air machine aloft for twelve seconds above a windswept beach.', 'The Wright brothers achieve a controlled powered flight at Kitty Hawk, North Carolina.'),
(170, 'Russian Revolution of 1905', 1905, 'coordinates', 'Russia', 55.7558, 37.6173, 'After soldiers fire on peaceful petitioners on Bloody Sunday, strikes and mutinies force the tsar to promise a parliament.', 'Strikes, demonstrations and unrest force limited reforms in the Russian Empire.'),
(171, 'Xinhai Revolution begins', 1911, 'country', 'China', 39.9042, 116.407, 'An uprising among soldiers in a Yangtze River city triggers the collapse of the last imperial dynasty.', 'The revolution leads to the abdication of the Qing emperor and the establishment of a republic.'),
(172, 'Titanic sinks', 1912, 'country', 'International waters', 45, -45, 'The supposedly unsinkable liner strikes an iceberg on her maiden voyage with too few lifeboats.', 'The RMS Titanic sinks on its maiden voyage after striking an iceberg.'),
(173, 'World War I begins', 1914, 'coordinates', 'Bosnia and Herzegovina', 43.8563, 18.4131, 'The assassination of an archduke and his wife in an open car sets off a chain of alliances and declarations of war.', 'The killing of Archduke Franz Ferdinand in Sarajevo helps trigger a chain of declarations of war.'),
(174, 'Armenian deportations and mass killings', 1915, 'country', 'Turkey', 39.9334, 32.8597, 'An empire\'s government orders a population marched into the desert, killing hundreds of thousands in what is widely called a genocide.', 'Ottoman authorities deport Armenians and mass atrocities occur during World War I.'),
(175, 'Battle of the Somme', 1916, 'coordinates', 'France', 48.8566, 2.3522, 'On its first day, a huge British offensive suffers about fifty-seven thousand casualties, the worst in the army\'s history.', 'British and French forces launch a major offensive on the Western Front during World War I.'),
(176, 'World War I armistice', 1918, 'coordinates', 'France', 48.8566, 2.3522, 'A ceasefire signed in a railway carriage ends the fighting of the Great War.', 'An armistice takes effect on 11 November, ending fighting between the Allies and Germany.'),
(177, 'Treaty of Versailles signed', 1919, 'coordinates', 'France', 48.8566, 2.3522, 'A treaty signed in a hall of mirrors blames Germany for the Great War and imposes reparations.', 'The treaty sets terms for peace with Germany after World War I.'),
(178, 'League of Nations begins work', 1920, 'coordinates', 'Switzerland', 46.948, 7.4474, 'The first worldwide organization for keeping peace holds its first meeting, though the US never joins.', 'The League of Nations holds its first council meeting as part of efforts to prevent future wars.'),
(179, 'Soviet Union is established', 1922, 'country', 'Russia', 55.7558, 37.6173, 'Several Soviet republics sign a treaty merging into a single communist federal state.', 'The Union of Soviet Socialist Republics is formally created.'),
(180, 'Republic of Turkey is proclaimed', 1923, 'country', 'Turkey', 39.9334, 32.8597, 'A war hero declares a secular republic and becomes its first president after the sultanate has been abolished.', 'Mustafa Kemal Atatürk and colleagues establish the Republic of Turkey after the Ottoman Empire\'s collapse.'),
(181, 'Wall Street Crash', 1929, 'coordinates', 'United States', 38.9072, -77.0369, 'On Black Tuesday, stock prices collapse in a panic, and a global depression follows.', 'A dramatic stock-market collapse helps usher in the Great Depression.'),
(182, 'Salt March', 1930, 'coordinates', 'India', 28.6139, 77.209, 'A lawyer in a simple loincloth leads thousands on a long walk to the sea to make salt in defiance of a colonial tax.', 'Mahatma Gandhi leads a protest against the British salt monopoly.'),
(183, 'Mukden Incident', 1931, 'coordinates', 'China', 39.9042, 116.407, 'A small railway explosion, staged by the army, serves as a pretext to occupy a northeastern region of a neighboring country.', 'Japanese forces use an incident in Manchuria to expand military occupation.'),
(184, 'Hitler becomes German chancellor', 1933, 'coordinates', 'Germany', 52.52, 13.405, 'A president appoints the leader of the largest party as head of government, opening the way to a dictatorship.', 'Adolf Hitler is appointed chancellor, enabling the Nazi dictatorship to consolidate power.'),
(185, 'Spanish Civil War begins', 1936, 'country', 'Spain', 40.4168, -3.7038, 'A coup by generals against an elected Popular Front government splinters a country into a bitter civil war.', 'A coup attempt leads to a civil war between Republican and Nationalist forces.'),
(186, 'World War II begins in Europe', 1939, 'coordinates', 'Poland', 52.2297, 21.0122, 'A surprise invasion by tanks and aircraft prompts Britain and France to declare war on the aggressor.', 'Germany invades Poland on 1 September, prompting Britain and France to declare war.'),
(187, 'Battle of Britain', 1940, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'Fighter pilots, aided by radar, defeat a bid to win control of the skies before a planned invasion.', 'The Royal Air Force resists the German air campaign against Britain.'),
(188, 'Attack on Pearl Harbor', 1941, 'coordinates', 'United States', 38.9072, -77.0369, 'A carrier-based surprise attack on a Sunday morning destroys battleships and brings a neutral power into the war.', 'Japanese forces attack the US Pacific Fleet at Pearl Harbor, bringing the United States into World War II.'),
(189, 'Battle of Midway', 1942, 'coordinates', 'United States', 38.9072, -77.0369, 'Four enemy aircraft carriers are sunk in a single day after their codes had been broken.', 'US forces defeat a Japanese fleet near Midway Atoll, shifting momentum in the Pacific War.'),
(190, 'D-Day landings', 1944, 'coordinates', 'France', 48.8566, 2.3522, 'The largest amphibious invasion in history lands troops on five beaches code-named Utah, Omaha, Gold, Juno and Sword.', 'Allied forces land in Normandy, opening a major western front against Nazi Germany.'),
(191, 'Atomic bombing of Nagasaki', 1945, 'coordinates', 'Japan', 35.6762, 139.65, 'A second atomic bomb, nicknamed Fat Man, is dropped three days after the first.', 'The United States drops an atomic bomb on Nagasaki on 9 August.'),
(192, 'World War II ends', 1945, 'coordinates', 'Japan', 35.6762, 139.65, 'An emperor\'s first-ever radio address to his people announces capitulation, bringing the Second World War to its end.', 'Japan accepts Allied surrender terms, ending World War II after formal signing in September.'),
(193, 'United Nations is founded', 1945, 'country', 'United States', 38.9072, -77.0369, 'Fifty delegations sign a charter creating a world body to prevent another global war.', 'The UN Charter enters into force, creating an international organization for peace and cooperation.'),
(194, 'Partition of British India', 1947, 'country', 'India', 28.6139, 77.209, 'A hurriedly drawn border splits a subcontinent into two new countries, setting off mass migration and violence.', 'British India is partitioned into India and Pakistan, accompanied by mass migration and communal violence.'),
(195, 'State of Israel is declared', 1948, 'country', 'Israel', 31.7683, 35.2137, 'A leader reads a declaration of independence for a Jewish homeland as a colonial mandate expires.', 'Israel declares independence, followed by war with neighboring Arab states and displacement of Palestinians.'),
(196, 'People\'s Republic of China is proclaimed', 1949, 'country', 'China', 39.9042, 116.407, 'Atop a gate tower, a revolutionary leader announces that his people have stood up as the Nationalists flee to an island.', 'Mao Zedong proclaims the People\'s Republic after the Communist victory in the Chinese Civil War.'),
(197, 'Korean War begins', 1950, 'country', 'South Korea', 37.5665, 126.978, 'Troops pour across the 38th parallel, starting a war that draws in the US, UN forces and a communist giant.', 'North Korean forces cross the 38th parallel, beginning a war involving UN and Chinese forces.'),
(198, 'DNA double-helix structure is announced', 1953, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'Two researchers announce a twisted-ladder model of the molecule of heredity, aided by X-ray images from Rosalind Franklin.', 'Researchers publish a model of DNA\'s double-helix structure, a landmark in molecular biology.'),
(199, 'Bandung Conference', 1955, 'coordinates', 'Indonesia', -6.2088, 106.846, 'Leaders from twenty-nine newly independent nations meet to oppose colonialism and avoid being drawn into the Cold War blocs.', 'Delegates from Asian and African countries gather to discuss cooperation, colonialism and global politics.'),
(200, 'Sputnik 1 launches', 1957, 'coordinates', 'Kazakhstan', 51.1694, 71.4491, 'A beeping metal sphere becomes the first artificial satellite and shocks a rival superpower.', 'The Soviet Union launches the first artificial satellite, beginning the space age.'),
(201, 'Year of Africa independence wave', 1960, 'country', 'Africa', 0, 20, 'Seventeen countries on one continent, mostly former French colonies, win independence within a single year.', 'A large number of African countries gain independence during a pivotal year of decolonization.'),
(202, 'Berlin Wall construction begins', 1961, 'coordinates', 'Germany', 52.52, 13.405, 'Overnight, barbed wire and later concrete split a city in two to stop citizens from fleeing to the West.', 'East German authorities begin building a barrier separating East and West Berlin.'),
(203, 'Cuban Missile Crisis', 1962, 'coordinates', 'Cuba', 23.1136, -82.3666, 'Spy-plane photos of missile sites ninety miles from a superpower\'s coast bring thirteen tense days of nuclear brinkmanship.', 'The Soviet deployment of missiles in Cuba triggers a dangerous confrontation with the United States.'),
(204, 'March on Washington', 1963, 'coordinates', 'United States', 38.9072, -77.0369, 'A quarter of a million people gather before a memorial where Martin Luther King delivers his I Have a Dream speech.', 'Demonstrators assemble in Washington, D.C., where Martin Luther King Jr. delivers his famous speech.'),
(205, 'Civil Rights Act signed', 1964, 'coordinates', 'United States', 38.9072, -77.0369, 'A president signs a law outlawing segregation in public places and discrimination in employment.', 'The US law prohibits discrimination based on race, color, religion, sex or national origin in several domains.'),
(206, 'Cultural Revolution begins', 1966, 'country', 'China', 39.9042, 116.407, 'A chairman unleashes students as Red Guards to purge supposed enemies and old customs.', 'Mao launches a mass campaign that causes widespread persecution and disruption in China.'),
(207, 'Six-Day War', 1967, 'coordinates', 'Israel', 31.7683, 35.2137, 'A lightning pre-emptive strike destroys neighboring air forces on the ground and triples a country\'s territory in under a week.', 'Israel fights Egypt, Jordan and Syria and occupies several territories.'),
(208, 'Prague Spring is suppressed', 1968, 'coordinates', 'Czechia', 50.0755, 14.4378, 'Warsaw Pact tanks roll in to end a communist leader\'s attempt at socialism with a human face.', 'Warsaw Pact forces invade Czechoslovakia to end a reform movement.'),
(209, 'Apollo 11 Moon landing', 1969, 'coordinates', 'United States', 38.9072, -77.0369, 'One small step for man are the first words spoken by a human on another world.', 'Neil Armstrong and Buzz Aldrin walk on the Moon during NASA\'s Apollo 11 mission.'),
(210, 'Bangladesh Liberation War ends', 1971, 'country', 'Bangladesh', 23.8103, 90.4125, 'After a nine-month war and a large army\'s surrender, the eastern wing of a divided country becomes a new nation.', 'Bangladesh becomes independent after conflict between Pakistani forces and Bengali nationalists, with Indian intervention.'),
(211, 'Military coup in Chile', 1973, 'coordinates', 'Chile', -33.4489, -70.6693, 'Fighter jets bomb a presidential palace as generals overthrow a democratically elected socialist president, who dies inside.', 'The coup removes President Salvador Allende and begins Augusto Pinochet\'s dictatorship.'),
(212, 'Fall of Saigon', 1975, 'coordinates', 'Vietnam', 21.0285, 105.854, 'Helicopters evacuate the last Americans from a rooftop as tanks crash through the gates of the presidential palace.', 'North Vietnamese forces take Saigon, ending the Vietnam War and reunifying Vietnam under communist rule.'),
(213, 'Camp David Accords', 1978, 'coordinates', 'United States', 38.9072, -77.0369, 'Two leaders and a US president reach a framework agreement after thirteen days of secluded talks at a presidential retreat.', 'Egyptian and Israeli leaders reach agreements that lead to a peace treaty.'),
(214, 'Iranian Revolution', 1979, 'coordinates', 'Iran', 35.6892, 51.389, 'An exiled ayatollah returns to jubilant crowds as the shah flees and a monarchy gives way to an Islamic republic.', 'Mass protests and political upheaval lead to the establishment of the Islamic Republic.'),
(215, 'Soviet invasion of Afghanistan', 1979, 'coordinates', 'Afghanistan', 34.5553, 69.2075, 'Airborne troops and tanks enter a rugged Asian country to prop up a communist government, starting a decade-long war.', 'Soviet forces intervene militarily, beginning a long and destructive war.'),
(216, 'Bhopal gas disaster', 1984, 'coordinates', 'India', 28.6139, 77.209, 'A pesticide plant leaks poisonous gas at night, killing thousands in one of the worst industrial accidents ever.', 'A chemical leak at a pesticide plant causes thousands of deaths and long-term health effects.'),
(217, 'Chernobyl nuclear disaster', 1986, 'coordinates', 'Ukraine', 50.4501, 30.5234, 'During a safety test, a reactor explodes, spreading radioactive fallout across Europe and forcing the evacuation of a nearby town.', 'An explosion and fire at the Chernobyl nuclear power plant contaminate large areas.'),
(218, 'Fall of the Berlin Wall', 1989, 'coordinates', 'Germany', 52.52, 13.405, 'After a confused press conference announcement, crowds pour through checkpoints and begin chipping at a concrete barrier.', 'East German authorities open border crossings, becoming a symbol of the end of Cold War division in Europe.'),
(219, 'Tiananmen Square protests and crackdown', 1989, 'coordinates', 'China', 39.9042, 116.407, 'Soldiers and tanks clear a huge public square of pro-democracy demonstrators, while a lone man stands before a column of tanks.', 'Protests in Beijing are ended by a military crackdown; casualty estimates remain contested.'),
(220, 'Nelson Mandela is released from prison', 1990, 'coordinates', 'South Africa', -25.7479, 28.2293, 'After twenty-seven years behind bars, a prisoner walks hand in hand with his wife out of a gate to cheering crowds.', 'Mandela\'s release becomes a key turning point in negotiations to end apartheid.'),
(221, 'Maastricht Treaty signed', 1992, 'coordinates', 'Netherlands', 52.3676, 4.9041, 'A treaty lays out the roadmap to a single currency and renames a European community the European Union.', 'European leaders sign the treaty that establishes the European Union framework.'),
(222, 'Rwandan genocide', 1994, 'country', 'Rwanda', -1.9441, 30.0619, 'In about a hundred days, extremist militias slaughter roughly eight hundred thousand members of a minority and moderates.', 'Extremist forces and others kill large numbers of Tutsi and moderate Hutu in a genocide.'),
(223, 'End of apartheid and first multiracial election', 1994, 'coordinates', 'South Africa', -25.7479, 28.2293, 'Long lines of voters of every race queue for the first time to choose a government, electing a former prisoner as president.', 'South Africans elect Nelson Mandela president in the first national election open to all races.'),
(224, 'Hong Kong handover', 1997, 'coordinates', 'China', 22.3193, 114.169, 'A British colony\'s flag is lowered at midnight as a harbor city returns to its original sovereign under a one country, two systems model.', 'The United Kingdom transfers sovereignty over Hong Kong to China.'),
(225, 'Good Friday Agreement', 1998, 'coordinates', 'United Kingdom', 54.5973, -5.9301, 'A peace deal brokered by an American senator ends decades of sectarian violence known as the Troubles.', 'The agreement establishes power-sharing arrangements and a framework for peace in Northern Ireland.'),
(226, 'September 11 attacks', 2001, 'coordinates', 'United States', 38.9072, -77.0369, 'Four hijacked airliners are turned into weapons, destroying two towers and damaging a military headquarters.', 'Al-Qaeda attacks New York and Washington, D.C., killing thousands and reshaping global security policy.'),
(227, 'Human Genome Project is completed', 2003, 'country', 'United States', 38.9072, -77.0369, 'Scientists announce they have sequenced essentially all of the roughly three billion letters of human DNA.', 'Researchers announce completion of the international effort to sequence the human genome.'),
(228, 'Indian Ocean earthquake and tsunami', 2004, 'coordinates', 'Indonesia', -6.2088, 106.846, 'A massive undersea earthquake sends waves across an ocean, killing over two hundred thousand people in many countries.', 'A powerful undersea earthquake triggers a tsunami that kills people across countries bordering the Indian Ocean.'),
(229, 'Global financial crisis intensifies', 2008, 'coordinates', 'United States', 38.9072, -77.0369, 'The collapse of an investment bank and a wave of bailouts follow the bursting of a housing bubble built on subprime loans.', 'The crisis accelerates after major financial institutions fail or require rescue, causing a global recession.'),
(230, 'Fukushima nuclear disaster', 2011, 'coordinates', 'Japan', 35.6762, 139.65, 'A giant wave overwhelms backup generators at a coastal power plant, causing three reactor meltdowns.', 'An earthquake and tsunami cause a severe nuclear accident at Fukushima Daiichi.'),
(231, 'South Sudan becomes independent', 2011, 'country', 'South Sudan', 4.8594, 31.5713, 'After a referendum with overwhelming support, the world\'s newest country raises its flag in a landlocked capital.', 'South Sudan becomes independent after a referendum following decades of conflict.'),
(232, 'Annexation of Crimea by Russia', 2014, 'coordinates', 'Ukraine', 50.4501, 30.5234, 'Troops without insignia, nicknamed little green men, seize a peninsula, and a disputed vote leads to its absorption by a larger neighbor.', 'Russia takes control of Crimea following military intervention and a disputed referendum, widely rejected internationally.'),
(233, 'Paris climate agreement adopted', 2015, 'coordinates', 'France', 48.8566, 2.3522, 'Nearly two hundred countries pledge to keep global warming well below two degrees Celsius.', 'Nearly all countries adopt a global agreement to limit warming and strengthen climate action.'),
(234, 'United Kingdom votes for Brexit', 2016, 'coordinates', 'United Kingdom', 51.5072, -0.1276, 'A narrow majority votes to leave a union of European states, prompting the prime minister to resign.', 'A majority of voters choose to leave the European Union in a national referendum.'),
(235, 'First COVID-19 cases recognized', 2019, 'coordinates', 'China', 39.9042, 116.407, 'Doctors in a large inland city notice a cluster of unusual pneumonia cases linked to a seafood market.', 'Cases of a novel coronavirus are identified in Wuhan in late 2019.'),
(236, 'Taliban returns to power in Afghanistan', 2021, 'coordinates', 'Afghanistan', 34.5553, 69.2075, 'As foreign troops complete their withdrawal, a government collapses and fighters enter the capital with little resistance.', 'The Taliban takes Kabul as the Afghan government collapses during the withdrawal of foreign forces.'),
(237, 'Russia launches full-scale invasion of Ukraine', 2022, 'coordinates', 'Ukraine', 50.4501, 30.5234, 'A neighbor launches a full-scale assault from several directions, turning an eight-year-old conflict into Europe\'s largest war in decades.', 'Russian forces begin a full-scale invasion of Ukraine on 24 February, escalating a conflict that began in 2014.'),
(238, 'Türkiye–Syria earthquakes', 2023, 'coordinates', 'Turkey', 39.9334, 32.8597, 'Two powerful quakes strike within hours along a border region, killing more than fifty thousand people.', 'Major earthquakes strike southern Türkiye and northern Syria, causing widespread destruction and loss of life.'),
(239, 'Paris Summer Olympics', 2024, 'coordinates', 'France', 48.8566, 2.3522, 'The opening ceremony is held on a river rather than in a stadium, with boats carrying athletes past famous landmarks.', 'Paris hosts the Summer Olympic Games, with events staged across the city and nearby venues.'),
(240, 'Total solar eclipse crosses North America', 2024, 'coordinates', 'Mexico', 19.4326, -99.1332, 'The Moon fully blocks the Sun along a path crossing three countries of one continent, with millions wearing special glasses.', 'A total solar eclipse passes across parts of Mexico, the United States and Canada.'),
(241, 'Expo 2025 opens in Osaka', 2025, 'coordinates', 'Japan', 35.6762, 139.65, 'A world\'s fair opens with a giant circular wooden walkway called the Grand Ring on a man-made island.', 'Osaka hosts a world exposition focused on future society, technology and international exchange.');

-- --------------------------------------------------------

--
-- Structure de la table `game_completions`
--

CREATE TABLE `game_completions` (
  `user_id` int(11) NOT NULL,
  `game_date` date NOT NULL,
  `points_round1` int(11) NOT NULL DEFAULT 0,
  `points_round2` int(11) NOT NULL DEFAULT 0,
  `points_round3` int(11) NOT NULL DEFAULT 0,
  `guess_year` int(11) NOT NULL DEFAULT 0,
  `guess_coord_lat` float NOT NULL DEFAULT 0,
  `guess_coord_lng` float NOT NULL DEFAULT 0,
  `guess_order_1` int(11) NOT NULL DEFAULT 1,
  `guess_order_2` int(11) NOT NULL DEFAULT 2,
  `guess_order_3` int(11) NOT NULL DEFAULT 3,
  `guess_order_4` int(11) NOT NULL DEFAULT 4,
  `current_round` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(1, 'admin', 'admin@eventle.com', '$2b$10$2jgsix9ngcM9Y7PmMfc3Jup4.VguAOuVGnlJtzjxtA6NGhRoqwPV6', 1),
(3, 'b', 'b@eventle.com', '$2b$10$8iDpavsmfg23HQ0l/yr54ekr4OeQrorbTsYfJVKTLmYSNsrVay8PW', 0),
(4, 'mathieu', 'mathieu@gmail.com', '$2b$10$T8hVcivgvt80Ig1HszxNnOFSraxsFqNZzffme2yLdPVBX1Tms9lNG', 0),
(5, 'mathieu1', 'mathieu1@gmail.com', '$2b$10$vYm9MlLnKqPMB9qsqFUUNOP6qg8GwWgMylTjO9tzuvxNV.JXn.juy', 0),
(6, 'c', 'c@c', '$2b$10$oaDlan1AgGnCwmGETgtIHubBkZrSahMllXaWk8JYjHH5zI0Wm8MuW', 0),
(7, 'clem', 'clem@gmail.com', '$2b$10$nK5y4DSmCtp8fkVAGsHjtO4XjAO.o9NfT4FPk23wkHawr2k7faAGi', 0),
(8, 'WarP', 'raph@raph.raph', '$2b$10$1t2KVtyCnDvxcX2sWi2fzOkMPqo5tV72zcmFZ/Jr9yRIxjAi5bVPe', 0),
(9, 'datruc', 'tp193449@mail.apu.edu.my', '$2b$10$7pfPHYBT4IMb/1CxTpPkWeK2A238.xsbbvYKr8zV8m5i0gtcpl0Mi', 0),
(10, 'd', 'd@d', '$2b$10$iDtWW9Mqzh3N9zxEz6L50ePsvJ/kTHyTjxRT4HRoeiXD9oXA.4Wwq', 0);

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
-- Index pour la table `game_completions`
--
ALTER TABLE `game_completions`
  ADD PRIMARY KEY (`user_id`,`game_date`),
  ADD KEY `game_date` (`game_date`),
  ADD KEY `guess_order_1` (`guess_order_1`),
  ADD KEY `guess_order_2` (`guess_order_2`),
  ADD KEY `guess_order_3` (`guess_order_3`),
  ADD KEY `guess_order_4` (`guess_order_4`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `archive`
--
ALTER TABLE `archive`
  ADD CONSTRAINT `fk_archive_comparison1` FOREIGN KEY (`comparison1`) REFERENCES `events` (`id`) ,
  ADD CONSTRAINT `fk_archive_comparison2` FOREIGN KEY (`comparison2`) REFERENCES `events` (`id`) ,
  ADD CONSTRAINT `fk_archive_comparison3` FOREIGN KEY (`comparison3`) REFERENCES `events` (`id`) ,
  ADD CONSTRAINT `fk_archive_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ;

--
-- Contraintes pour la table `game_completions`
--
ALTER TABLE `game_completions`
  ADD CONSTRAINT `fk_game_completions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_completions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ,
  ADD CONSTRAINT `game_completions_ibfk_2` FOREIGN KEY (`game_date`) REFERENCES `archive` (`game_date`) ,
  ADD CONSTRAINT `game_completions_ibfk_3` FOREIGN KEY (`guess_order_1`) REFERENCES `events` (`id`) ,
  ADD CONSTRAINT `game_completions_ibfk_4` FOREIGN KEY (`guess_order_2`) REFERENCES `events` (`id`) ,
  ADD CONSTRAINT `game_completions_ibfk_5` FOREIGN KEY (`guess_order_3`) REFERENCES `events` (`id`) ,
  ADD CONSTRAINT `game_completions_ibfk_6` FOREIGN KEY (`guess_order_4`) REFERENCES `events` (`id`) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
