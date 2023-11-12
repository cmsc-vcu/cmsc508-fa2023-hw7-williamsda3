# hw7-ddl.sql

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
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
  skills_id INT AUTO_INCREMENT PRIMARY KEY,
  skills_name VARCHAR(255) NOT NULL,
  skills_description VARCHAR(255) NOT NULL DEFAULT'(default description)',
  skills_tag VARCHAR(255) NOT NULL,
  skills_url VARCHAR(255) DEFAULT NULL,
  time_commitment VARCHAR(255) DEFAULT NULL
);


SHOW TABLES;

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_tag)
VALUES
    (1, "rock climbing", "Skill 1"),
    (2, "break dancing", "Skill 2"),
    (3, "cooking", "Skill 3"),
    (4, "singing", "Skill 4"),
    (5, "python coding", "Skill 5"),
    (6, "public speaking", "Skill 6"),
    (7, "piano", "Skill 7"),
    (8, "gaming", "Skill 8");

SELECT * FROM skills;


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
  people_id INT AUTO_INCREMENT PRIMARY KEY,
  people_first_name VARCHAR(255) DEFAULT NULL,
  people_last_name VARCHAR(255) NOT NULL,
  people_email VARCHAR(255) DEFAULT NULL,
  people_linkedin_url VARCHAR(255) DEFAULT NULL,
  people_headshot_url VARCHAR(255) DEFAULT NULL,
  people_discord_handle VARCHAR(255) DEFAULT NULL,
  people_brief_bio TEXT DEFAULT NULL,
  people_date_joined DATE NOT NULL DEFAULT(current_date)
);


# Section 5
# Populate people with 10 people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id,people_last_name)
VALUES
  (1, 'Person 1'),
  (2,'Person 2'),
  (3,'Person 3'),
  (4, 'Person 4'),
  (5, 'Person 5'),
  (6,'Person 6'),
  (7,'Person 7'),
  (8, 'Person 8'),
  (9, 'Person 9'),
  (10,'Person 10');

SELECT * FROM people;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
  peopleskills_id INT AUTO_INCREMENT PRIMARY KEY,
  skills_id INT NOT NULL,
  people_id INT NOT NULL,
  peopleskills_date_acquired DATE NOT NULL DEFAULT(current_date),
  FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
  FOREIGN KEY (people_id) REFERENCES people(people_id),
  UNIQUE (skills_id, people_id)
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

INSERT INTO peopleskills (skills_id, people_id) VALUES
  (1, 1),
  (3, 1),
  (6, 1),
  
  (3, 2),
  (4, 2),
  (5, 2),
  
  (1, 3),
  (5, 3),

  (3, 5),
  (6, 5),
  
  (2, 6),
  (3, 6),
  (4, 6),
  
  (3, 7),
  (5, 7),
  (6, 7),
  
  (1, 8),
  (3, 8),
  (5, 8),
  (6, 8),
  
  (2, 9),
  (5, 9),
  (6, 9),
  
  (1, 10),
  (4, 10),
  (5, 10);

 SELECT * FROM peopleskills;


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
  roles_id INT AUTO_INCREMENT PRIMARY KEY,
  roles_name VARCHAR(255) NOT NULL,
  roles_sort_priority INT NOT NULL
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_name, roles_sort_priority) VALUES
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40),
('Boss', 50),
('Mentor', 60);

SELECT * FROM roles;



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
  people_roles_id INT AUTO_INCREMENT PRIMARY KEY,
  people_id INT NOT NULL,
  role_id INT NOT NULL,
  date_assigned DATE NOT NULL DEFAULT(current_date),
  FOREIGN KEY (people_id) REFERENCES people(people_id),
  FOREIGN KEY (role_id) REFERENCES roles(roles_id)
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

INSERT INTO peopleroles (people_roles_id,people_id, role_id) VALUES
(1,1, 2),
(2,2, 5),
(3,2, 6),
(4,3, 2),
(5,3, 4),
(6,4, 3),
(7,5, 3),
(8,6, 2),
(9,6, 1),
(10,7, 1),
(11,8, 1),
(12,8, 4),
(13,9, 2),
(14,10, 2),
(15,10, 1);

SELECT * FROM peopleroles;
