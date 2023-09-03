-----------------1-----------------
--display students name, surname and their status for pricing
SELECT Name, Surname, Type
from CUSTOMER join STATUS
on CUSTOMER.STATUS_ID = Status.id
where Type = 'Student'

--display station name, id and garage capacity that their capacity is less than 4
SELECT STATION.name, GARAGE.id ,GARAGE.CAPACITY
from STATION
join GARAGE on GARAGE.STATION_ID = STATION.ID
where GARAGE.CAPACITY <= 4

-----------------2-----------------
--display how many people are students and how many people are retired
select count(STATUS_ID) , TYPE
from CUSTOMER
join STATUS S2 on S2.ID = CUSTOMER.STATUS_ID
group by TYPE
having count(STATUS_ID) >= 3

--display station name, station address id and how many people are working in there
select count(*), STATION.NAME, STATION.ADDRESS_ID
from EMPLOYEE
join STATION on EMPLOYEE.STATION_ID = station.ID
group by STATION.NAME, STATION.ADDRESS_ID

------------------3-----------------------
--display everone whos paying more than average
select name, surname, TICKET.PRICE
from CUSTOMER join TICKET
on CUSTOMER.ID = TICKET.CUSTOMER_ID
where TICKET.PRICE > (select avg(PRICE) from TICKET)

-----------------4-----------------------
--display earnings from each train ride
select tt.id, (select sum(price) from ticket t where t.TRAIN_RIDE_ID = tt.id)
from TRAIN_RIDE tt
