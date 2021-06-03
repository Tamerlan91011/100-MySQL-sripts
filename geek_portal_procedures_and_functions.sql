-- ПРОЦЕДУРЫ -- 
-- 1. Показать всех пользователей
DELIMITER $$
drop procedure GetUsers;
$$
call GetUser;
$$
create procedure GetUsers()
begin 
	select
    `name`,
    `gender`,
    `email`
    from 
    `geek_portal`.`user`
    order by `name`;
end $$;


-- 2. Показать всех живых персонажей
DELIMITER //
drop procedure GetCharacters;
//
call GetCharacters;
//
create procedure GetCharacters()
begin
	select 
    `name`,
    `initials`,
    `life_status`,
    `description`
    from `geek_portal`.`character`
    where `life_status`=1
    order by `name`;
end//

-- 3. Показать события, в которых есть ссылка
DELIMITER //
drop procedure GetEvents;
//
call GetEvents;
//
create procedure GetEvents()
begin
	select 
    `date`,
    `text`,
    `links`
    from `geek_portal`.`event`
    where `links` is not null
    order by `date`;
    end//
-- ФУНКЦИИ -- 