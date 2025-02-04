create database if not exists shopping  character set utf8 collate utf8_general_ci;

use shopping;

drop table if exists user_detail;
drop table if exists user_main;
drop table if exists products;

create table if not exists user_main(
	id int not null,
	name varchar(30) not null,
	email varchar(50) not null,
	nick_name varchar(30) not null,
	user_id varchar(32) not null,
	primary key(id),
	unique(name),
	unique(email)
);

create table if not exists user_detail(
	id int not null,
	password varchar(20) not null,
	phone_number varchar(20) not null,
	sex int not null,
	birthday varchar(20) not null,
	post_number varchar(10) not null,
	address varchar(50) not null,
	register_time varchar(20) not null,
	primary key(id),
	foreign key(id) references user_main(id)
);


create table if not exists products(
	id int not null,
	name varchar(50) not null,
	description varchar(1000) not null,
	key_word varchar(1000) not null,
	price int not null,
	counts int not null,
	type int not null,
	user_id varchar(32) not null,
	primary key(id),
	unique(name)
);