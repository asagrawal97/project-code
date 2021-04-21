

USE books;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100),
    views INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE posts(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    body MEDIUMTEXT,
    views INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE answers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    body MEDIUMTEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    post_id INT NOT NULL,
    FOREIGN KEY(post_id) REFERENCES posts(id),
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE tags(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tagname VARCHAR(100) UNIQUE,
    descript MEDIUMTEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE posttag(
    post_id INT NOT NULL,
    FOREIGN KEY(post_id) REFERENCES posts(id),
    tag_id INT NOT NULL,
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY(post_id, tag_id)
);