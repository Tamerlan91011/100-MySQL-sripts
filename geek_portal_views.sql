-- ПРЕДСТАВЛЕНИЯ (VIEW) -- 
-- 1. Среднее количество статей на форуме в день
create view Avrg_Articles_Per_Day as 
select distinct `forum_id`,count(`date`)/count(distinct `date`) as 'Avrg number of articles in day', `forum_name`,`section`
from `article` 
join `forum` on `article`.`forum_id`=`forum`.`idforum`
group by `forum_id`;

select * from Avrg_Articles_Per_Day;


-- 2. Топ 10 фандомов по количеству проведенных событий
create view top_10_fandoms_held_events as 
select `fandom`.name, count(*) as 'Sum of event' from `event` 
join `fandom` on `fandom`.`idfandom`=`fandom_id`
group by `fandom_id`
order by count(*) desc
limit 10;

select * from top_10_fandoms_held_events;


-- 3. Показать, в каких чатах обитают персонажи
create view chats_of_characters as
select `rchat_id`,`user_id`,`name` as 'Character name',`life_status`,`idchat`,`chat_name` from `character` 
left join `chat` on `rchat_id`=`idchat`
union
(select `rchat_id`,`user_id`,`name` as 'Character name',`life_status`,`idchat`,`chat_name`  from `character` 
right join `chat` on `rchat_id` = `idchat`);

select * from chats_of_characters;