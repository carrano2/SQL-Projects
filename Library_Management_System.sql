#PLEASE NOTE- the data entry mistakes I make in this example are intentional and serve to showcase my ability to correct them

create table Book_Data
(id int not null auto_increment,
Book_name varchar(255) not null,
Publisher varchar(255) not null,
Author_name varchar(255) not null,
Genre varchar(255) not null,
Primary Key (id)
);

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values ('Rainbow Six', 'Penguin Publishing Group', 'Tom Clancy', 'Adventure Fiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('Jurassic Park', 'Alfred A. Knopf', 'Michael Crichton', 'Adventure Fiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('The Fault in Our Stars', 'Dutton Books', 'John Green', 'Romance Novel');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('Gods and Generals', 'Ballantine Books', 'Jeff Shaara', 'Historical Fiction');

select *
from Book_data;

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('The Pillars of the Earth', 'Macmillan', 'Ken Follett', 'Historical Fiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('Greenlights', 'Crown Publishing Group', 'Matthew McConaughey', 'Nonfiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('Atomic Habits', 'Penguin Random House', 'James Clear', 'Self-help');

select*
from book_data;

#there are two separate entries for Ken Follets 'The Pillars of the Earth'. I now correct this using an update clause.

update book_data
set Book_name = 'Atlas of the Heart', Publisher = 'Random House', Author_name = 'Brene Brown', Genre = 'Self-help'
where id = 6;

select*
from book_data;

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('The Paris Apartment', 'HarperCollins Publishers', 'Lucy Foley', 'Historical Fiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('Verity', 'Grand Central Publishing', 'Colleen Hoover', 'Thriller Fiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('The Body Keeps The Score', 'Penguin Publishing Group', 'Bessel van der Kolk', 'Nonfiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values('The Splendid and the Vile', 'Crown Publishing Group', 'Erik Larson', 'Nonfiction');

insert into Book_Data (Book_Name, Publisher, Author_name, Genre)
values ('Braiding Sweetgrass', 'Milkweed Editions', 'Robin Wall Kimmerer', 'Nonfiction');


#I am now creating a second table regarding library members and the books they have taken out from the library

create table Library_Members
(Member_name varchar(255) not null,
Book_loaned varchar(255) not null,
Book_id_number int not null,
Day_taken_out DATE,
Day_returned DATE,
primary key (Book_id_number)
);

insert into Library_Members (Member_name, book_loaned, book_id_number, Day_taken_out, Day_returned)
values('John_Smith', 'Jurassic Park', '2', '2022-02-15', '2022-02-21');

select*
from library_members;

insert into Library_Members (Member_name, book_loaned, book_id_number, Day_taken_out, Day_returned)
values('Peggie Lee', 'Greenlights', '7', '2022-01-12', '2022-01-19');

insert into Library_Members (Member_name, book_loaned, book_id_number, Day_taken_out)
values('Corey Williams', 'Gods and Generals', '4', '2022-2-09');

select*
from library_members;

 insert into Library_Members (Member_name, book_loaned, book_id_number, Day_taken_out, Day_returned)
 values('Stephen Jones', 'Rainbox Six', '1', '2022-01-05', '2022-01-12');
 
 insert into Library_Members (Member_name, book_loaned, book_id_number, Day_taken_out)
 values('Marge Brown', 'The Body Keeps The Score', '11', '2022-01-03');
 
 
 select*
 from library_members;
 
 #I will now join both tables in order to see which library members have taken out books, what book they have taken out, and the dates they have returned the book (if they have returned them)
 
 select id, Book_name, Genre, Member_name, Day_taken_out, Day_returned
 from book_data
 right join library_members
 on book_data.id = library_members.Book_id_number;
 
 #what is distinct about this example is that there is no "foreign key"
 
 select* 
 from book_data;
 
 select*
 from library_members;
 
 select count(*)
 from library_members
 where Member_name = ('Stephen Jones');
 
 #I will now add further columns to the library_members database and fill in their requisite data
 
 select*
 from library_members;
 
 alter table library_members
add  Address varchar(255);

 alter table library_members
add  email_address varchar(255);

 alter table library_members
add  phone_number varchar(255);

select*
from library_members;

update library_members
set address = '165 Wearham Way, Anytown',
email_address = 'SJones@email.com',
phone_number = '464=389-2795'
where Member_name = 'Stephen Jones';

select*
from library_members;

#I will now correct my mistake of adding a '=' after the area code of a members phone number as opposed to a '-'

update library_members
set phone_number ='464-389-2795'
where member_name = 'Stephen Jones';

select*
from library_members;

update library_members
set Address = '222 Main Street, Anywhere',
email_address = 'JSmith456@email.com',
phone_number = '464-457-2078'
where Member_name = 'John_Smith';

#I will now change John_Smith to John Smith

update library_members
set Member_name = 'John Smith'
where Member_name = 'John_Smith';

select*
from library_members;

update library_members
set Address = '464 Bronson Drive, Anywhere',
email_address = 'CWil@gmail.com',
phone_number = '464-643-3906'
where Member_name = 'Corey Williams';

select*
from library_members;

update library_members
set Address = '4567 Algin Road, Anytown',
email_address = 'PeggieLee@yahoo.com',
phone_number = '464-305-4037'
where Member_name = 'Peggie Lee';

update library_members
set Address = '165 South Street, Anytown',
email_address = 'MBrown@hotmail.com',
phone_number = '464-357-4051'
where Member_name = 'Marge Brown';



#I will use a right join and a subquery to list Adventure Fiction books that were taken out in the first month of 2022 and who took them out

select *
from(
select b.id, b.Book_name, b.Genre, l.Member_name, l.Day_taken_out
from book_data as b
right join library_members as l
on b.id = l.Book_id_number) as sub
where Genre = 'Adventure Fiction' and Day_taken_out like '2022-01%';


