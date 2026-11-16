create database Muztop
use Muztop

create table roles(
r_id int primary key identity(1,1) not null,
r_name nvarchar (15) not null
)

create table users(
u_id int primary key identity(1,1) not null,
r_id int foreign key (r_id) references roles(r_id) not null,
u_name nvarchar(30) not null,
u_surname nvarchar(30) not null,
u_pass nvarchar(18) not null,
u_username nvarchar(30) not null,
u_mail nvarchar(60) not null,
)


create table country(
c_id int primary key identity(1,1) not null,
c_name nvarchar(30) not null,
)

create table musicker(
m_id int primary key identity(1,1) not null,
u_id int foreign key (u_id) references users(u_id) not null,
m_listening int,
c_id int foreign key (c_id) references country(c_id) not null,
)


create table janre(
j_id int primary key identity(1,1) not null,
j_name nvarchar(30) not null,
)

create table mlabel(
l_id int primary key identity(1,1) not null,
l_name nvarchar(50) not null,
)

create table Song
(
s_id int primary key identity(1,1) not null,
m_id int foreign key (m_id) references musicker(m_id) not null,
s_name nvarchar,
s_long nvarchar (10),
l_id int foreign key (l_id) references mlabel(l_id) not null,
j_id int foreign key (j_id) references janre(j_id) not null,
s_how nvarchar(30)
)

create table album(
a_id int primary key identity(1,1) not null,
m_id int foreign key (m_id) references musicker(m_id) not null,
a_name nvarchar,
a_long nvarchar (10),
l_id int foreign key (l_id) references mlabel(l_id) not null,
j_id int foreign key (j_id) references janre(j_id) not null,
a_how nvarchar(30),
s_id int foreign key (s_id) references song(s_id) not null,
)

create table privat(
pr_id int primary key identity(1,1) not null,
pr_name nvarchar(50) not null,
)

create table playlist(
p_id int primary key identity(1,1) not null,
u_id int foreign key (u_id) references users(u_id) not null,
p_name nvarchar(max),
p_how nvarchar (30),
p_desc nvarchar(max),
s_id int foreign key (s_id) references song(s_id) not null,
pr_id int foreign key (pr_id) references privat(pr_id) not null,
)

create table ust(
ust_id int primary key identity(1,1) not null,
ust_name nvarchar(max),
ust_how nvarchar(30),
s_id int foreign key (s_id) references song(s_id) not null,
u_id int foreign key (u_id) references users(u_id) not null,
)

alter table song
alter column s_name nvarchar(max)