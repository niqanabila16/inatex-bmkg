-- 1) Create & use your new database
CREATE DATABASE IF NOT EXISTS inatex_new_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;
USE inatex_new_db;

-- 2) Lookup/reference tables first

-- Roles
CREATE TABLE roles (
  role_id   INT            AUTO_INCREMENT PRIMARY KEY,
  name      ENUM(
               'GeneralUser',
               'GovernmentUser',
               'Instructor',
               'Admin'
             )         NOT NULL
) ENGINE=InnoDB;

-- Regions
CREATE TABLE regions (
  region_id INT            AUTO_INCREMENT PRIMARY KEY,
  name      VARCHAR(100)   NOT NULL
) ENGINE=InnoDB;

-- 3) Core user table
CREATE TABLE users (
  user_id                          INT            AUTO_INCREMENT PRIMARY KEY,
  first_name                       VARCHAR(100)   NOT NULL,
  last_name                        VARCHAR(100)   NOT NULL,
  username                         VARCHAR(50)    NOT NULL,
  email                            VARCHAR(200)   NOT NULL,
  password                         VARCHAR(255)   NOT NULL,
  role_id                          INT            NOT NULL,
  is_verified                      BOOLEAN        NOT NULL DEFAULT FALSE,
  verification_token               VARCHAR(100),
  verification_token_expires_at    DATETIME,
  reset_password_token             VARCHAR(100),
  reset_token_expires_at           DATETIME,
  created_at                       DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at                       DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  region_id                        INT,
  FOREIGN KEY (role_id)   REFERENCES roles   (role_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (region_id) REFERENCES regions (region_id)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

-- 4) Courses + related
CREATE TABLE courses (
  course_id        INT            AUTO_INCREMENT PRIMARY KEY,
  title            VARCHAR(255)   NOT NULL,
  short_description VARCHAR(500),
  long_description TEXT,
  outcomes         TEXT,
  language         VARCHAR(50),
  requirements     TEXT,
  date_added       DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_modified    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  creator_id       INT            NOT NULL,
  type_course      ENUM(
                     'general',
                     'spesific',
                     'government_spesific'
                   )              NOT NULL DEFAULT 'general',
  price            DECIMAL(8,2)   NOT NULL DEFAULT 0.00,
  region_id        INT,
  FOREIGN KEY (creator_id) REFERENCES users   (user_id)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (region_id)  REFERENCES regions (region_id)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

-- Sections (belongs to courses)
CREATE TABLE sections (
  section_id INT          AUTO_INCREMENT PRIMARY KEY,
  course_id  INT          NOT NULL,
  title      VARCHAR(255) NOT NULL,
  position   INT          NOT NULL DEFAULT 0,
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Lessons (belongs to sections)
CREATE TABLE lessons (
  lesson_id    INT               AUTO_INCREMENT PRIMARY KEY,
  section_id   INT               NOT NULL,
  title        VARCHAR(255)      NOT NULL,
  content_type ENUM('video','quiz','article') NOT NULL DEFAULT 'video',
  content_url  VARCHAR(500),
  position     INT               NOT NULL DEFAULT 0,
  FOREIGN KEY (section_id) REFERENCES sections (section_id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Quizzes (one per lesson)
CREATE TABLE quizzes (
  quiz_id    INT                  AUTO_INCREMENT PRIMARY KEY,
  lesson_id  INT                  NOT NULL,
  quiz_type  ENUM('pre','post')   NOT NULL DEFAULT 'pre',
  title      VARCHAR(255),
  FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Questions (belongs to quizzes)
CREATE TABLE questions (
  question_id    INT            AUTO_INCREMENT PRIMARY KEY,
  quiz_id        INT            NOT NULL,
  text           TEXT           NOT NULL,
  choices        VARCHAR(255),
  correct_answer VARCHAR(5),
  FOREIGN KEY (quiz_id) REFERENCES quizzes (quiz_id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Enrollments (users ↔ courses pivot with extra fields)
CREATE TABLE enrollments (
  enrollment_id INT            AUTO_INCREMENT PRIMARY KEY,
  user_id       INT            NOT NULL,
  course_id     INT            NOT NULL,
  date_enrolled DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  progress      DECIMAL(5,2)   NOT NULL DEFAULT 0.00,
  completed_at  DATETIME,
  FOREIGN KEY (user_id)   REFERENCES users   (user_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Socialization events (added by users)
CREATE TABLE socialization_events (
  event_id           INT            AUTO_INCREMENT PRIMARY KEY,
  added_by           INT            NOT NULL,
  location           VARCHAR(255),
  date               DATE,
  total_participants INT,
  file_link          VARCHAR(500),
  created_at         DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (added_by) REFERENCES users (user_id)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

