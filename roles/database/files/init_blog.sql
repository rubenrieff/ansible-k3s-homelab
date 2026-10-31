-- 1. Database en Gebruiker aanmaken
CREATE DATABASE IF NOT EXISTS ict_blog;
CREATE USER IF NOT EXISTS 'blog_user'@'%' IDENTIFIED BY 'K3sBlogApp2026!';
GRANT ALL PRIVILEGES ON ict_blog.* TO 'blog_user'@'%';
FLUSH PRIVILEGES;

USE ict_blog;

-- 2. Tabel voor de drop-down menu thema's
CREATE TABLE IF NOT EXISTS themes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Tabel voor de blog posts
CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    theme_id INT,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (theme_id) REFERENCES themes(id)
);

-- 4. Standaard thema's inladen (IGNORE zorgt dat hij ze niet dubbel toevoegt bij een 2e run)
INSERT IGNORE INTO themes (id, name) VALUES (1, 'Cloud & Infrastructure');
INSERT IGNORE INTO themes (id, name) VALUES (2, 'Netwerk Security');
INSERT IGNORE INTO themes (id, name) VALUES (3, 'Ansible Automation');
INSERT IGNORE INTO themes (id, name) VALUES (4, 'Linux & Open Source');