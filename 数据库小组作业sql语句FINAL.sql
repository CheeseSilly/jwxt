
 --管理员表
 CREATE TABLE USER_ADMIN(
  User_admin_Id CHAR(10),
  User_admin_name VARCHAR2(30) NOT NULL,
  User_admin_passwordHash VARCHAR2(255) NOT NULL,
  User_admin_number CHAR(11) NOT NULL,
  CONSTRAINT PK_User_admin PRIMARY KEY (User_admin_Id)
  );
INSERT INTO USER_ADMIN (User_admin_Id, User_admin_NAME, User_admin_PASSWORDHASH,User_admin_NUMBER) VALUES ('0000000001', 'DRAGON', 'DRAGON651','13898765432');
INSERT INTO USER_ADMIN (User_admin_Id, User_admin_NAME, User_admin_PASSWORDHASH,User_admin_NUMBER) VALUES ('0000000002', 'DRAGON2', 'DRAGON2651','13798765432');

--每年论文数限制表
 CREATE TABLE TOPICLIMITS(
  TopicLimits_Years NUMBER(4),
  TopicLimits_Max NUMBER(4)
  );

INSERT INTO TOPICLIMITS(TopicLimits_Years, TopicLimits_Max) VALUES (2024, 500);
INSERT INTO TOPICLIMITS(TopicLimits_Years, TopicLimits_Max) VALUES (2022, 700);

--系表
 CREATE TABLE DEPARMENT(
  DEPARMENT_ID CHAR(30),
  DEPARMENT_NAME VARCHAR2(30) NOT NULL,
  CONSTRAINT PK_DEPT  PRIMARY KEY (DEPARMENT_ID)
  );

INSERT INTO DEPARMENT (DEPARMENT_ID, DEPARMENT_NAME) VALUES ( '2', '软件工程系');
INSERT INTO DEPARMENT (DEPARMENT_ID, DEPARMENT_NAME) VALUES ( '1', '计算机科学系');

--教师信息表
CREATE TABLE Teacher(
  Teacher_id CHAR(10),
  Teacher_name VARCHAR2(30) NOT NULL,
  Teacher_sex VARCHAR2(3),
  Teacher_title VARCHAR2(30),
  Teacher_department_id CHAR(30),
  Teacher_research VARCHAR2(255),
  Teacher_number CHAR(11) NOT NULL,
  Teacher_email VARCHAR2(30) NOT NULL,
  Teacher_leadership_id CHAR(10),
  Teacher_gradnumber NUMBER(3),
  CONSTRAINT PK_Teacher_sex CHECK(Teacher_sex in ('男','女')),
  CONSTRAINT PK_Teacher_title CHECK(Teacher_title IN('教授'，'副教授'，'讲师','助教')),
  CONSTRAINT PK_Teacher_id PRIMARY KEY (Teacher_id),
  CONSTRAINT FK_Teacher_department_id FOREIGN KEY (Teacher_department_id) REFERENCES DEPARMENT(DEPARMENT_ID)
 );
INSERT INTO Teacher (Teacher_id, Teacher_name,Teacher_sex,Teacher_title,Teacher_department_id,Teacher_research,Teacher_number,Teacher_email,Teacher_leadership_id,Teacher_gradnumber) VALUES ('1000000001','teacher1','女','教授','2','软件工程'，'13712345678','369258147@qq.com','2100000001','1');
INSERT INTO Teacher (Teacher_id, Teacher_name,Teacher_sex,Teacher_title,Teacher_department_id,Teacher_research,Teacher_number,Teacher_email,Teacher_leadership_id,Teacher_gradnumber) VALUES ('1000000002','teacher2','男','教授','2','软件工程'，'13812345678','369258147@163.com','2100000001','2');

--教师账号表
CREATE TABLE USER_TEACHER(
  User_teacher_id CHAR(10),
  User_teacher_passwordHash VARCHAR(255) NOT NULL,
  CONSTRAINT PK_User_teacher_id PRIMARY KEY(User_teacher_id),
  CONSTRAINT FK_User_teacher_id FOREIGN KEY (User_teacher_id) REFERENCES Teacher(Teacher_id)
  );
INSERT INTO USER_TEACHER(User_teacher_id,User_teacher_passwordHash) VALUES ('1000000001','123456');
INSERT INTO USER_TEACHER(User_teacher_id,User_teacher_passwordHash) VALUES ('1000000002','123456');

--毕业设计信息表
CREATE TABLE Graduation(
  Graduation_id CHAR(10),
  Graduation_topic VARCHAR2(255) NOT NULL,
  Graduation_Teacher_id CHAR(10),
  Graduation_kind VARCHAR2(255) NOT NULL,
  Graduation_introduction VARCHAR2(255) NOT NULL,
  Graduation_task VARCHAR2(255) NOT NULL,
  Graduation_content VARCHAR2(255),
  Graduation_demand VARCHAR2(255),
  Graduation_information VARCHAR2(255),
  Graduation_expert VARCHAR2(255),
  Graduatlon_subdate DATE,
  Graduation_state VARCHAR2(10),
  Graduation_appdate DATE,
  Graduation_recomment VARCHAR2(255),
  CONSTRAINT PK_Graduation_id PRIMARY KEY (Graduation_id),
  CONSTRAINT FK_Graduation_Teacher_id FOREIGN KEY (Graduation_Teacher_id) REFERENCES Teacher(Teacher_id)
 );
INSERT INTO Graduation(Graduation_id,Graduation_topic,Graduation_Teacher_id,Graduation_kind,Graduation_introduction,Graduation_task,Graduation_content ,Graduation_demand,Graduation_information,Graduation_expert,Graduatlon_subdate,Graduation_state,Graduation_appdate,Graduation_recomment) VALUES ('3','基于数据挖掘的招聘数据信息','1000000001','工程设计','目前，大部分企业的招聘信息均借助网络平台发布。随着时间的推移，网络招聘数据越来越多','通过对招聘数据信息进行统计分析为高校的人才培养决策方案的设计提供决策依据，为求职者和企业提供决策基础','要求设计实现一个招聘数据分析平台，能够通过爬虫获取 Web招聘信息，并对文本进行预处理','使用Python语言及其第三方库函数','刘乐梅,林基艳.基于动态时序的岗位招聘数据挖掘研究[J].微型电脑应用,2021,37(8):140-142167','行业专家+12345678987',TO_DATE('2024-02-17', 'YYYY-MM-DD'),'已通过',TO_DATE('2024-03-01', 'YYYY-MM-DD'),'项目很不错');
INSERT INTO Graduation(Graduation_id,Graduation_topic,Graduation_Teacher_id,Graduation_kind,Graduation_introduction,Graduation_task,Graduation_content ,Graduation_demand,Graduation_information,Graduation_expert,Graduatlon_subdate,Graduation_state,Graduation_appdate,Graduation_recomment) VALUES ('1','基于区块链的身份认证系统的设计','1000000002','工程设计','该系统是一种利用区块链技术来确保身份认证过程的安全性、去中心化和可追溯性的系统','通过使用区块链技术，可以建立一个安全、可靠和透明的身份认证系统','定义系统的整体结构和组成部分，包括身份认证流程、参与者角色、数据存储和交互方式等','技术要求：了解区块链，熟悉solidity语言，熟悉web3.js','http://remix.ethereum.org/','行业专家+12345678901',TO_DATE('2024-02-17', 'YYYY-MM-DD'),'已通过',TO_DATE('2024-03-01', 'YYYY-MM-DD'),'项目很不错');

--学生表格
CREATE TABLE Student(
  Student_id CHAR(10),
  Student_name VARCHAR2(30) NOT NULL,
  Student_sex VARCHAR(6),
  Student_department_id CHAR(10) NOT NULL,
  Student_subject VARCHAR(30) NOT NULL,
  Student_number VARCHAR(11) NOT NULL,
  Student_email VARCHAR(30) NOT NULL,
  CONSTRAINT PK_Student_sex CHECK(Student_sex in ('男','女')),
  CONSTRAINT PK_Student_id PRIMARY KEY (Student_id)
 );
INSERT INTO Student(Student_id,Student_name,Student_sex,Student_department_id,Student_subject,Student_number,Student_email) VALUES ('3000000001','over','男','2号','软件工程','15975328460','15975328460@qq.com');
INSERT INTO Student(Student_id,Student_name,Student_sex,Student_department_id,Student_subject,Student_number,Student_email) VALUES ('3000000002','silly','男','2号','软件工程','15975328450','15975328450@qq.com');

--学生用户表
 CREATE TABLE USER_Student(
  User_Student_id CHAR(10),
  User_Student_passwordHash VARCHAR(255) NOT NULL,
  CONSTRAINT PK_User_Student_id PRIMARY KEY(User_Student_id),
  CONSTRAINT FK_User_Student_id FOREIGN KEY (User_Student_id) REFERENCES Student(Student_id)
  );
INSERT INTO USER_Student(User_Student_id,User_Student_passwordHash) VALUES ('3000000001','4000000001');
INSERT INTO USER_Student(User_Student_id,User_Student_passwordHash) VALUES ('3000000002','4000000002');

--毕业设计信息，学生，教师信息关联表
CREATE TABLE THEME(
Theme_id CHAR(10),
Theme_student CHAR(10),
Theme_teacher CHAR(10),
CONSTRAINT FK_Theme_id FOREIGN KEY (Theme_id) REFERENCES Graduation(Graduation_id),
CONSTRAINT FK_Theme_student FOREIGN KEY (Theme_student) REFERENCES Student(Student_id),
CONSTRAINT FK_Theme_teacher FOREIGN KEY (Theme_teacher) REFERENCES Teacher(Teacher_id),
CONSTRAINT PK_Theme PRIMARY KEY(Theme_id,Theme_student,Theme_teacher)
);
INSERT INTO THEME(Theme_id,Theme_student,Theme_teacher) VALUES ('3','3000000001','1000000001');
INSERT INTO THEME(Theme_id,Theme_student,Theme_teacher) VALUES ('1','3000000002','1000000002');

--时间表
CREATE TABLE Time(
  Time_id CHAR(10),
  Time_gradid CHAR(10),
  Time_date DATE,
  Time_thing VARCHAR(255),
  Time_comment VARCHAR(255),
  Time_stuid CHAR(10),
  CONSTRAINT PK_Time_id PRIMARY KEY(Time_id),
  CONSTRAINT FK_Time_gradid FOREIGN KEY(Time_gradid) REFERENCES Graduation(Graduation_id),
  CONSTRAINT FK_Time_stuid FOREIGN KEY(Time_stuid) REFERENCES Student(Student_id)
  );
INSERT INTO Time(Time_id,Time_gradid,Time_date,Time_thing,Time_comment,Time_stuid) VALUES ('2024','3',TO_DATE('2024-02-17', 'YYYY-MM-DD'),'本科生毕业论文设计','无','3000000001');
INSERT INTO Time(Time_id,Time_gradid,Time_date,Time_thing,Time_comment,Time_stuid) VALUES ('2023','1',TO_DATE('2023-02-17', 'YYYY-MM-DD'),'本科生毕业论文设计','无','3000000002');

--分数表
CREATE TABLE Score(
  Score_student_id CHAR(10),
  Score_teacher_id CHAR(10),
  Score_graduation_id CHAR(10),
  Score_ VARCHAR2(3),
  CONSTRAINT PK_Score_student_id PRIMARY KEY(Score_student_id),
  CONSTRAINT FK_Score_student_id FOREIGN KEY(Score_student_id) REFERENCES Student(Student_id),
  CONSTRAINT FK_Score_teacher_id FOREIGN KEY(Score_teacher_id) REFERENCES Teacher(Teacher_id),
  CONSTRAINT FK_Score_graduation_id FOREIGN KEY(Score_graduation_id) REFERENCES Graduation(Graduation_id)
  );
INSERT INTO Score(Score_student_id,Score_teacher_id,Score_graduation_id,Score_) VALUES ('3000000001','1000000001','3','80');
INSERT INTO Score(Score_student_id,Score_teacher_id,Score_graduation_id,Score_) VALUES ('3000000002','1000000002','1','70');