create table if not exists tbl1(one text, two int);
delete from tbl1;
insert into tbl1 values('hello!',10);
insert into tbl1 values('goodbye', 20);
select * from tbl1;
