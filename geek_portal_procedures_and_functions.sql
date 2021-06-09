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
    
    
-- 4. Вывести количичество статей в форуме

-- ФУНКЦИИ -- 
-- 1. Отобразить статус персонажа словами, а не цифрами.
delimiter //
drop function ShowCharacterLifeStatus;
//
create function ShowCharacterLifeStatus(`life_status` int) returns varchar(20) deterministic
begin
	declare `status` varchar(20);
    if (`life_status` >= 1) 
    then set `status` = 'Alive';
    
    elseif (`life_status` <= 0) 
    then set `status` = 'Dead';
    
    end if;
    return (`status`); 
end //

-- 2. Посчитать количество статей в указанном форуме и отобразить степень популярности форума
delimiter //
drop function GetStatusOfForums;//
create function GetStatusOfForums (`id_of_forum` int) returns varchar (20) deterministic
begin 
    declare `status` varchar(20);
    
	SELECT `Sum`,`forum_id` INTO @S,@F FROM
    (SELECT `forum_id`, COUNT(`forum_id`) AS `Sum`
    FROM `article`
    WHERE `forum_id` = `id_of_forum`
    GROUP BY `forum_id` ) 
    AS `Table`;
    
    if ((@S > 0) and (@S < 10) and (@F = `id_of_forum`))
	then set `status`='New forum';
    
    elseif (@S >= 10 and @S < 30 and (@F = `id_of_forum`)) 
	then set `status`='Middle forum';
    
	elseif (@S >= 30 and @S < 40 and (@F = `id_of_forum`))
    then set `status`='Lowly famous forum';
    
    elseif (@S >= 40 and (@F = `id_of_forum`))
    then set `status`='Higly famous forum';

	else set `status`='Recently created';
    end if;
    return (`status`);
end //

select `idforum`,`forum_name`,GetStatusOfForums(`idforum`) as 'Forum Status' from `forum`;
//
select @F;
-- 3. Посчитать количество статей в указанном фандоме и отобразить степень популярности фандома