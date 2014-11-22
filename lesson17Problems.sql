-- Create a new table to store details about a meeting
-- Columns should include a unique id number (int(20)), the name of the meeting (varchar(25)), the time (time) and the date of the meeting (date)
/*create table meeting_info (
unique_id_number int(20) unique primary key,
meeting_name varchar(25),
meeting_time time,
meeting_date date
);

show tables;
describe meeting_info;*/

-- Create a new table called staff_meeting to hold information about whether staff attended a specific meeting
-- Columns should include the staff_number (int), and the id of the meeting that they attended (int(10))
/*create table staff_meeting (
	staff_number int,
    unique_id_number int(10)
);

show tables;
describe staff_meeting;*/

-- Change the name of the first table to meeting
/*alter table meeting_info rename meeting_details;
show tables;*/

-- Change the type of the meeting ID in the second table to match the first table
/*alter table staff_meeting change unique_id_number unique_id_number int(20);
describe staff_meeting;*/

-- Populate the first table for 3 meetings
/*insert into meeting_details (unique_id_number, meeting_name) values
(1, 'test'),
(2, 'test1'),
(3, 'another test');
select * from meeting_details;*/

-- Remove all of the data from the first table, leaving the table itself intact
/*truncate table meeting_details;
select * from meeting_details;*/

-- Delete both tables
/* drop table meeting_details;
drop table staff_meeting;
show tables; */
