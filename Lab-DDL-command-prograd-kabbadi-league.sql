-- PROGRESSION - 1


-- 1. **Create table city**

CREATE TABLE CITY(
   ID NUMBER(11) PRIMARY KEY,
   NAME VARCHAR(50) NOT NULL
);

-- 2. **Create table referee**
CREATE TABLE REFEREE(
ID NUMBER(11) PRIMARY KEY,
   NAME VARCHAR(50) NOT NULL
);


-- 3. **Create table innings**
CREATE TABLE INNINGS(
  ID NUMBER(11) PRIMARY KEY,
  INNINGS_NUMBER NUMBER(11) NOT NULL
);

-- 4. **Create table extra_type**
CREATE TABLE EXTRA_TYPE(
  ID NUMBER(11) PRIMARY KEY,
   NAME VARCHAR(50) NOT NULL
);

-- 5. **Create table skill**
CREATE TABLE SKILL(
  ID NUMBER(11) PRIMARY KEY,
   NAME VARCHAR(50) NOT NULL
);

-- 6. **Create table team**
CREATE TABLE TEAM(
  ID NUMBER(11) PRIMARY KEY,
   NAME VARCHAR(50) NOT NULL,
   COACH VARCHAR(50) NOT NULL,
   HOME_CITY NUMBER(11) NOT NULL,
   CAPTAIN NUMBER(11) NOT NULL,
   FOREIGN KEY (HOME_CITY) REFERENCES CITY(ID)
);

-- 7. **Create table player**
CREATE TABLE PLAYER(
  ID NUMBER(11) PRIMARY KEY,
   NAME VARCHAR(50) NOT NULL,
   COUNTRY VARCHAR(50) NOT NULL,
   SKILL_ID NUMBER(11) NOT NULL,
   TEAM_ID NUMBER(11) NOT NULL,
   FOREIGN KEY (SKILL_ID) REFERENCES SKILL(ID),
   FOREIGN KEY (TEAM_ID) REFERENCES TEAM(ID)
);

-- 8. **Create table venue**
CREATE TABLE VENUE(
  ID NUMBER(11) PRIMARY KEY,
   STADIUM_NAME VARCHAR(50) NOT NULL,
   CITY_ID NUMBER(11) NOT NULL,
   FOREIGN KEY (CITY_ID) REFERENCES CITY(ID)
);

-- 9. **Create table event**
CREATE TABLE EVENT(
  ID NUMBER(11) PRIMARY KEY,
  INNINGS_ID NUMBER(11) NOT NULL,
  EVENT_NO NUMBER(11) NOT NULL,
  RAIDER_ID NUMBER(11) NOT NULL,
  RAID_POINTS NUMBER(11) NOT NULL,
  DEFENDING_POINTS NUMBER(11) NOT NULL,
  CLOCK_IN_SECONDS NUMBER(11) NOT NULL,
  TEAM_ONE_SCORE NUMBER(11) NOT NULL,
  TEAM_TWO_SCORE NUMBER(11) NOT NULL,
  FOREIGN KEY (INNINGS_ID) REFERENCES INNINGS(ID),
  FOREIGN KEY (RAIDER_ID) REFERENCES PLAYER(ID)
);

-- 10. **Create table extra_event**
CREATE TABLE EXTRA_EVENT(
  ID NUMBER(11) PRIMARY KEY,
  EVENT_ID NUMBER(11) NOT NULL,
  EXTRA_TYPE_ID NUMBER(11) NOT NULL,
  POINTS NUMBER(11) NOT NULL,
  SCORING_TEAM_ID NUMBER(11) NOT NULL,
  FOREIGN KEY (EVENT_ID) REFERENCES EVENT(ID),
  FOREIGN KEY (EXTRA_TYPE_ID) REFERENCES EXTRA_TYPE(ID),
  FOREIGN KEY (SCORING_TEAM_ID) REFERENCES TEAM(ID)
);

-- 11. **Create table outcome**
CREATE TABLE OUTCOME(
  ID NUMBER(11) PRIMARY KEY,
  STATUS VARCHAR(50) NOT NULL,
  WINNER_TEAM_ID NUMBER(11),
  SCORE NUMBER(11),
  PLAYER_OF_MATCH NUMBER(11),
  FOREIGN KEY (WINNER_TEAM_ID) REFERENCES TEAM(ID),
  FOREIGN KEY (PLAYER_OF_MATCH) REFERENCES PLAYER(ID)
);

-- 12. **Create table game**
CREATE TABLE GAME(
  ID NUMBER(11) PRIMARY KEY,
  GAME_DATE DATE NOT NULL,
  TEAM_ID_1 NUMBER(11) NOT NULL,
  TEAM_ID_2 NUMBER(11) NOT NULL,
  VENUE_ID NUMBER(11) NOT NULL,
  OUTCOME_ID NUMBER(11) NOT NULL,
  REFEREE_ID_1 NUMBER(11) NOT NULL,
  REFEREE_ID_2 NUMBER(11) NOT NULL,
  FIRST_INNINGS_ID NUMBER(11) NOT NULL,
  SECOND_INNINGS_ID NUMBER(11) NOT NULL,
  FOREIGN KEY (TEAM_ID_1) REFERENCES TEAM(ID),
  FOREIGN KEY (TEAM_ID_2) REFERENCES TEAM(ID),
  FOREIGN KEY (VENUE_ID) REFERENCES VENUE(ID),
  FOREIGN KEY (OUTCOME_ID) REFERENCES OUTCOME(ID),
  FOREIGN KEY (REFEREE_ID_1) REFERENCES REFEREE(ID),
  FOREIGN KEY (REFEREE_ID_2) REFERENCES REFEREE(ID),
  FOREIGN KEY (FIRST_INNINGS_ID) REFERENCES INNINGS(ID),
  FOREIGN KEY (SECOND_INNINGS_ID) REFERENCES INNINGS(ID)
);

-- 13. **Drop table city**
    DROP TABLE CITY CASCADE CONSTRAINTS;

-- 14. **Drop table innings**
    DROP TABLE INNINGS CASCADE CONSTRAINTS;
    
-- 15. **Drop table skill**
    DROP TABLE Skill CASCADE CONSTRAINTS;
    
-- 16. **Drop table extra_type**
    DROP TABLE extra_type CASCADE CONSTRAINTS;