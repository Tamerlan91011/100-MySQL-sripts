-- 15 ЗАПРОСОВ ИЗ ФУНКЦИОНАЛЬНЫХ ТРЕБОВАНИЙ --
-- ТРАНЗАКЦИОННЫЕ ЗАПРОСЫ -- 
-- 1.Добавить статью на форум
use `geek_portal`;
select * from `article`;
alter table `article` auto_increment = 10;
insert into `article` (`title`,`text`,`user_id`,`forum_id`) value ('Lifehacks in "Jojo: Golden Eye"','Bon Jiorno, my friends!...','7','9');

-- 2.Добавить новый форум внутри выбранного фандома
-- Пришлось изменить запрос, так как добавился новый фандом, но не раздел внутри уже существующего фандома
insert into `fandom` (`idfandom`,`category`,`name`) value (11,'videogames','Jojo: Golden Eye');
delete from `fandom` where `idfandom` = 11;
alter table `fandom` auto_increment = 10;
insert into `forum` (`idforum`,`section`,`name`,`fandom_id`) value (11,'Guides','Jojo: Golden Eye',9);

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
select * from `event` where fandom_id = 1;

-- 7.Показать все новости (с учетом изменений имеется ввиду события)
select `text`,`date`,`links`,`name` as 'Fandom name' from `event` join `fandom` where fandom_id = fandom.idfandom;

-- 8.Показать конкретную статью (с указанным заголовком)
select `title`,`text` from article where `title` ='Lifehacks in "Jojo: Golden Eye"';

-- 9.Показать описание выбранного плагина (мы вибираем номер плагина и по нему смотрим описание)
-- Описанием здесь считается команда и его скрипт
SELECT `idplugin`,`gamecube`,`description`,`commands`,`scripts` 
FROM `plugin` join `tool`
WHERE idplugin = plugin_id;

-- 10. Показать игровые события (и всех его участников)
SELECT `name` as 'members',`title`,`description` 
FROM geek_portal.members_of_role_game_event,geek_portal.user JOIN geek_portal.role_game_event
where user_id = iduser 
and role_game_event_id = idrole_game_event;


-- АНАЛИТИЧЕСКИЕ ЗАПРОСЫ -- 
-- 11. Показать, сколько статей в выбранном фандоме (Фандоме "Stell ball run")
SELECT COUNT(*) as 'Articles in fandom',`name` 
FROM geek_portal.forum join geek_portal.fandom 
where 
fandom_id=9
and 
idfandom = fandom_id;

-- 12. Показать, сколько всего статей (вообще во всех фандомах)
SELECT COUNT(*) as 'Sum of articles' FROM geek_portal.article;

-- 13. Сколько пользователей выбранного пола (вместо "Показать всех активных пользователей")
SELECT COUNT(*) as 'Males'
FROM geek_portal.user
where `gender` = 'M';
SELECT COUNT(*) as 'Females'
FROM geek_portal.user
where `gender` = 'F';

-- 14. Среднее количество подключенных плагинов на один чат
select count(`rchat_id`)/count(distinct `rchat_id`) from `using_tool`;

-- 15. Среднее количество персонажей, созданных одним пользователем.
select count(`id`)/count(distinct`user_id`) as 'avg num of chars to user' from geek_portal.character;

-- ПРОЧИЕ ЗАПРОСЫ -- 
-- Изменение некорректных данных (UPDATE)
UPDATE `geek_portal`.`article` 
SET `text` = 'Let me introduce you my comrades' 
WHERE (`idarticle` = '8');

UPDATE `geek_portal`.`article` 
SET `text` = 'I\'m Jack Hidden, and this is my blog.' 
WHERE (`idarticle` = '9');

UPDATE `geek_portal`.`article` 
SET `title` = 'Lifehacks in "Jojo: Golden Eye" Part 1', `text` = 'Bon Jiorno, my friends! I\'m Coule Joestar.' 
WHERE (`idarticle` = '11');

UPDATE `geek_portal`.`article` 
SET `title` = 'Lifehacks in "Jojo: Golden Eye" Part 2', `text` = 'Bon Jiorno, my friends! ' 
WHERE (`idarticle` = '12');

UPDATE `geek_portal`.`chat` 
SET `chat_name` = 'Discord pals from Server' 
WHERE (`idchat` = '10');

-- Удаление некорректных данных
delete from `message` where `idmessage` =10;
delete from `article` where `title` = 'Text';
delete from `event` where `text` = 'Welcome to the Our Event!';

ALTER TABLE `message` 
RENAME TO `messages` ;

ALTER TABLE `user` 
RENAME TO  `users`;

ALTER TABLE `event`
RENAME TO `events`;

-- Работа с датами и строками (просмотр сообщений за 2001 год, за январь и написание сообщения)
select * from message where `date` like '%2001%';
select * from message where monthname(`date`) = 'January';
insert into `message` (`user_id`,`chat_id`,`date`,`text`) values(6,9,now(),'Timur is here');