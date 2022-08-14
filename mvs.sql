create database mvs;
use mvs;
create table student(
	s_id int primary key, f_name varchar(20), l_name varchar(20),
    street varchar(20), city varchar(20), pin_code int,
    nationality varchar(20), student_level varchar(10), dob date,
    email varchar(30),ph_no int, gender varchar(5), 
    special_needs varchar(20),comments varchar(20), status varchar(10),
    school varchar(25)
);


create table victoria_hall(
	hall_id int primary key, hall_name varchar(20), address varchar(50),
    ph_no int, manager varchar(20)
);

create table luxury_room(
	place_no int primary key, room_no int, rent int,
    hall_id int,
    foreign key (hall_id) references victoria_hall(hall_id) on delete cascade on update cascade    
);

create table dormitory (
	dorm_no int primary key,bed_no int,address varchar(20),num int
);

create table bed(
	bed_no int primary key, dorm_no int, place_no int, rent int,
    foreign key(dorm_no) references dormitory(dorm_no) on delete cascade on update cascade,
    foreign key(place_no) references luxury_room(place_no) on delete cascade on update cascade
);

alter table dormitory add foreign key (bed_no) references bed(bed_no);


create table invoice(
	invoice_id int, term int, due date, full_name varchar(25), s_id int, 
    place_no int, room_no int, address varchar(20), date_of_payment date,
    meth varchar(20), rem1 date, rem2 date,
    foreign key(s_id) references student(s_id) on delete cascade on update cascade,
    foreign key(place_no) references luxury_room(place_no) on delete cascade on update cascade
);

create table inspection(
	ins_id int, ins_name varchar(20), DOI date, soi varchar(5),place_no int,
    foreign key(place_no) references luxury_room(place_no) on delete cascade on update cascade
);











