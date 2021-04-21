-- Create a small script to enter 3 real pieces of data
USE books;

INSERT INTO users(username, password)
VALUES
("akshita", "akshita"),
("malik", "malik"),
("nikhil", "nikhil"),
("vedant", "vedant"),
("wardha", "wardha");

INSERT INTO posts(title, body, user_id) VALUES ("How are the Robert Langdon books?", "I recently watched Da Vinci Code and I'm interested in reading the books too. How are they? Are they better than the movies?", 1);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("question", "Use this tag when you have a question about a book");
SET @v2 := (SELECT id FROM tags WHERE tagname="question");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("Why do people hate YA novels so much?", "I've seen a lot of people bash YA novels, saying they're all the same or boring. I just read the Throne of Glass series and I loved them. Why the hate on YA novels?", 2);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("discussion", "Use this tag when you want to discuss a topic related to books");
SET @v2 := (SELECT id FROM tags WHERE tagname="discussion");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("Looking for Urban Fantasy novels", "I just finished the Mercy Thompson series by Patricia Briggs. I'm looking for similar books in the same genre.", 3);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("recommendation", "Use this tag when you want recommendations on what to read");
SET @v2 := (SELECT id FROM tags WHERE tagname="recommendation");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("Are Melody Anne books age-appropriate for 15 y/o?", "Basically as the title says. I have a 15 y/o who's recently started reading books. She really likes romance novels and I've heard Melody Anne is pretty popular. Should I allow it?", 4);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("question", "Use this tag when you have a question about a book");
SET @v2 := (SELECT id FROM tags WHERE tagname="question");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO posts(title, body, user_id) VALUES ("What do you guys think of Jodi Taylor's time travel series?", "After reading The Chronicles of St. Mary's books, I'm a little conflicted about how I feel. In my opinion, they're kinda silly, but entertaining. What do you guys think?", 5);
SET @v1 := (SELECT LAST_INSERT_ID());
INSERT IGNORE INTO tags(tagname, descript) VALUES ("discussion", "Use this tag when you want to discuss a topic related to books");
SET @v2 := (SELECT id FROM tags WHERE tagname="discussion");
INSERT INTO posttag(post_id, tag_id) VALUES(@v1, @v2);

INSERT INTO answers(body, user_id, post_id)
VALUES
("These books are definitely silly, I agree. But I'm enjoying a psuedo-sci-fi novel that isn't too tech-heavy and is relatively easy to follow.", 1, 5),
("You should check out the Kate Daniels series by Ilona Andrews. They're pretty similar I'd say.", 2, 3),
("The Robert Langdon books are amazing! The movies do no justice to them. You should definitely read them!", 4, 1);