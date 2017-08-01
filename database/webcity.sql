-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 24 2017 г., 01:16
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `webcity`
--
CREATE DATABASE IF NOT EXISTS `webcity` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `webcity`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL COMMENT 'category''s name',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'keeps parent''s category this subcategory'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_id`) VALUES
(1, 'Кино', 0),
(2, 'Концерты', 0),
(3, 'Скидки и рекламные акции', 0),
(4, 'Выставки', 0),
(5, 'Для детей', 0),
(6, 'Театр', 0),
(7, 'Спорт', 0),
(8, 'Семинары', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL COMMENT 'company''s name',
  `description` varchar(255) NOT NULL COMMENT 'short description',
  `place_id` int(10) UNSIGNED NOT NULL COMMENT 'place of head office',
  `email` varchar(255) DEFAULT NULL COMMENT '@',
  `www` varchar(255) DEFAULT NULL COMMENT 'company''s url',
  `picture_url` varchar(255) DEFAULT NULL COMMENT 'company''s picture'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for company';

--
-- Дамп данных таблицы `companies`
--

INSERT INTO `companies` (`id`, `fullname`, `description`, `place_id`, `email`, `www`, `picture_url`) VALUES
(1, 'GeekBunker', 'Гік бункер - освітній хаб, коворкинг та IT-школа у місті Краматорську.', 1, 'https://www.facebook.com/GeekBunkerUA/', '', 'img_id1.jpg'),
(2, '\"Родина\"', 'Kинотеатр \"Родина\".', 2, 'rodina_kino@mail.ru', 'http://rodina.mk/', 'img_id2.jpg'),
(3, 'ДК и Т НКМЗ', 'Городской Дворец Культуры и Техники НКМЗ.', 3, 'nspdkit@gmail.com', '', 'img_id3.jpg'),
(4, '\"Юбилейный\"', 'Парк \"Юбилейный\".', 4, '', '', 'img_id4.jpg'),
(5, 'Парк им. А.С.Пушкина ', 'Парк им. А.С.Пушкина.', 5, '', '', 'img_id5.jpg'),
(6, ' ДК \"Строитель\"', 'Городской дворец культуры «Строитель».', 6, '', '', 'img_id6.jpg'),
(7, '«Сад Бернацкого»', 'Парк «Сад Бернацкого».', 7, '', '', 'img_id7.jpg'),
(8, 'Краматорский художественный музей', 'Краматорский художественный музей.', 8, '', '', 'img_id8.jpg'),
(9, 'Музей', 'Музей истории города Краматорска.', 9, '', '', 'img_id9.jpg'),
(10, 'Центральная библиотека', 'Центральная городская публичная библиотека им. М. Горького.', 10, 'library@krm.net.ua', 'http://lib-krm.org/', 'img_id10.jpg'),
(11, 'Фиеста', 'Арт-кафе фиеста.', 11, 'fiestaclub@list.ru', '', 'img_id11.jpg'),
(12, 'Блюминг', 'Блюминг, стадион в Краматорске.', 12, '', '', 'img_id12.jpg'),
(13, 'Авангард', 'Авангард, стадион в Краматорске.', 13, '', '', 'img_id13.jpg');
-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL COMMENT 'event''s name',
  `description` varchar(255) NOT NULL COMMENT 'event''s description',
  `category_id` tinyint(3) UNSIGNED NOT NULL COMMENT 'category',
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'start of event',
  `date_end` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'end of event',
  `place_id` int(10) UNSIGNED NOT NULL COMMENT 'venue',
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'organizer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `category_id`, `date_start`, `date_end`, `place_id`, `company_id`) VALUES
(1, 'Бигфут Младший (3D)', '
Приглашаем Вас на мультфильм в кинотеатр Родина.
Сеансы:
16:30.
Режиссер:
Джереми Дегрусон, Бен Стассен.
Язык показа:
украинский.
Описание:
Обычный подросток по имени Адам отправляется на поиски своего давно пропавшего отца и попадает в приключение мифических масштабов.
 Его мир переворачивается вверх дном, когда оказывается, что в нем течет кровь последних легендарных хранителей леса — бигфутов.
 Теперь ему открыты такие способности как суперскорость, живительное прикосновение и возможность понимать язык животных.
 ', 1, '2017-07-27 16:30:00', '2017-08-09 16:30:00', 2, 2),

  (2, 'Тёмная башня', '
Приглашаем Вас на фильм в кинотеатр Родина.
Сеансы:
10:00,  13:10,  18:30,  20:20.
Режиссер:
Николай Арсель
В ролях:
Кэтрин Уинник, Мэттью МакКонахи, Идрис Эльба, Эбби Ли, Джеки Эрл Хейли, Деннис Хейсбёрт, Су-хён, Николас Хэмилтон,
Алекс МакГрегор, Фрэн Кранц
Язык показа
украинский
Описание
Наш мир — не единственный из существующих.
Заклятые враги Роланд Дискейн, последний из ордена стрелков, и Уолтер О’Дим, известный также как Человек в черном,
ведут извечную борьбу. На кону — мифическая Темная Башня, последний оплот и надежда вселенной, без которой мир будет
повержен в полный хаос и разрушение. Силам добра и зла суждено столкнуться в последней схватке,
ведь Роланд Дискейн — единственный, кому под силу остановить Человека в черном, прежде чем тот разрушит Темную Башню.
Продолжительность
95 мин.
', 1, '2017-08-03 10:00:00', '2017-08-16 20:00:00', 2, 2),

  (3, 'Валериан и город тысячи планет (3D)', '
Приглашаем Вас на фильм в кинотеатр Родина.
Сеансы:
нет информации.
Режиссер:
Люк Бессон.
В ролях:
Дэйн ДеХаан, Кара Делевинь, Элизабет Дебики, Джон Гудман, Итан Хоук, Клайв Оуэн, Рианна, Рутгер Хауэр, Крис У, Матьё Кассовиц
Язык показа:
украинский.
Описание:
2700 год. Валериан и Лорелин — космические спецагенты, которые по долгу службы впутались в подозрительное дело и стали
невольными участниками то ли межгалактического заговора, то ли аферы причудливых поселенцев планеты Альфа,
прибывших туда из различных миров со всех уголков галактик.
Продолжительность
137 мин.
', 1, '2017-08-10 00:00:00', '2017-08-23 00:00:00', 2, 2),

  (4, '
Телохранитель киллера', '
Приглашаем Вас на фильм в кинотеатр Родина.
Сеансы:
нет информации.
Режиссер:
Патрик Хьюз.
В ролях:
Гари Олдман, Райан Рейнольдс, Сэмюэл Л. Джексон, Сальма Хайек, Элоди Юнг, Ричард Э. Грант,
Жоаким ди Алмейда, Кирсти Митчелл, Жозефин де ла Буме, Сэм Хэзелдайн.
Язык показа:
украинский.
Описание:
Он — телохранитель мирового уровня. Его новая работа — охранять киллера, которого все мечтают убить.
Он и сам с удовольствием прикончил бы этого гада. Но работа — есть работа: смертельные враги в прошлом,
они вынуждены объединиться в настоящем, чтобы выжить. Однако их методы настолько различны, а принципы противоположны,
что вопрос выживания — под большим вопросом.
Продолжительность
118 мин.
', 1, '2017-08-17 00:00:00', '2017-08-30 00:00:00', 2, 2),

  (5, 'Эмоджи Муви (3D)', '
Приглашаем Вас на мультфильм в кинотеатр Родина.
Сеансы:
нет информации.
Режиссер:
Энтони Леондис.
В ролях:
ТиДжей Миллер, Джеймс Корден, Анна Фэрис, Майя Рудольф, Стивен Райт, Дженнифер Кулидж, Патрик Стюарт, Кристина Агилера,
София Вергара, Рэйчел Рэй.
Язык показа:
украинский.
Описание:
Знаете ли вы, что внутри каждого смартфона есть красочный городок Текстополис, в котором живут эмоджи?
И что они ужасно радуются, когда владелец телефона именно их выбирает для своего сообщения?
Каждый из эмоджи отвечает лишь за одну эмоцию, и только Джин может выражать несколько эмоций сразу.
Он очень хочет стать таким же, как и его собратья, и для этого вместе со своими друзьями пускается в увлекательное
путешествие по приложениям телефона в поисках программы, которая поможет ему измениться.
Неожиданно герои узнают о грозной опасности, нависшей над городом. Смогут ли друзья спасти Текстополис и всех его обитателей?
Продолжительность
86 мин.
', 1, '2017-08-17 00:00:00', '2017-08-30 00:00:00', 2, 2),

  (6, 'Хор им. Г.Веревки', '
Приглашаем Вас на Концерт во Дворец Культуры и Техники НКМЗ
', 2, '2017-10-06 19:00:00', '2017-10-06 19:00:00', 3, 3),

  (7, 'Атомная Блондинка', '
Приглашаем Вас на фильм в кинотеатр Родина.
Сеансы:
12:00,  18:00,  20:00.
Режиссер:
Дэвид Литч.
В ролях:
Шарлиз Терон, София Бутелла, Джеймс МакЭвой, Джон Гудман, Билл Скарсгард,
Тоби Джонс, Эдди Марсан, Дэниэл Бернхард, Джеймс Фолкнер, Йоуханнес Хёйкьюр Йоуханнессон.
Язык показа:
украинский.
Описание:
Агент Лоррейн Бротон, бриллиант в короне Секретной разведывательной службы Ее Величества, не просто мастер шпионажа: она бомбически сексуальна, взрывоопасна и использует весь арсенал своих уникальных умений во время невыполнимых миссий.
В неспокойном Берлине, куда ее направляют с заданием вернуть бесценное досье, она вынуждена объединиться с агентом под прикрытием Дэвидом Персивалем.
Вместе им предстоит проложить путь через тернии смертельных шпионских игр.Продолжительность
115 мин.
', 1, '2017-07-27 12:00:00', '2017-08-09 20:00:00', 2, 2),

  (8, 'КВН', 'Приглашаем вас в Городской дворец культуры «Строитель»', 6, '2017-04-15 18:00:00', '2017-04-15 20:00:00', 1, 6),

  (9, 'Выставка картин', 'Приглашаем Вас в Краматорский художественный музей ', 4, '2017-08-29 10:00:00', '2017-08-29 16:00:00', 1, 8),

  (10, 'Студия "Квартал 95"', '
Приглашаем Вас на стадион Авангард.
Студия "Квартал 95" даст бесплатный концерт в Краматорске на стадионе "Авангард".
"В этот праздничный день коллектив студии даст большой бесплатный концерт, который пройдет в Краматорске на городском стадионе Авангард в парке культуры и отдыха «Сад Бернацкого». Концерт проводится при поддержке Донецкой областной государственной администрации.

«Квартал 95» готовит 3-часовую концертную программу. Жители восточных городов Украины увидят новый «Вечерний Квартал», телевизионная премьера которой состоится в эфире канала «1+1» только в конце сентября. Также актерский коллектив покажет уже популярные и полюбившиеся номера своей программы. Готовятся и музыкальные поздравления от украинских исполнителей.

Посетить большой концерт смогут все желающие – вход свободный. Отпраздновать вместе с «Кварталом» День Независимости приглашены военные, волонтеры, воспитанники детских домов и все, кто желает весело и дружно отметить главный Праздник страны.

Сразу по окончанию концертной программы «Квартал 95» приготовил еще один подарок для гостей мероприятия – кинопоказ полнометражного фильма «Слуга народа 2». Политическая комедия стала одним из лидеров кинопроката Украины в 2016 году. Тогда в кинотеатрах страны ее посмотрело более 340 000 зрителей. На этот раз готовится самый масштабный кинопоказ за всю историю Украины.

После окончания официального кинопроката «Слуга народа 2» был недоступен для просмотра где-либо. Это беспрецедентный случай для Украины. Сейчас же все, кто не успел увидеть историю борьбы и противостояния олигархам Народного Президента на больших экранах, смогут сделать это в самой большой компании и на самом большом экране под открытым небом прямо на стадионе", - сообщается на сайте kvartal95.com/ua Источник: #Краматорск сегодня
', 2, '2017-08-24 19:00:00', '2017-08-24 00:00:00', 13, 13),

  (11, 'Шароотпадное шоу «Супершар»', '
Приглашаем Вас на спектакль во Дворец Культуры и Техники НКМЗ.
НОВОЕ ДЕТСКОЕ ШАРООТПАДНОЕ ШОУ «СУПЕРШАР» удивит каждого!
Самые смешные одесситы Тутта и Сеня вместе с Шоу- театром «А вот и Мы» приглашают всех детей и взрослых на Шароотпадное ШОУ «СуперШар»! Только воздушные шарики, только приключения!
В волшебной Шариковой стране живут Принц и Принцесса — Сеня и Тутта.
Все у них в королевстве хорошо. Все играют с воздушными шариками, радуются и веселятся.
', 5, '2017-03-26 11:00:00', '2017-03-26 12:00:00', 3, 3),

  (12, '«Давай, играй!»', '
Приглашаем Вас на стадион Блюминг.
«Давай, играй!» – это:
- бесплатные уроки футбола;
- занятия с настоящим тренером;
- хорошее футбольное поле для игры;
- равные условия для мальчиков и девочек;
- активный досуг вашего ребенка.
Стать участником проекта «Давай, играй!» может каждый ребенок в возрасте от 7 до 12 лет,
который хочет играть в футбол. Мы берем в проект всех желающих, без специфических отборов.
Мы ищем и обучаем тренеров-волонтеров, ежедневно проводящих занятия с мальчишками и девчонками.
Ребята занимаются на синтетических полях последнего поколения.
Конечно, если ребенок проявит футбольные таланты в рамках проекта, его могут пригласить в Академию клуба.

Для участия в проекте «Давай, играй!» нужно:
- позвонить администратору площадки, где хочет тренироваться ваш ребенок;
- отправить письмо с заявкой на электронную почту letsplay@shakhtar.com.
Краматорск, стадион «Блюминг». Администратор – Виталий, 066 970 60 09.
', 5, '2016-06-01 13:00:00', '2017-12-30 17:00:00', 1, 12),

  (13, 'Семинары', 'Приглашаем Вас в Центральную городскую публичную библиотеку им. М. Горького', 8, '2017-08-28 14:00:00', '2017-08-28 19:00:00', 1, 10),

  (14, 'Лебединое озеро', '
Приглашаем Вас на Романтический балет в двух действиях по мотивам немецких сказок во Дворец Культуры и Техники НКМЗ.
«Лебединое озеро» — классический балет, сюжет которого основан на старинной немецкой легенде.
Вы увидите невероятную историю сказочной любви!
Одетта отвергает Ротбарта, злого колдуна, за что он превращает ее в лебедя.
Принц тронут историей Одетты и готов убить злодея, но только беззаветная любовь юноши может снять заклятие.
Ротбарт путем обмана сводит принца с другой, после чего последует борьба. Злой гений погибает, и его чары рушатся.
Прекрасный лебедь превращается в девушку, и вместе с принцем они встречают лучи восходящего солнца.
', 6, '2017-09-13 19:00:00', '2017-09-13 19:00:00', 1, 3),

  (15, 'Время и Стекло', '
Приглашаем Вас на Концерт во Дворец Культуры и Техники НКМЗ
', 2, '2017-10-17 19:00:00', '2017-10-17 19:00:00', 3, 3);


-- --------------------------------------------------------

--
-- Структура таблицы `pictures`
--

CREATE TABLE `pictures` (
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event',
  `picture_url` varchar(255) NOT NULL COMMENT 'event''s picture'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pictures` (`event_id`, `picture_url`) VALUES
  (1, '1.jpg'),
  (1, '1_1.jpg'),
  (1, '1_2.jpg'),
  (2, '2.jpg'),
  (2, '2_1.jpg'),
  (2, '2_2.jpg'),
  (3, '3.jpg'),
  (3, '3_1.jpg'),
  (3, '3_2.jpg'),
  (4, '4.jpg'),
  (4, '4_1.jpg'),
  (4, '4_2.jpg'),
  (5, '5.jpg'),
  (5, '5_1.jpg'),
  (5, '5_2.jpg'),
  (6, '6.jpg'),
  (6, '6_1.jpg'),
  (6, '6_2.jpg'),
  (7, '7.jpg'),
  (7, '7_1.jpg'),
  (7, '7_2.jpg'),
  (8, '8.jpg'),
  (8, '8_1.jpg'),
  (8, '8_2.jpg'),
  (9, '9.jpg'),
  (9, '9_1.jpg'),
  (9, '9_2.jpg'),
  (10, '10.jpg'),
  (10, '10_1.jpg'),
  (10, '10_2.jpg'),
  (11, '11.jpg'),
  (11, '11_1.jpg'),
  (11, '11_2.jpg'),
  (12, '12.jpg'),
  (12, '12_1.jpg'),
  (12, '12_2.jpg'),
  (13, '13.jpg'),
  (13, '13_1.jpg'),
  (13, '13_2.jpg'),
  (14, '14.jpg'),
  (14, '14_1.jpg'),
  (14, '14_2.jpg'),
  (15, '15.jpg'),
  (15, '15_1.jpg'),
  (15, '15_2.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `places`
--

CREATE TABLE `places` (
  `place_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `latitude` decimal(9,6) NOT NULL COMMENT 'geo',
  `longitude` decimal(9,6) NOT NULL COMMENT 'geo',
  `city` varchar(255) DEFAULT NULL COMMENT 'place''s name',
  `street` varchar(255) DEFAULT NULL COMMENT 'place''s street',
  `house` smallint(6) DEFAULT NULL COMMENT 'place''s house',
  `apartment` smallint(6) DEFAULT NULL COMMENT 'place''s apartment',
  `postalcode` varchar(20) NOT NULL COMMENT 'zipcode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `places`
--

INSERT INTO `places` (`place_id`, `name`, `latitude`, `longitude`, `city`, `street`, `house`, `apartment`, `postalcode`) VALUES
  (1, 'Гік бункер', '48.743085', '37.588178', 'Краматорск', 'Марата', 8, 0, '84300'),
  (2, 'Kинотеатр \"Родина\".', '48.742047', '37.587805', 'Краматорск', 'Академическая', 49, 0, '84300'),
  (3, 'Городской Дворец Культуры и Техники НКМЗ.', '48.738296', '37.586270', 'Краматорск', 'Мира', 1, 0, '84300'),
  (4, 'Парк \"Юбилейный\".', '48.725233', '37.587466', 'Краматорск', '0', 0, 0, '84300'),
  (5, 'Парк им. А.С.Пушкина.', '48.748691', '37.586029', 'Краматорск', '0', 8, 0, '84300'),
  (6, 'Городской дворец культуры «Строитель».', '48.750140', '37.589599', 'Краматорск', 'Маяковского', 9, 0, '84300'),
  (7, 'Парк «Сад Бернацкого».', '48.720523', '37.551827', 'Краматорск', 'Конрада Гампера', 1, 0, '84300'),
  (8, 'Краматорский художественный музей.', '48.735750', '37.581010', 'Краматорск', 'Академическая', 60, 0, '84300'),
  (9, 'Музей истории города Краматорска.', '48.735750', '37.581010', 'Краматорск', 'Академическая', 60, 0, '84300'),
  (10, 'Центральная городская публичная библиотека им. М. Горького.', '48.734465', '37.604672', 'Краматорск', 'Марии Приймаченко', 16, 0, '84300'),
  (11, 'Арт-кафе фиеста.', '48.742359', '37.594539', 'Краматорск', 'Дружбы', 24, 0, '84300'),
  (12, 'Блюминг, стадион в Краматорске', '48.747970', '37.589552', 'Краматорск', 'Академическая', 2, 0, '84300'),
  (13, 'Авангард, стадион в Краматорске.', '4 48.719087', '37.549493', 'Краматорск', 'Конрада Гампера', 1, 0, '84300');

-- --------------------------------------------------------

--
-- Структура таблицы `social_networks`
--

CREATE TABLE `social_networks` (
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'company',
  `social_network_id` int(10) UNSIGNED NOT NULL COMMENT 'social network list',
  `company_network_url` varchar(255) NOT NULL COMMENT 'company''s social network'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `social_networks`
--

INSERT INTO `social_networks` (`company_id`, `social_network_id`, `company_network_url`) VALUES
(1, 1, 'webcity.com');

-- --------------------------------------------------------

--
-- Структура таблицы `social_networks_list`
--

CREATE TABLE `social_networks_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `network` varchar(255) NOT NULL COMMENT 'network''s name',
  `network_url` varchar(255) NOT NULL COMMENT 'network''s url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `social_networks_list`
--

INSERT INTO `social_networks_list` (`id`, `network`, `network_url`) VALUES
(1, 'Reserved', 'reserved.com'),
(2, 'Facebook', 'fb.com'),
(3, 'Twitter', 'https://twitter.com/');

-- --------------------------------------------------------

--
-- Структура таблицы `telephone_numbers`
--

CREATE TABLE `telephone_numbers` (
  `company_id` int(10) UNSIGNED NOT NULL COMMENT 'company',
  `telephone` varchar(13) NOT NULL COMMENT 'tel number'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `telephone_numbers`
--

INSERT INTO `telephone_numbers` (`company_id`, `telephone`) VALUES
(1, '+380954495475'),
(2, '+380951907771'),
(3, '+380626435095'),
(4, '+380626458433'),
(5, '+380626437327'),
(6, '+380626465058'),
(7, '+111111111111'),
(8, '+380626450305'),
(9, '+380626455158'),
(10, '+380626452046'),
(11, '+380626432358'),
(12, '+380626437042'),
(13, '+380626447533');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL COMMENT 'login',
  `hash` varchar(255) NOT NULL COMMENT 'password''s hash',
  `email` varchar(255) NOT NULL COMMENT '@',
  `picture_url` varchar(255) DEFAULT NULL COMMENT 'avatar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for users';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `hash`, `email`, `picture_url`) VALUES
(1, 'test', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com ', ''),
(2, 'Lucky75', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(3, 'GodRa13', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(4, 'lisnm', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(5, 'olgalisvaja', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', ''),
(6, '22nick', '$1$0GK47V1I$NN22o4Dpa79mhXYLXhmk1.', 'infomail.myday@gmail.com', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_companies`
--

CREATE TABLE `users_companies` (
  `id_user` int(10) UNSIGNED NOT NULL COMMENT 'user''s id from "users"',
  `id_company` int(10) UNSIGNED NOT NULL COMMENT 'company''s id from "company'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='connect users and companies';

--
-- Дамп данных таблицы `users_companies`
--

INSERT INTO `users_companies` (`id_user`, `id_company`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`category_name`),
  ADD KEY `subcategory_id` (`parent_id`);
ALTER TABLE `categories` ADD FULLTEXT KEY `category_name` (`category_name`);

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_id` (`place_id`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`company_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `place_id` (`place_id`);

--
-- Индексы таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD KEY `event_id` (`event_id`);

--
-- Индексы таблицы `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`place_id`);

--
-- Индексы таблицы `social_networks`
--
ALTER TABLE `social_networks`
  ADD KEY `company_id` (`company_id`),
  ADD KEY `social_network_id` (`social_network_id`);

--
-- Индексы таблицы `social_networks_list`
--
ALTER TABLE `social_networks_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `telephone_numbers`
--
ALTER TABLE `telephone_numbers`
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `company_id` (`company_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`login`);

--
-- Индексы таблицы `users_companies`
--
ALTER TABLE `users_companies`
  ADD UNIQUE KEY `User_unique` (`id_user`),
  ADD KEY `id_company` (`id_company`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `places`
--
ALTER TABLE `places`
  MODIFY `place_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `social_networks_list`
--
ALTER TABLE `social_networks_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`);

--
-- Ограничения внешнего ключа таблицы `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `event` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Ограничения внешнего ключа таблицы `social_networks`
--
ALTER TABLE `social_networks`
  ADD CONSTRAINT `social_network_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `social_network_list` FOREIGN KEY (`social_network_id`) REFERENCES `social_networks_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `telephone_numbers`
--
ALTER TABLE `telephone_numbers`
  ADD CONSTRAINT `telephone_numbers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Ограничения внешнего ключа таблицы `users_companies`
--
ALTER TABLE `users_companies`
  ADD CONSTRAINT `company_id_companies` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `user_id_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
