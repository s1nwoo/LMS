CREATE TABLE `student` (
	`sIdx`	INT(5)	NOT NULL	COMMENT '00001',
	`pw`	VARCHAR(20)	NOT NULL	COMMENT '1q2w3e4r',
	`name`	VARCHAR(10)	NOT NULL	COMMENT '손흥민',
	`tel`	VARCHAR(20)	NOT NULL	COMMENT '010-xxxx-xxxx',
	`email`	VARCHAR(30)	NULL	COMMENT 'son@gmail.com',
	`major`	VARCHAR(20)	NOT NULL	COMMENT '컴퓨터공학과',
	`grade`	INT(1)	NOT NULL	COMMENT '4'
);

CREATE TABLE `teacher` (
	`tIdx`	INT(5)	NOT NULL	COMMENT '00001',
	`pw`	VARCHAR(20)	NOT NULL	COMMENT '4r3e2w1q',
	`name`	VARCHAR(10)	NOT NULL	COMMENT '포체티노',
	`tel`	VARCHAR(20)	NOT NULL	COMMENT '010-xxxx-xxxx',
	`email`	VARCHAR(30)	NULL	COMMENT 'for@gmail.com',
	`major`	VARCHAR(20)	NOT NULL	COMMENT '컴퓨터공학과',
	`job`	VARCHAR(10)	NOT NULL	COMMENT '정교수'
);

CREATE TABLE `myClass` (
	`sIdx`	INT(5)	NOT NULL,
	`cIdx`	INT(5)	NOT NULL
);

CREATE TABLE `admin` (
	`id`	VARCHAR(20)	NOT NULL	COMMENT 'admin',
	`pw`	VARCHAR(20)	NOT NULL	COMMENT 'admin'
);

CREATE TABLE `signUp` (
	`tIdx`	INT(5)	NOT NULL,
	`cIdx`	INT(5)	NOT NULL
);

CREATE TABLE `class` (
	`cIdx`	INT(5)	NOT NULL	COMMENT '00001',
	`name`	VARCHAR(20)	NOT NULL	COMMENT '선택과 집중',
	`teacher`	VARCHAR(10)	NOT NULL	COMMENT '포체티노',
	`content`	VARCHAR(200)	NOT NULL	COMMENT '패스할까 슛할까',
	`book`	VARCHAR(20)	NULL	COMMENT 'NULL',
	`place`	VARCHAR(10)	NOT NULL	COMMENT '대운동장',
	`grade`	INT(1)	NULL	COMMENT '4',
	`category`	VARCHAR(10)	NOT NULL	COMMENT '전공',
	`startDate`	DATE	NOT NULL	COMMENT '2020-07-20',
	`endDate`	DATE	NOT NULL	COMMENT '2020-09-20',
	`day`	VARCHAR(10)	NOT NULL	COMMENT '월',
	`startTime`	TIMESTAMP	NOT NULL	COMMENT '09:00',
	`endTime`	TIMESTAMP	NOT NULL	COMMENT '12:00',
	`totalPer`	INT(2)	NOT NULL	COMMENT '30',
	`applyPer`	INT(2)	NULL	COMMENT 'NULL',
	`tIdx`	INT(5)	NOT NULL
);

ALTER TABLE `student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
	`sIdx`
);

ALTER TABLE `teacher` ADD CONSTRAINT `PK_TEACHER` PRIMARY KEY (
	`tIdx`
);

ALTER TABLE `myClass` ADD CONSTRAINT `PK_MYCLASS` PRIMARY KEY (
	`sIdx`,
	`cIdx`
);

ALTER TABLE `admin` ADD CONSTRAINT `PK_ADMIN` PRIMARY KEY (
	`id`
);

ALTER TABLE `signUp` ADD CONSTRAINT `PK_SIGNUP` PRIMARY KEY (
	`tIdx`,
	`cIdx`
);

ALTER TABLE `class` ADD CONSTRAINT `PK_CLASS` PRIMARY KEY (
	`cIdx`
);

ALTER TABLE `myClass` ADD CONSTRAINT `FK_student_TO_myClass_1` FOREIGN KEY (
	`sIdx`
)
REFERENCES `student` (
	`sIdx`
);

ALTER TABLE `myClass` ADD CONSTRAINT `FK_class_TO_myClass_1` FOREIGN KEY (
	`cIdx`
)
REFERENCES `class` (
	`cIdx`
);

ALTER TABLE `signUp` ADD CONSTRAINT `FK_teacher_TO_signUp_1` FOREIGN KEY (
	`tIdx`
)
REFERENCES `teacher` (
	`tIdx`
);

ALTER TABLE `signUp` ADD CONSTRAINT `FK_class_TO_signUp_1` FOREIGN KEY (
	`cIdx`
)
REFERENCES `class` (
	`cIdx`
);
