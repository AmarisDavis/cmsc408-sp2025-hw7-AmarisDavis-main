# my-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
SET FOREIGN_KEY_CHECKS=1;
commit;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
create table skills(
    id int,
    name VARCHAR(256),
    description varchar(4098),
    tag VARCHAR(256),
    url VARCHAR(1024),
    time_commitment varchar(38)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (id, name, description, tag, url, time_commitment) value
(1, 'cyber intrusion', 'bypassing digital security systems without detection', 'Skill 1', 'https://example.com/cyberintrusion', 'moderate'),
(2, 'metal crafting', 'shaping raw ores into tools, devices, and frameworks', 'Skill 2', 'https://example.com/metalcrafting', 'heavy'),
(3, 'bio synthesis', 'combining organic compounds to generate healing serums', 'Skill 3', 'https://example.com/biosynthesis', 'moderate'),
(4, 'trail reading', 'decoding subtle natural clues to trace movements', 'Skill 4', 'https://example.com/trailreading', 'light'),
(5, 'creature bonding', 'forming deep behavioral links with untamed beasts', 'Skill 5', 'https://example.com/creaturebonding', 'heavy'),
(6, 'wildcrafting', 'extracting useful materials and sustenance from the wild', 'Skill 6', 'https://example.com/wildcrafting', 'light'),
(7, 'arcane infusion', 'channeling mystical forces into everyday items', 'Skill 7', 'https://example.com/arcanefusion', 'moderate'),
(8, 'shadow blending', 'seamlessly merging with surroundings to avoid detection', 'Skill 8', 'https://example.com/shadowblending', 'light');



# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(256),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(512),
    people_linkedin_url varchar(1024),
    people_headshot_url varchar(1024),
    people_discord_handle varchar(100),
    people_brief_bio varchar(4000),
    people_date_joined datetime NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with 10 people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name, people_last_name, people_email, people_linkedin_url, people_headshot_url, people_brief_bio, people_date_joined) values 

(1, 'Lena', 'Person 1', 'lena@example.com', 'https://linkedin.com/in/lena', 'https://example.com/img11.jpg', 'Cloud architect exploring edge computing.', '2023-02-01'),
(2, 'Micah', 'Person 2', 'micah@example.com', 'https://linkedin.com/in/micah', 'https://example.com/img12.jpg', 'Security analyst with a love for crypto.', '2023-02-02'),
(3, 'Nina', 'Person 3', 'nina@example.com', 'https://linkedin.com/in/nina', 'https://example.com/img13.jpg', 'Front-end dev into microinteractions.', '2023-02-03'),
(4, 'Omar', 'Person 4', 'omar@example.com', 'https://linkedin.com/in/omar', 'https://example.com/img14.jpg', 'DevSecOps specialist & Kubernetes wizard.', '2023-02-04'),
(5, 'Pia', 'Person 5', 'pia@example.com', 'https://linkedin.com/in/pia', 'https://example.com/img15.jpg', 'Robotics engineer creating helpful bots.', '2023-02-05'),
(6, 'Quinn', 'Person 6', 'quinn@example.com', 'https://linkedin.com/in/quinn', 'https://example.com/img16.jpg', 'Game designer fascinated by procedural art.', '2023-02-06'),
(7, 'Ravi', 'Person 7', 'ravi@example.com', 'https://linkedin.com/in/ravi', 'https://example.com/img17.jpg', 'Systems programmer and math enthusiast.', '2023-02-07'),
(8, 'Sage', 'Person 8', 'sage@example.com', 'https://linkedin.com/in/sage', 'https://example.com/img18.jpg', 'Product manager into clean UX and research.', '2023-02-08'),
(9, 'Theo', 'Person 9', 'theo@example.com', 'https://linkedin.com/in/theo', 'https://example.com/img19.jpg', 'AI artist and data visualizer.', '2023-02-09'),
(10, 'Uma', 'Person 10', 'uma@example.com', 'https://linkedin.com/in/uma', 'https://example.com/img20.jpg', 'Quantum computing enthusiast and blogger.', '2023-02-10');

commit;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
create table peopleskills(
  id int auto_increment primary key,
  skills_id int NOT NULL,
  people_id int NOT NULL,
  date_acquired datetime NOT NULL,
  unique( people_id, skills_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

truncate peopleskills;
insert into peopleskills (people_id, skills_id, date_acquired) values
(1, 1, '2023-03-01'),
(1, 3, '2023-03-02'),
(1, 6, '2023-03-03'),

(2, 3, '2023-03-01'),
(2, 4, '2023-03-02'),
(2, 5, '2023-03-03'),

(3, 1, '2023-03-01'),
(3, 5, '2023-03-02'),

(5, 3, '2023-03-01'),
(5, 6, '2023-03-02'),

(6, 2, '2023-03-01'),
(6, 3, '2023-03-02'),
(6, 4, '2023-03-03'),

(7, 3, '2023-03-01'),
(7, 5, '2023-03-02'),
(7, 6, '2023-03-03'),

(8, 1, '2023-03-01'),
(8, 3, '2023-03-02'),
(8, 5, '2023-03-03'),
(8, 6, '2023-03-04'),

(9, 2, '2023-03-01'),
(9, 5, '2023-03-02'),
(9, 6, '2023-03-03'),

(10, 1, '2023-03-01'),
(10, 4, '2023-03-02'),
(10, 5, '2023-03-03');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

drop table if exists roles;
create table roles(
    role_id int primary key NOT NULL,
    role_name varchar(256),
    sort_priority int

);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

truncate roles;
insert into roles (role_id, role_name, sort_priority) values
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

drop table if exists peopleroles;
create table peopleroles(
    id int auto_increment primary key NOT NULL,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_acquired datetime NOT NULL,
    unique( people_id, role_id)

);



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

truncate peopleroles;
insert into peopleroles (people_id, role_id, date_acquired) values

(1, 2, '2023-03-01'),

(2, 5, '2023-03-01'),
(2, 6, '2023-03-01'),

(3, 2, '2023-03-01'),
(3, 4, '2023-03-01'),

(4, 3, '2023-03-01'),   

(5, 3, '2023-03-01'),   

(6, 2, '2023-03-01'),   
(6, 1, '2023-03-01'),   

(7, 1, '2023-03-01'),   

(8, 1, '2023-03-01'),   
(8, 4, '2023-03-01'),   

(9, 2, '2023-03-01'),   

(10, 2, '2023-03-01'),  
(10, 1, '2023-03-01');  

