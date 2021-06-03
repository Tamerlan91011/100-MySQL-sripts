-- ПРОЦЕДУРЫ -- 
-- 1. Показать всех пользователей
DELIMITER $$
drop procedure GetUsers;
$$
call GetUsers('Alex');
$$
create procedure GetUsers(IN `UserName` varchar(255))
begin 
	select
    `name`,
    `gender`,
    `email`
    from 
    `geek_portal`.`user`
    where `name`= `UserName`
    order by `name`;
end$$;


-- 2. Показать персонажей, исходя из их статуса (живы, или мертвы)
DELIMITER //
drop procedure GetCharacters;
//
call GetCharacters(1);
//
create procedure GetCharacters(in `alive_or_dead` varchar(1))
begin
	select 
    `name`,
    `initials`,
    `life_status`,
    `description`
    from `geek_portal`.`character`
    where `life_status`=`alive_or_dead`
    order by `name`;
end//

-- 3. Показать события, которые были проведены в указанный день
DELIMITER //
drop procedure GetEvents;
//
call GetEvents('2021-01-02');
//
create procedure GetEvents(in `date_of_publication` date)
begin
	select 
    `date`,
    `text`,
    `links`
    from `geek_portal`.`event`
    where `date` = `date_of_publication`
    order by `date`;
    end//
-- ФУНКЦИИ -- 
-- 1. 
-- 2.
-- 3.