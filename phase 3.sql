--------------------------------------------------------------------------------
1--IT WORKS IT WORKS IT WORKS

create or replace Trigger after2_status
after update of CAPACITY
on GARAGE
for each row

BEGIN

    dbms_output.put_line('Now your garage capacity is: '|| :new.capacity);
END;

--DML 
SET SERVEROUTPUT ON
UPDATE
    GARAGE
SET
    CAPACITY = 6
WHERE
    id = 2;










----------------------------------------------------------------------------------------------------------

-- IT WORKS IT WORKS IT WORKS
2--
    create or replace TRIGGER after1_employeeName
    AFTER INSERT
    ON EMPLOYEE
    FOR EACH ROW
    BEGIN
        dbms_output.put_line('insert is successful, new name:'||:new.name||'new surname: '||:new.surname);
    END;


--DML
SET Serveroutput ON;
INSERT INTO EMPLOYEE
values (9,'Johny1','Dashy',0123123123,1,1)
-------------------------------------------------------------------------------------------------------------















--------------------------------------------------------------------------------------
3--IT WORKS IT WORKS IT WORKS
create or replace TRIGGER before2_priceChange
before UPDATE
ON ticket
FOR EACH ROW

BEGIN
    IF :new.price != 15 AND :new.price != 20 AND :new.price != 40 then
        RAISE_APPLICATION_ERROR(-20101, 'You cant change price. Its fixed like 15-20-40.');
    END IF;
    dbms_output.put_line('its successful');
END;

--DML
SET Serveroutput ON;
UPDATE
    TICKET
SET
    price = 20
WHERE
    id = 1;
------------------------------------------------------------------------------------------












---------------------------------------------------------------------------------------
4--IT WORKS IT WORKS IT WORKS
create or replace trigger before2_ifexist
before insert or update or delete
on CUSTOMER
for each row
declare check_ex int;
BEGIN
    if INSERTING then
        select count(1) into check_ex
        from CUSTOMER
        where name = :new.name;
        if check_ex > 0 then
            raise_application_error(-20100, 'Customer with that name already exists.');
        end if;
    elsif UPDATING then
        if :old.name <> :new.name then
            raise_application_error(-20100, 'You cant change customers name.');
        end if;
    end if;
END;
--DML
update CUSTOMER
set name = 'adsasd'
where id = 1;

INSERT INTO CUSTOMER
values (1,'John','Smith',7292292929,'03-ekim-2000',2)
------------------------------------------------------------------------------------------
