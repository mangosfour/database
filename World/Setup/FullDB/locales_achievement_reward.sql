-- MySQL dump 10.13  Distrib 5.5.37, for Win32 (x86)
--
-- Host: localhost    Database: mangos3
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@SESSION.TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `locales_achievement_reward`
--

DROP TABLE IF EXISTS `locales_achievement_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) NOT NULL DEFAULT '2',
  `subject_loc1` varchar(100) NOT NULL DEFAULT '',
  `subject_loc2` varchar(100) NOT NULL DEFAULT '',
  `subject_loc3` varchar(100) NOT NULL DEFAULT '',
  `subject_loc4` varchar(100) NOT NULL DEFAULT '',
  `subject_loc5` varchar(100) NOT NULL DEFAULT '',
  `subject_loc6` varchar(100) NOT NULL DEFAULT '',
  `subject_loc7` varchar(100) NOT NULL DEFAULT '',
  `subject_loc8` varchar(100) NOT NULL DEFAULT '',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  PRIMARY KEY (`entry`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales_achievement_reward`
--

LOCK TABLES `locales_achievement_reward` WRITE;
/*!40000 ALTER TABLE `locales_achievement_reward` DISABLE KEYS */;
INSERT INTO `locales_achievement_reward` (`entry`, `gender`, `subject_loc1`, `subject_loc2`, `subject_loc3`, `subject_loc4`, `subject_loc5`, `subject_loc6`, `subject_loc7`, `subject_loc8`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`) VALUES (45,2,'','','','','','','','Исследователь - твое второе имя!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вот это да!$b$bА я то думал, что уже все обошел в этой обледеневшей дыре! Но старому-то дворфу вроде меня сразу видно, у кого глаза горят от жажды приключений!$b$bНоси эту накидку с гордостью. Пусть твои друзья знают, кто всегда сможет повести их за собой!$b$bНе сворачивай с выбранного пути!$b$b-Бранн Бронзобород'),
(614,2,'','','','','','','','За Альянс!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Война бушует повсюду в наших землях. Только самые храбрые герои смеют бросить вызов Орде на границе, где это представляет большую угрозу. Вы в числе таких же героев.$b$bСтолкновения с лидерами Орды, позволят нам нанести завершающий удар. Орда склонится перед мощью Альянса.$b$bВаши успехи будут вознаграждены. Держитесь гордо!$b$b--Ваш Король'),
(619,2,'','','','','','','','За Орду!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Во время большой суматохи истинные герои поднимаются из нищеты. Вы - единственный великий герой.$b$bВойна надвигается на нас. Ваши усилия будут продолжением нашего дела в Азероте. Ваши великие подвиги будут вознаграждены. Возьмите этот приз Оргриммара и поезжайте праздновать.$b$bЗа Орду!$b$bВождь Тралл'),
(1021,2,'','','','','','','','Такими достижениями можно гордиться!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Твоя коллекция гербовых накидок не может не вызывать восхищение! Думаю, ты не откажешься добавить к ней еще одну. Не хочу, чтобы она просто собирала пыль у меня в шкафу.'),
(1250,2,'','','','','','','','Новый дом для Вонючки',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Говорят, ты очень заботливо относишься к братьям нашим меньшим. Надеюсь, ты не откажешься приютить у себя моего Вонючку? Он отказывается играть со всеми, кроме тебя...$b$bПожалуйста, не забывай кормить его дважды в день. И еще... держи его подальше от черных котов.$b$bБреанни'),
(1681,2,'','','','','','','','Поздравления от Дарнасса',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ваши достижения были основательными и имеющие большие перспективы. Азерот, со всей недавней суматохой, извлекает большую пользу из тех, кто стремится избавить землю от зла.$b$bТолько те, кто не торопится узнать наши земли, понимают жертвы потерь и доблесть наших героев. Вы - один такой герой. Хотелось бы надеяться, вы отречетесь от рассказов о своих приключениях в течение многих последующих лет.$b$bОт имени Альянса, я благодарю вас, Хранитель мудрости.'),
(1682,2,'','','','','','','','Поздравления от Громового Утеса',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Новости о ваших достижениях быстро разносятся. Ветры суматохи воют в наших землях. Те, кто бросают вызов злу, являются нашей единственной надеждой.$b$bТолько те, кто прислушиваются к ветру, понимают долги, которые заплатили наши павшие герои, чтобы защитить наших людей. Может такой герой как вы проживет долгую жизнь, чтобы рассказать о своих приключениях. Только тогда мы будем помнить как мы должны быть благодарны вам.$b$bГлубоко признателен, Хранитель мудрости.$b$bЗа Орду!$b$b--Кэрн Кровавое Копыто'),
(2096,2,'','','','','','','','Властелин монет',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Поздравляю тебя с завершением коллекции даларанских монет! В награду за столь нелегкий труд прилагаю к этому письму только что выкованную титановую печать Даларана. Это особенная монета, которую мы рассылаем только самым успешным коллекционерам.$b$bНадеюсь, тебе понравится эта награда. Ты ее заслужил!$b$bС уважением,$b$bДжепетто Таратор'),
(2143,2,'','','','','','','','Во главе ковалерии',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Надо заметить, ты прекрасно обращаешься с животными. Благодаря тебе, наши дела пошли на лад.$b$bНадеюсь ты не откажешься присмотреть за этим драконом-альбиносом? У меня просто нет времени уделять ему достаточно внимания.$b$bС уважением,$bМей'),
(2136,2,'','','','','','','','Слава герою',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$gВоитель:Воительница;,$b$bСлухи о твоих великих деяниях в Нордсколе достигли и Храма Драконьего Покоя.$b$bПодобная смелость должна быть достойно вознаграждена. Прошу тебя, прими этот дар от лица Аспектов. Вместе мы избавим Азерот от сил зла - раз и навсегда.$b$bАлекстраза Хранительница Жизни'),
(876,2,'','','','','','','','Жестокость гладиатора',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я уже давно слежу за твоими успехами, малыш.$b$bТы отлично сражаешься на этой арене! Вот, возьми это и носи с гордостью.$bА теперь отправляйся обратно и покажи всем, чего ты стоишь!$b$bДядя Сэл.'),
(2957,2,'','','','','','','','Слава рейдеру Ульдуара',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$gДорогой:Дорогая; $N!$b$bНадеюсь у тебя все хорошо, и ты уже пришел:пришла в себя после наших приключений в Ульдуаре.$b$bМои друзья из поисковой команды наткнулись на полуживого детеныша дракона. Должно быть, он стал жертвой эксперимента железных дворфов.$b$bМы поставили его на ноги, и с тех пор он значительно подрос - можешь $gсам:сама; убедиться! Мы, к сожалению, умеем ездить верхом только на баранах и вьючных мулах, поэтому мы решили преподнести его тебе в подарок - в качестве знака благодарности за помощь.$b$bС уважением,$bБранн Бронзобород'),
(2958,2,'','','','','','','','Слава рейдеру Ульдуара (героич.)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$gДорогой:Дорогая; $N!$b$bНадеюсь у тебя все хорошо, и ты уже пришел:пришла в себя после наших приключений в Ульдуаре.$b$bМои друзья из поисковой команды наткнулись на полуживого детеныша дракона. Должно быть, он стал жертвой эксперимента железных дворфов.$b$bМы поставили его на ноги, и с тех пор он значительно подрос - можешь $gсам:сама; убедиться! Мы, к сожалению, умеем ездить верхом только на баранах и вьючных мулах, поэтому мы решили преподнести его тебе в подарок - в качестве знака благодарности за помощь.$b$bС уважением,$bБранн Бронзобород'),
(2144,2,'','','','','','','','И снова - время',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пение военных горнов часто заглушает голос совести: слишком легко многие обитатели Азерота забывают о величайших ценностях жизни.$b$bТы же, однако, являешься воплощением лучших качеств своей расы, ибо помнишь о том, ради чего мы сражаемся. Не забывай же и о наших победах, и пусть остальные восславят их вместе с тобой.$b$bАлекстраза Хранительница Жизни'),
(2145,2,'','','','','','','','И снова - время',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пение военных горнов часто заглушает голос совести: слишком легко многие обитатели Азерота забывают о величайших ценностях жизни.$b$bТы же, однако, являешься воплощением лучших качеств своей расы, ибо помнишь о том, ради чего мы сражаемся. Не забывай же и о наших победах, и пусть остальные восславят их вместе с тобой.$b$bАлекстраза Хранительница Жизни'),
(4602,2,'','','','','','','','Слава рейдеру Ледяной Короны',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$N!$b$bВлияние Короля-Лича ослабло, и многие могущественные существа освободились от его власти.$b$bПример тому - этот ледяной змей: освободившись от воли своего повелителя, она проявила собственный характер, если не сказать своенравность.$b$bОдин из моих солдат потерял руку во время ее поимки, но теперь змей относится к седокам снисходительно, если у них хватает умения и силы воли, чтобы ей управлять.$b$bПрошу, прими этого величественного зверя в дар от рыцарей Черного Клинка. Для меня было честью сражаться вместе с тобой в этой величайшей из битв.$b$bС уважением,$bДарион Могрейн.'),
(4603,2,'','','','','','','','Слава рейдеру Ледяной Короны (героич.)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$N!$b$bВлияние Короля-Лича ослабло, и многие могущественные существа освободились от его власти.$b$bПример тому - этот ледяной змей: освободившись от воли своего повелителя, она проявила собственный характер, если не сказать своенравность.$b$bОдин из моих солдат потерял руку во время ее поимки, но теперь змей относится к седокам снисходительно, если у них хватает умения и силы воли, чтобы ей управлять.$b$bПрошу, прими этого величественного зверя в дар от рыцарей Черного Клинка. Для меня было честью сражаться вместе с тобой в этой величайшей из битв.$b$bС уважением,$bДарион Могрейн.'),
(4478,2,'','','','','','','','Пугель',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Дорогой наш неутомимый игрок!$b$bМы склоняем головы перед твоим стойким желанием проходить подземелья в составе новых и даже совсем не знакомых групп. Мы готовы биться об заклад, что тебе уже приходилось открывать глаза новичкам и разъяснять, что почем в таких на первый взгляд пугающих проходах.$b$bКороче говоря, мы прослышали, что ты любитель этих самых \"пугов\" и сопутствующих им приключений. Так прими же от нас замечательного карликового пугеля, который поможет тебе быть начеку в любом рейде, даже в самом непредсказуемом и полном пугающих опасностей.$b$bВсех благ!$b$bРазработчики World of Warcraft'),
(1956,2,'','','','','','','','Высшее образование',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Поздравляю с окончанием изучения школ тайной магии! В благодарность за усердие прилагаю к этому письму завершающую книгу серии.$b$bНадеюсь, она покажется вам особенно увлекательной. Впрочем - один раз увидеть, чем сто раз услышать!$b$bС уважением.$b$bРонин.'),
(4079,2,'','','','','','','','Дань бессмертию',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$gДорогой:Дорогая; $N!$b$bЛегенды о твоем триумфальном выступлении на Испытании великого крестоносца будут жить в веках. Серебряный Авангард призвал под свои знамёна величайших чемпионов Азерота, дабы закалить их отвагу в горниле Колизея. Я живу надеждой, что адепты Света, подобные тебе и твоим союзникам, развеют мрак, сгустившийся над нами.$b$bНам нужна твоя помощь в грядущей битве против Короля-лича. Но пока этот день не настал, наслаждайся плодами своей победы. Я дарую тебе в знак признания твоих заслуг одного из наших лучших боевых скакунов. И когда Плеть узрит твой флаг, развевающийся на горизонте, они поймут, что конец близок.$b$bЗа честь и отвагу,$bТирион Фордринг'),
(4156,2,'','','','','','','','Дань бессмертию',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$gДорогой:Дорогая; $N!$b$bЛегенды о твоем триумфальном выступлении на Испытании великого крестоносца будут жить в веках. Серебряный Авангард призвал под свои знамёна величайших чемпионов Азерота, дабы закалить их отвагу в горниле Колизея. Я живу надеждой, что адепты Света, подобные тебе и твоим союзникам, развеют мрак, сгустившийся над нами.$b$bНам нужна твоя помощь в грядущей битве против Короля-лича. Но пока этот день не настал, наслаждайся плодами своей победы. Я дарую тебе в знак признания твоих заслуг одного из наших лучших боевых скакунов. И когда Плеть узрит твой флаг, развевающийся на горизонте, они поймут, что конец близок.$b$bЗа честь и отвагу,$bТирион Фордринг'),
(13,2,'','','','','','','','Мои поздравления!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мои поздравления с достижением 80-го уровня! Спасибо тебе за самоотверженную работу по очищению Азерота от захватившего нас зла.$b$bИ хотя твои приключения нельзя назвать легкой прогулкой, знай, что настоящие битвы все еще ждут тебя впереди.$b$bДержи меч на готове!$b$bРонин'),
(1793,2,'','','','','','','','Спасибо!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$gДорогой:Дорогая; $N!$b$bСпасибо за прекрасные каникулы! Сама леди Лиадрин приходила к попечительнице сирот и хотела забрать меня к себе, чтобы я могла учиться в Луносвете!$b$bСпасибо за то, что ты показал мне эти места – Трон Стихий, Темный портал и Пещеры времени – и позволил увидеть мою подругу Хч\'уу. А еще мне очень понравился игрушечный дракон!$b$bУверена, что ты хорошо заботишься о моем питомце! Передай ему, что я тоже по нему скучаю!$b$bС любовью,$bСаландрия.'),
(2516,2,'','','','','','','','Мой первый олененок',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Приветствую вас!$b$bКак я понимаю, в вашем доме нашлось место даже для вредины Вонюши... Надеюсь, ваш теплый кров примет еще одну сиротливую душу?$b$bЭтот олешек очень стеснителен, но вы без труда завоюете его сердце с помощью прилагаемого лакомства – его любимого солевого лизунца.$b$b-Бреанни'),
(5860,2,'','','','','','','','Пожалуйста... Просто возьмите его',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Этот малыш совсем отбился от рук с тех пор, как его разлучили с братом. Мы со стражниками изо всех сил пытались его удержать, но все бесполезно: он хочет только одного - снова увидеть своего кровника.$b$b$gЗнал:Знала бы ты, сколько усилий потребовалось на то, чтобы его упаковать! Забери его, ради всего святого. Возможно, за пределами пещеры он немного успокоится.$b$bФарден Когтекрыл'),
(5866,2,'','','','','','','','Дар верховного друида',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Никогда больше Хиджал не ощутит на себе бескрайнюю силу легионов огня. Никогда больше смертные расы не склонятся перед слугами Рагнароса.$b$bБлагодаря тебе они будут трепетать услышав НАШИ имена.$b$bТвоя отвага помогла нам низвергнуть Повелителя огня. Именно ты собрал армию могущественных союзников со всего Калимдора. ВЫ сразились со слугами Рагнароса и... победили. Прими нашу искреннюю благодарность.'),
(5449,2,'','','','','','','','Найденная вещь',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы нашли это посреди Круговерти Пустоты. Кажется, вещичка ваша.$b$bПрилагаем к письму посылку.'),
(5877,2,'','','','','','','','Продолжай в том же духе!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Привет!$b$bПохоже, тебе действительно нравится собирать этих маленьких, очаровательных существ!$b$bЯ подумала, что твои усилия стоит вознаградить. Вот, держи!$b$b-Бреанни'),
(5875,2,'','','','','','','','Продолжай в том же духе!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Привет!$b$bПохоже, тебе действительно нравится собирать этих маленьких, очаровательных существ!$b$bЯ подумала, что твои усилия стоит вознаградить. Вот, держи!$b$b-Бреанни'),
(6169,2,'','','','','','','','Слава рейдеру Души Дракона',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Герой,$b$bтвои поступки определили исход великой битвы со Смертокрылом. Без тебя мы бы не смогли победить! Ты сражался с армиями Разрушителя храбро и мужественно, несмотря ни на какие препятствия, возникавшие у тебя на пути.$b$bПобеды над Смертокрылом и Сумеречным Молотом открывают для нас новую эпоху. Будущее туманно, но можно точно сказать, что благодаря тебе оно будет лучше прошлого. Посылаю тебе скромный знак моей благодарности.$b$bТралл');
/*!40000 ALTER TABLE `locales_achievement_reward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-24 21:54:05
