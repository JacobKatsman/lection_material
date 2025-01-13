create table hierarchy_example (
    id serial not null,
    name character varying(100),
    parent_id integer,
    constraint id_pk primary key (id)
)


insert into hierarchy_example (name, parent_id) values ('root', null);
insert into hierarchy_example (name, parent_id) values ('item1', 1);
insert into hierarchy_example (name, parent_id) values ('item2', 1);
insert into hierarchy_example (name, parent_id) values ('subitem1', 2);


with recursive temp1 (id, parent_id, name, path) as (
select t1.id, t1.parent_id, t1.name, cast (t1.name as varchar (50)) as path
from hierarchy_example t1 where t1.name = 'subitem1'
union
select t2.id, t2.parent_id, t2.name, cast (temp1.path || '->'|| t2.name as varchar(50))
from hierarchy_example t2 inner join temp1 on (temp1.parent_id = t2.id))
select * from temp1 
