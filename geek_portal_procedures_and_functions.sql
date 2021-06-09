-- ПРОЦЕДУРЫ -- 
-- МОДА: Процедура с out 
-- 1. Показать всех пользователей
DELIMITER //
drop procedure GetUsers;
//
call GetUsers('Alex');
//
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
end//;


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
-- 1. Отобразить статус персонажа словами, а не цифрами.
delimiter //
drop function ShowCharacterLifeStatus;
//
create function ShowCharacterLifeStatus(`life_status` int)
returns varchar(20)
deterministic
begin
	declare `status` varchar(20);
    if (`life_status` >= 1) then set `status` = 'Alive';
    elseif (`life_status` <= 0) then set `status` = 'Dead';
    end if;
    return (`status`); 
end //

select `name`,`initials`,`description`, ShowCharacterLifeStatus(`life_status`) as 'Status' from `character` 
order by `name`;

-- 2. Посчитать количество статей в указанном форуме и отобразить степень популярности форума
-- 3. Посчитать количество статей в указанном фандоме и отобразить степень популярности фандома