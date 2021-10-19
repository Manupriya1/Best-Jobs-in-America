-- create database
create database best_jobs;
use best_jobs;
-- craete temp table
drop table temp_table;
create table temp_table
(
salary varchar(255)
,education varchar(255)
,description varchar (8000)
,title varchar(500)
,skills varchar (1000)
,country varchar(40)
,locality varchar(255)
,posted_at varchar(555)
,longitude float
,postalCode varchar(255)
,experience varchar(255)
,address varchar(255)
,latitude float
,_id varchar(255)
,company varchar(255)
,region varchar(255)
,employment_type varchar(255)
)
truncate temp_table;
select * from temp_table;
drop table jobs
-- create table jobs
drop table jobs;
create table jobs
(
job_id int not null auto_increment
,education varchar(255)
,description varchar(8000)
,title varchar(500)
,skills varchar (1000)
,experience varchar(255)
,_id varchar(255)
,company varchar(255)
,employment_type varchar(255)
,primary key (job_id)
)
-- create dim address
select * from jobs;
truncate address;
drop table address;
create table address
(
address_id int not null auto_increment
,country varchar(40)
,locality varchar(255)
,longitude float
,postalCode varchar(255)
,address varchar(255)
,latitude float
,region varchar(255)
,primary key(address_id)
)

-- create fact table
truncate fact_table;
drop table fact_table;
create table fact_table
(
fact_id int not null auto_increment
,salary varchar(255)
,posted_at varchar(255)
,address_id int
,job_id int
,primary key (fact_id)
,foreign key (address_id) references address (address_id) on delete set null
,foreign key (job_id) references jobs (job_id) on delete set null
)
-- uploading jobs table

insert ignore into jobs (education, description, title, skills, experience, _id, company, employment_type)
SELECT DISTINCT education, description, title, skills, experience, _id, company, employment_type from temp_table
;

select * from jobs;

insert ignore into address (country, locality, longitude, postalCode, address, latitude, region)
SELECT DISTINCT country, locality, longitude, postalCode, address, latitude, region from temp_table
;

insert ignore into fact_table (salary, posted_at, address_id, job_id)
SELECT DISTINCT 
t.salary 
,t.posted_at 
,a.address_id 
,j.job_id
from temp_table t
join address a on a.country = t.country
join jobs j on j.employment_type = t.employment_type
;

