-- Create a small script to enter 3 real pieces of data
USE cars_overflow;

INSERT INTO users(username, password)
VALUES
("akshita", "akshita"),
("malik", "malik"),
("nikhil", "nikhil"),
("vedant", "vedant"),
("wardha", "wardha");

INSERT INTO posts(title, body, user_id) VALUES ("What's the difference between torque and horsepower?", "I've heard a lot of people mention the torque and horsepower when it comes to their. What are they? How are they different?", 1);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("mechanics", "Use this tag when you have a question about the mechanics of a car");
SET @v2 := (SELECT id FROM tags WHERE tagname="mechanics");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("What's the point of drifting?", "A lot of racing movies mention drifting. How is it useful to racers?", 2);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("racing", "Use this tag when you have a need for speed");
SET @v2 := (SELECT id FROM tags WHERE tagname="racing");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("Do I really need the more expensive gas?", "I'm sure everyone has noticed that gas stations offer at least two different types of gas. What's the difference? Should I be using the more expensive one?", 3);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("gas", "Use this tag when you have a question about energy requirements");
SET @v2 := (SELECT id FROM tags WHERE tagname="gas");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("Can an engine run in reverse?", "Basically as the title says. Can an ICE run in reverse?", 4);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("mechanics", "Use this tag when you have a question about the mechanics of a car");
SET @v2 := (SELECT id FROM tags WHERE tagname="mechanics");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("What's the difference between a diesel and a gas engine?", "I'm looking to buy a car. I'm not sure whether I should go for a diesel or a gas engine. What's the difference? How different is the maintenance for each?", 5);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("general", "Use this tag when you have a question about the mechanics of a car");
SET @v2 := (SELECT id FROM tags WHERE tagname="general");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO answers(body, user_id, post_id)
VALUES
("In a gas engine, the fuel is mixed with air, compressed and then lit by sparks from the spark plugs. A diesel engine, on the other hand, compresses the air first, after which the air is sprinkled with fuel", 1, 5),
("You can't reverse a four-stroke engine, but a two-stroke engine can be run in reverse", 2, 4),
("You should use whatever the manufacturer suggests as the optimal octane-gas for your car.", 4, 3);