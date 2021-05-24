-- ЗАПРОСЫ ИЗ ФУНКЦИОНАЛЬНЫХ ТРЕБОВАНИЙ --
-- ТРАНЗАКЦИОННЫЕ ЗАПРОСЫ -- 
-- 1.Добавить статью на форум
use `geek_portal`;
select * from `article`;
alter table `article` auto_increment = 10; 
insert into `article` (`title`,`text`,`user_id`,`forum_id`) 
value ('Lifehacks in "Jojo: Golden Eye"','Bon Jiorno, my friends!...','7','9');

-- 2.Добавить новый форум внутри выбранного фандома
-- Пришлось изменить запрос, так как добавился новый фандом, но не раздел внутри уже существующего фандома
insert into `fandom` (`idfandom`,`category`,`name`) 
value (11,'videogames','Jojo: Golden Eye');
delete from `fandom` where `idfandom` = 11;
alter table `fandom` auto_increment = 10;
insert into `forum` (`idforum`,`section`,`forum_name`,`fandom_id`) value (11,'Guides','Jojo: Golden Eye',9);

-- 3.Добавить нового персонажа
insert into `character` (`id`,`rchat_id`,`user_id`,`name`,`initials`,`life_status`,`description`) 
value (10,6,6,'Johnny Joestar','JoJo',1,'Cool dude who use power of spin. Standuser. Name of stand: Tusk');

-- 4.Удалить имеющегося персонажа
delete from `character` 
where `name` ='Char1' and `life_status` = 0;

-- 5.Изменить персонажа (редактирование)
update `character` 
set `name` = 'Funny Valentie'
and `initials` = 'F.V.' 
and `life_status` = 1
and `description` = 'President of USA'
where `id` = 9;

-- СПРАВОЧНЫЕ ЗАПРОСЫ -- 
-- 6.Показать новости текущего фандома (с учетом изменений имеется ввиду событие (event))
select * from `event` 
where `fandom_id` = 1;

-- 7.Показать все новости (с учетом изменений имеется ввиду события)
select `text`,`date`,`links`,`name` as 'Fandom name' from `event` 
join `fandom` 
where `fandom_id` = `fandom`.`idfandom`;

-- 8.Показать конкретную статью (с указанным заголовком)
select `title`,`text` from `article` 
where `title` like '%Lifehacks in "Jojo: Golden Eye%';

-- 9.Показать описание плагина (мы выбираем номер плагина и по нему смотрим описание)
-- Описанием здесь считается команда и его скрипт
SELECT `idplugin`,`gamecube`,`description`,`commands`,`scripts` 
FROM `plugin` 
join `tool` on `idplugin` = `plugin_id`;

-- 10. Показать игровые события (и всех его участников)
SELECT `name` as 'members',`title`,`description` FROM `members_of_role_game_event`
JOIN `user` on `user_id` = `iduser`
JOIN `role_game_event` on `role_game_event_id` = `idrole_game_event`;


-- АНАЛИТИЧЕСКИЕ ЗАПРОСЫ -- 
-- 11. Показать, сколько статей в выбранном фандоме (Фандоме "Stell ball run")
SELECT COUNT(*) as 'Articles in fandom',`name` FROM `forum` 
join `fandom` on `fandom_id` = `idfandom`
where 
`fandom_id`=9;

-- 12. Показать, сколько всего статей (вообще во всех фандомах)
SELECT COUNT(*) as 'Sum of articles' FROM `article`;

-- 13. Сколько пользователей выбранного пола (вместо "Показать всех активных пользователей")
SELECT COUNT(*) as 'Males'FROM `user`
where `gender` = 'M';
SELECT COUNT(*) as 'Females'FROM `user`
where `gender` = 'F';

-- 14. Среднее количество подключенных плагинов на один чат
select count(`rchat_id`)/count(distinct `rchat_id`) from `using_tool`;

-- 15. Среднее количество персонажей, созданных одним пользователем.
select count(`id`)/count(distinct`user_id`) as 'avg num of chars to user' from `character`;

-- ПРОЧИЕ ЗАПРОСЫ -- 
-- ИЗМЕНЕНИЕ НЕКОРРЕКТНЫХ ДАННЫХ (UPDATE) --
-- 16.(1) Изменение некорректных данных
UPDATE `geek_portal`.`article` 
SET `text` = 'Let me introduce you my comrades' 
WHERE `idarticle` = '8';

-- 17.(2) Изменение текста статьи
UPDATE `geek_portal`.`article` 
SET `text` = 'I\'m Jack Hidden, and this is my blog.' 
WHERE (`idarticle` = '9');

-- 18.(3) Изменение текста статьи
UPDATE `geek_portal`.`article` 
SET `title` = 'Lifehacks in "Jojo: Golden Eye" Part 1', `text` = 'Bon Jiorno, my friends! I\'m Coule Joestar.' 
WHERE (`idarticle` = '11');

-- 19.(4) Изменение заголовка статьи
UPDATE `geek_portal`.`article` 
SET `title` = 'Lifehacks in "Jojo: Golden Eye" Part 2', `text` = 'Bon Jiorno, my friends! ' 
WHERE (`idarticle` = '12');

-- 20.(5) Изменение названия чата
UPDATE `geek_portal`.`chat` 
SET `chat_name` = 'Discord pals from Server' 
WHERE (`idchat` = '10');

-- УДАЛЕНИЕ НЕКОРРЕКТНЫХ ДАННЫХ (Delete) --
-- 21.(1) Удалить сообщение, чьё id равно 10
delete from `message` where `idmessage` =10;

-- 22.(2) Удалить статьи, чьи заголовки содержат слово "Text"
delete from `article` where `title` like '%Text%';

-- 23.(3) Удалить события, чье содержание стандартно
delete from `event` where `text` like '%Welcome to the Our Event!%';

-- 24.(4) Удалить статьи без ссылок
delete from `article` where `links` is null;

-- 25.(5) Удалить сообщения пользователей, где есть слово text(число)
delete from `message` where `text` like '%text%';


-- SELECT, DISTINCT, WHERE --
-- 26.(1) просмотр сообщений за 2001 год
select * from `message` where `date` like '%2001%';

-- 27.(2) за январь
select * from `message` where monthname(`date`) = 'January';

-- 28.(3) написание сообщения
insert into `message` (`user_id`,`chat_id`,`date`,`text`) values(6,9,now(),'Timur is here');

-- 29.(4) просмотр всех сообщений, где есть hello
select * from `message` 
where `text` like '%hello%';

-- 30.(5) Убрать все повторяющиеся статьи и показать их текст с названием.
select distinct `title`,`text` from `article` 
order by `title`,`text`;

-- 31.(6) Показать события со ссылками
select * from `event` 
where `links` is not null;

-- 32.(7) Показать события без ссылок
select * from `event` 
where `links` is null;

-- 33.(8) Показать уникальные ролевые сообщения 
select distinct `text` from `role_message`;

-- 34.(9) Показать игровые события с уникальным описанием
select distinct `description` from `role_game_event`;

-- 35.(10) Показать уникальные категории внутри фандома
select distinct `section`,`fandom_id` from `forum` 
order by `fandom_id`,`section`;

-- 36.(11) Показать категории на форумах
select distinct `section` from `forum` 
order by `section`;

-- 37.(12) Показать форумы с названиями, в которых встречается словосочетание "How to"
select * from `forum` 
where `forum_name` like '%how to%';

-- 38.(13) Показать сколько пользователей создавало персонажей
select count(distinct `user_id`) as 'Number of users who created character' from `character`; 

-- 39.(14) Показать персонажей с уникальным описанием (не содержащим text)
select * from `character` 
where `description` not like '%text%';

-- 40.(15) Показать количество ролевых чатов, в которых участвуют персонажи 
select count(distinct `rchat_id`) as 'Number of membered role_chats' from `character`;

-- 41.(16) Показать количество чатов, где используются плагины
select count(distinct`rchat_id`) as 'Number of role chats where plugins were used' from `using_tool`;

-- 42.(17) Показать инструменты с игровыми кубиками
select * from `tool` 
where `gamecube` like '%1%';

-- 43.(18) Показать инструменты без игровых кубиков
select * from `tool` 
where `gamecube` like '%no%';

-- 44.(19) Показать инструменты со скриптами персонажей
select * from `tool` 
where `scripts` like '%Character%' or '%Char%';

-- 45.(20) Показать инструменты со скрипатми чата
select * from `tool` 
where `scripts` like '%Chat%';

-- INSERT SELECT -- 

-- 46.(1) Копирование скриптов в описание новых плагинов
insert into `plugin`(`description`) 
select `scripts` from `tool`;

-- 47.(2) копирование описания персонажей в сообщения
insert into `message`(`text`,`user_id`,`chat_id`,`date`) 
select `description`,`user_id`,`rchat_id`,now() from `character`;

-- 48.(3) Добавление участников в чаты (через персонажей)
insert into `chat_members`(`chat_id`,`user_id`)
select `rchat_id`,`character`.`user_id` from`character` where `rchat_id`!=`user_id`;


-- СОЕДИНЕНИЕ ТАБЛИЦ ДЛЯ СТАТИСТИКИ И ВЫБОРКА (JOIN"ы) -- 
-- 49.(1) Вывод всех сообщений, напечатанных пользователями.
select `iduser`,`name`,`gender`,`date`,`text` as 'Message' from `user` 
inner join `message` on `iduser` = `user_id`;

-- 50.(2) Показ сообщений, напечатанных конкретным пользователем.
select `iduser`,`name`,`gender`,`date`,`text` from `user` 
join `message` on `iduser` = `user_id` 
where  `iduser`=4; 

-- 51.(3) Показать пользователей, которые создавали и не создавали персонажей
select * from `user` 
left join `character` on `user_id` = `iduser`;

-- 52.(4) Показать пользователей, убивших своих персонажей
select `email`,`user`.`name` as 'Username',`gender`,`rchat_id`,`character`.`name` as 'char_name',`life_status`,`description` from `user` 
right join `character` on `iduser` = `user_id` 
and `life_status` =0;

-- 53.(5) Показать пользователей, кто записал системные инициалы персонажа (символ С и порядковый номер)
select * from `user` 
left join `character` on `iduser` = `user_id` 
and `initials` like '%C%';

-- 54.(6) Показать, в каких чатах обитают персонажи
select `rchat_id`,`user_id`,`name` as 'Character name',`life_status`,`idchat`,`chat_name` from `character` 
right join `chat` on `rchat_id`=`idchat`
union
(select `rchat_id`,`user_id`,`name` as 'Character name',`life_status`,`idchat`,`chat_name`  from `character` 
left join `chat` on `rchat_id` = `idchat`);

-- 55.(7) Показать, в каких чатах участвуют пользователи
select * from `user` 
left join `chat_members` on `user_id`=`iduser`;

-- 56.(8) Показать, в каких событиях участвуют пользователи
select * from `event` 
right join `user` on `user_id` = `iduser`;

-- 57.(9) К каким фандомам относятся события
select * from `event` 
right join `fandom` on `fandom_id` = `idfandom`;

-- 58.(10) К каким событиям, а соответсвенно фандомам относятся пользователи
select `fandom_id`,`date`,`links`,`text`,`user`.`name` as 'User name',`idfandom`,`category`,`fandom`.`name` as 'Fandom name' from `event` 
right join `user` on `iduser` = `user_id`
right join `fandom` on `fandom_id` = `idfandom`;

-- 59.(11) Показать к каким фандомам относятся форумы
select `section`,`forum_name`,`category`,`name` as 'Fandom name' from `forum` 
right join `fandom` on `fandom_id` = `idfandom`;

-- 60.(12) Показать к каким форумам относяться статьи
select `date`,`title` as 'Article title',`links`,`section`,`forum_name` from `article` 
right join `forum` on `forum_id` = `idforum`;

-- 61.(13) Показать чаты, где используются плагины
select `id` as 'RoleChat ID',`idplugin`,`Description` from `role_chat` 
right join `using_tool` on `role_chat`.id = `using_tool`.rchat_id
right join `plugin` on `using_tool`.`plugin_id` = `idplugin`;

-- 62.(14) Показать какие инструменты используются в плагинах
select `Description`, `commands`,`gamecube`,`scripts` from `plugin`
left join `tool` on `idplugin` = `plugin_id`;

-- 63.(15) Показать на каких фандомах основы ролевые чаты
select `id` as 'Rolechat id',`category`,`name` as 'Fandom name' from `role_chat`
right join `fandom_based_rchats` on `role_chat`.`id` = `fandom_based_rchats`.`rchat_id`
right join `fandom` on `fandom_id` = `idfandom`;

-- 64.(16) Показать СООБЩЕНИЯ, которые отсылались в ролевых чатах, основанных на фандомах
select `date`,`text` as 'Message',`category`,`name` as 'Fandomname' from `message` 
right join `fandom_based_rchats` on `rchat_id`=`chat_id`
right join `fandom` on `fandom_id`=`idfandom`;

-- 65.(17) Показать ПОЛЬЗОВАТЕЛЯ и его СООБЩЕНИЯ в чатах, основанных на фандомах
select `chat_id` as 'Number of chat',`date`,`user`.`name` as 'Username',`gender`,`text` as 'Text of message',`fandom`.`name` as 'Fandom name',`category` 
from `message` 
right join `fandom_based_rchats` on `rchat_id`=`chat_id`
right join `fandom` on `fandom_id`=`idfandom`
left join `user` on `user_id` = `iduser`;

-- 66.(18) Показать, к каким форумам, которые основаны на фандомах, относятся статьи
select `date`,`section` as 'Forum section',`forum_name`,`title`,`text` as 'Text of article',`category` as 'Fandom Category',`fandom`.`name` as 'Fandom name'
from `article`
right join `forum` on `forum_id`=`idforum`
right join `fandom` on `fandom_id` = `idfandom`;

-- 67.(19) Показать сообщения, набранные персонажами
select `date`,`character`.`name` as 'Name if character',`life_status`,`description`, `text` as 'Character message' from `character`
left join `role_message` on `character_id` = `character`.`id`;

-- 68.(20) Показать пользователей, чьи персонажи отправляли сообщения
select `date`,`user`.`name` as 'Username',`gender`,`character`.`name` as 'Char name',`life_status`,`description`,`text` as 'Message from char'
from `user`
left join `character` on `user_id` = `iduser`
left join `role_message` on `character_id` = `character`.`id`;


-- ГРУППИРОВКА И СОРТИРОВКА ПО РАЗНЫМ ПРИЗНАКАМ (Group by, order by, limit) -- 
-- 69.(1) Показать пользователей, чьи персонажи (СНАЧАЛА ЖИВЫЕ) отправляли сообщения. 
select `date`,`user`.`name` as 'Username',`gender`,`character`.`name` as 'Char name',`life_status`,`description`,`text` as 'Message from char'
from `user`
left join `character` on `user_id` = `iduser`
left join `role_message` on `character_id` = `character`.`id`
order by `life_status` desc;

-- 70.(2) Показать сообщения сначала убитых, а потом живых персонажей
select `date`,`character`.`name` as 'Name if character',`life_status`,`description`, `text` as 'Character message' from `character`
left join `role_message` on `character_id` = `character`.`id`
order by `life_status`;

-- 71.(3) Показать сначала старые, затем новые сообщения пользователей
select `iduser`,`name`,`gender`,`date`,`text` as 'Message' from `user` 
inner join `message` on `iduser` = `user_id`
order by `date`;

-- 72.(4) Показать новые, а затем старые сообщения пользователей
select `iduser`,`name`,`gender`,`date`,`text` as 'Message' from `user` 
inner join `message` on `iduser` = `user_id`
order by `date` desc;

-- 73.(5) Отсортировать ролевые чаты по количеству использованных плагинов (от большего к меньшему)
select `rchat_id` as 'Number of role chat', count(*) as 'Sum of used plugins' from `using_tool` 
group by `rchat_id`;

-- 74.(6) Показать количество символов у описания плагина и сам плагин в порядке возрастания
select `Description`, length(`Description`) as 'Length of description' from `plugin` 
order by length(`Description`);

-- 75.(7) Показать ролевые чаты, где использовался самый поздний плагин с инстурментом (в порядке убывания)
select `plugin_id` as 'Number of plugin', `id` as 'Number of Role chat' from `using_tool` 
right join `role_chat` on `rchat_id`=`role_chat`.`id`
order by `plugin_id` desc;

-- 76.(8) Показать первые два форума
select * from `forum` 
right join `fandom` on `fandom_id` = `idfandom` 
order by `idforum` 
limit 2;

-- 77.(9) Вторые два
select * from `forum` 
right join `fandom` on `fandom_id` = `idfandom` 
order by `idforum` 
limit 2,2;

-- 78.(10) Третие два
select * from `forum` 
right join `fandom` on `fandom_id` = `idfandom` 
order by `idforum` 
limit 4,2;

-- 79.(11) Последующие 4
select * from `forum` 
right join `fandom` on `fandom_id` = `idfandom` 
order by `idforum` 
limit 6,4;

-- 80.(12) Показать максимальную длину названия форума в каждой категории
select `section`,max(length(`forum_name`)) as 'Symbols in longest forum name' from `forum` 
group by `section`;

-- 81.(13) Показать форумы только по двум выбранным категориям и сортировать по номеру id форума
select * from `forum` 
where `section` like '%Help%'
union 
(select * from `forum` 
where `section` like '%FAQ%')
order by `idforum`;

-- 82.(14) Показать форумы только по трем выбранным категориям

select * from `forum` where `section` like '%Help%'
union 
(select * from `forum` where `section` like '%FAQ%')
union 
(select * from `forum` where `section` like '%Guides%')
order by `idforum`;

-- 83.(15) Показать любой форум любой категории, кроме одной
select * from `forum` 
where `section` not like '%Help%' group by `section`;

-- 84.(16) Кроме двух 
select * from `forum` 
where `section`!='Help' 
and `section`!='FAQ'
group by `section`;

-- 85.(17) Кроме трех
select * from `forum` 
where `section`!='Help' 
and `section`!='FAQ' 
and `section`!='Guides'
group by `section`;

-- 86.(18) Показать сообщения только первых двух пользователей
select * from `message` 
limit 2;

-- 87.(19) Только первых четырех
select * from `message` 
limit 2,2;

-- 88.(20) Показать последние сообщения
select * from `message` 
where `date` in (select max(`date`) as 'date' from `message`) 
order by `user_id`;

-- UNION, EXCEPT, INTERSECT --
-- 89.(1) Показать сообщения пользователей, имя пользователей и их чаты
-- 90.(2) Показать форумы вместе с фандомами
-- 91.(3) Показать все, что есть в первой, но нет во второй таблице
-- 92.(4) Показать что-то, что есть и в первой и второй таблицах
-- 93.(5) Объедиить ролевые чаты, плагины, пользователей и персонажей

-- ВЫБОРКА С ALL, ANY, EXISTS -- 
-- 94.(1) Показать пользователей, кто оставил ссылку в событии 
-- Условимся, что в рамках данной работы одно событие - это одна ссылка
select `iduser`,`name`from `user` 
where exists
(select `links` from `event` where `links` is not null 
and
`user_id`=`iduser`);

-- 95.(2) Вывести пользователей, кто писал сообщения, содержащие слово "text"
select `iduser`,`name` from `user` 
where `iduser`= any
(select `user_id` from `message` where `text` like '%text%');

-- 96.(3) Показать все плагины,которые не используют никаких инструментов
select * from `plugin` 
where `idplugin` > all
(select `id` from `tool`);

-- GROUP_CONCAT И ПРОЧИЕ ФУНКЦИИ --
-- 97.(1) Сгруппировать персонажей по пользователям
-- 98.(2) Сгруппировать события по фандомам
-- 99.(3) Сгруппировать форумы по категориям
 
-- СЛОЖНЫЕ МНОГОУРОВНЕВЫЕ ЗАПРОСЫ --
-- 100.(1) Объеденить пользователей, сообщения, чаты, персонажей, фандомы, события и игровые события