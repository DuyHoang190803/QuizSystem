CREATE DATABASE QuizSystem
GO
--drop database QuizSystem
USE QuizSystem
GO

-- Creating Roles Table with IDENTITY
CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    Role NVARCHAR(255)
);

INSERT INTO Roles (Role) VALUES ('student');
INSERT INTO Roles (Role) VALUES ('admin');
INSERT INTO Roles (Role) VALUES ('teacher');

-- Creating Users Table with IDENTITY
--drop table Users;
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(255),
    RoleID INT,
    Email NVARCHAR(255),
    Password NVARCHAR(255),
	PhoneNumber VARCHAR(15),
	Avatar VARCHAR(MAX),
	FullName VARCHAR(100),
	DoB DATE,
	PlaceWork NVARCHAR(255),
	UserCode NVARCHAR(255),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
INSERT INTO Users (UserName, RoleID, Email, Password, PhoneNumber, Avatar, FullName, DoB, PlaceWork, UserCode)
VALUES 
('teacher1', 3, 't1@example.com', 'password1', '123456789', 'avatar1.jpg', 'Nguyen Van A', '1980-01-01', 'Fu-Hoa Lac', 'HE123456'),
('teacher2', 3, 't2@example.com', 'password2', '987654321', 'avatar2.jpg', 'Tran Thi B', '1975-05-05', 'Fu-Hoa Lac', 'HE234567'),
('teacher3', 3, 't3@example.com', 'password3', '456123789', 'avatar3.jpg', 'Le Van C', '1985-10-10', 'Fu-Hoa Lac', 'HE345678');

-- Sinh viên
INSERT INTO Users (UserName, RoleID, Email, Password, PhoneNumber, Avatar, FullName, DoB, PlaceWork, UserCode)
VALUES 
('student1', 1, 's1@example.com', 'password1', '111222333', 'avatar4.jpg', 'Pham Thi D', '2000-03-15', 'Fu-Hoa Lac', 'HE456789'),
('student2', 1, 's2@example.com', 'password2', '444555666', 'avatar5.jpg', 'Hoang Van E', '2001-07-20', 'Fu-Hoa Lac', 'HE567890'),
('student3', 1, 's3@example.com', 'password3', '777888999', 'avatar6.jpg', 'Nguyen Thi F', '1999-12-25', 'Fu-Hoa Lac', 'HE678901'),
('student4', 1, 's4@example.com', 'password4', '123123123', 'avatar7.jpg', 'Tran Van G', '2002-09-10', 'Fu-Hoa Lac', 'HE789012'),
('student5', 1, 's5@example.com', 'password5', '456456456', 'avatar8.jpg', 'Le Thi H', '1998-04-30', 'Fu-Hoa Lac', 'HE890123'),
('student6', 1, 's6@example.com', 'password6', '789789789', 'avatar9.jpg', 'Pham Van I', '2003-11-05', 'Fu-Hoa Lac', 'HE901234'),
('student7', 1, 's7@example.com', 'password7', '987987987', 'avatar10.jpg', 'Ho Thi K', '2000-06-20', 'Fu-Hoa Lac', 'HE012345'),
('student8', 1, 's8@example.com', 'password8', '654654654', 'avatar11.jpg', 'Nguyen Van L', '1997-08-15', 'Fu-Hoa Lac', 'HE123456'),
('student9', 1, 's9@example.com', 'password9', '321321321', 'avatar12.jpg', 'Tran Thi M', '2004-02-28', 'Fu-Hoa Lac', 'HE234567'),
('student10', 1, 's10@example.com', 'password10', '000999888', 'avatar13.jpg', 'Le Van N', '1996-10-05', 'Fu-Hoa Lac', 'HE345678');
--ALTER TABLE Users
--ADD PlaceWork NVARCHAR(255);
--ALTER TABLE Users
--ADD UserCode NVARCHAR(255);
--select * from Users;
--SELECT UserID, UserName, RoleID, Email, Password, PhoneNumber, Avatar, FullName, DoB FROM Users WHERE UserID = 1
-- Thêm thông tin cho người dùng với vai trò là student
INSERT INTO Users (UserName, RoleID, Email, Password)
VALUES ('student1', 1, 'student1@example.com', 'password1');
INSERT INTO Users (UserName, RoleID, Email, Password)
VALUES ('student', 1, 'student@example.com', '1');


--INSERT INTO ClassMembers (ClassID, UserID, isApproved)
--SELECT c.ClassID, u.UserID, 0
--FROM Class c, Users u
--WHERE ClassCode = '2wcEKt'
--AND UserID = 10;

--select * from class
--hêm thông tin cho người dùng với vai trò là admin
INSERT INTO Users (UserName, RoleID, Email, Password)
VALUES ('admin1', 2, 'admin1@example.com', 'adminpassword');
INSERT INTO Users (UserName, RoleID, Email, Password)
VALUES ('admin', 2, 'admin@example.com', '1');
INSERT INTO Users (UserName, RoleID, Email, Password, PhoneNumber, Avatar, FullName, DoB, PlaceWork)
VALUES
('user1', 1, 'user1@example.com', 'password1', '123456789', 'avatar1.jpg', 'User One', '2000-01-01', 'Place Work 1'),
('user2', 1, 'user2@example.com', 'password2', '123456790', 'avatar2.jpg', 'User Two', '2000-02-02', 'Place Work 2'),
('user3', 1, 'user3@example.com', 'password3', '123456791', 'avatar3.jpg', 'User Three', '2000-03-03', 'Place Work 3'),
('user4', 1, 'user4@example.com', 'password4', '123456792', 'avatar4.jpg', 'User Four', '2000-04-04', 'Place Work 4'),
('user5', 1, 'user5@example.com', 'password5', '123456793', 'avatar5.jpg', 'User Five', '2000-05-05', 'Place Work 5'),
('user6', 1, 'user6@example.com', 'password6', '123456794', 'avatar6.jpg', 'User Six', '2000-06-06', 'Place Work 6'),
('user7', 1, 'user7@example.com', 'password7', '123456795', 'avatar7.jpg', 'User Seven', '2000-07-07', 'Place Work 7'),
('user8', 1, 'user8@example.com', 'password8', '123456796', 'avatar8.jpg', 'User Eight', '2000-08-08', 'Place Work 8'),
('user9', 1, 'user9@example.com', 'password9', '123456797', 'avatar9.jpg', 'User Nine', '2000-09-09', 'Place Work 9'),
('user10', 1, 'user10@example.com', 'password10', '123456798', 'avatar10.jpg', 'User Ten', '2000-10-10', 'Place Work 10');
INSERT INTO Users (UserName, RoleID, Email, Password, PhoneNumber, Avatar, FullName, DoB, PlaceWork)
VALUES
('user11', 1, 'user11@example.com', 'password11', '123456799', 'avatar11.jpg', 'User Eleven', '2000-11-11', 'Place Work 11'),
('user12', 1, 'user12@example.com', 'password12', '123456800', 'avatar12.jpg', 'User Twelve', '2000-12-12', 'Place Work 12'),
('user13', 1, 'user13@example.com', 'password13', '123456801', 'avatar13.jpg', 'User Thirteen', '2000-01-13', 'Place Work 13'),
('user14', 1, 'user14@example.com', 'password14', '123456802', 'avatar14.jpg', 'User Fourteen', '2000-02-14', 'Place Work 14'),
('user15', 1, 'user15@example.com', 'password15', '123456803', 'avatar15.jpg', 'User Fifteen', '2000-03-15', 'Place Work 15'),
('user16', 1, 'user16@example.com', 'password16', '123456804', 'avatar16.jpg', 'User Sixteen', '2000-04-16', 'Place Work 16'),
('user17', 1, 'user17@example.com', 'password17', '123456805', 'avatar17.jpg', 'User Seventeen', '2000-05-17', 'Place Work 17'),
('user18', 1, 'user18@example.com', 'password18', '123456806', 'avatar18.jpg', 'User Eighteen', '2000-06-18', 'Place Work 18'),
('user19', 1, 'user19@example.com', 'password19', '123456807', 'avatar19.jpg', 'User Nineteen', '2000-07-19', 'Place Work 19'),
('user20', 1, 'user20@example.com', 'password20', '123456808', 'avatar20.jpg', 'User Twenty', '2000-08-20', 'Place Work 20');

-- Thêm thông tin cho người dùng với vai trò là teacher
INSERT INTO Users (UserName, RoleID, Email, Password)
VALUES ('teacher1', 3, 'teacher1@example.com', 'teacherpassword');
INSERT INTO Users (UserName, RoleID, Email, Password)
VALUES ('teacher', 3, 'teacher@example.com', '1');


-- Creating Classes Table with IDENTITY
CREATE TABLE Class (
    ClassID INT IDENTITY(1,1) PRIMARY KEY,
    ClassName NVARCHAR(255),
	ClassCode NVARCHAR(255),
	TeacherId int,
	Semester NVARCHAR(255),
	Subject NVARCHAR(255)
);
--select * from class
-- Creating Classes Table with IDENTITY
CREATE TABLE ClassMembers (
    ClassMemberID INT IDENTITY(1,1) PRIMARY KEY,
    ClassID INT,
    UserID INT,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
--select u.UserId, u.UserName, u.DoB, u.PhoneNumber, u.PlaceWork from Users u, Classmembers c where u.UserID = c.UserID and c.ClassID = 9;
ALTER TABLE ClassMembers
ADD isApproved int;

--UPDATE ClassMembers SET isApproved = 0 where ClassMemberID = 9;
--DELETE FROM ClassMembers WHERE ClassID = ? and UserID = ?;
--select * from ClassMembers

-- Creating QuestionSets Table with IDENTITY
CREATE TABLE QuestionSets (
    QuestionSetID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    QuestionSetName NVARCHAR(255),
	IsPublic BIT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Creating Questions Table with IDENTITY
CREATE TABLE Questions (
    QuestionID INT IDENTITY(1,1) PRIMARY KEY,
    QuestionSetID INT,
	Question NVARCHAR(1000),
	FOREIGN KEY (QuestionSetID) REFERENCES QuestionSets(QuestionSetID)
);

-- Creating Options Table with IDENTITY
CREATE TABLE Options (
    OptionID INT IDENTITY(1,1) PRIMARY KEY,
    QuestionID INT,
    [Option] NVARCHAR(1000),
    IsCorrect BIT,
    FOREIGN KEY (QuestionID) REFERENCES Questions(QuestionID)
);

--SELECT QuestionSetID, UserID, QuestionSetName, isPublic FROM QuestionSets
--SELECT QuestionID, QuestionSetID, Question FROM Questions WHERE QuestionSetID = 18

-- Creating TermSets Table with IDENTITY
CREATE TABLE TermSets (
    TermSetID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    TermSetName NVARCHAR(255),
	TermSetDescription NVARCHAR(255),
	IsPublic BIT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO TermSets (UserID, TermSetName, TermSetDescription, IsPublic) VALUES
(2, N'Chào hỏi trong tiếng Nhật', N'Một số câu chào hỏi cơ bản thường ngày trong tiếng Nhật', 1),
(1, 'Vocabulary', N'Tập hợp các từ vựng tiếng Anh cơ bản', 1),
(2, 'Phrasal Verbs', N'Tập hợp các cụm động từ tiếng Anh', 0),
(5, 'TOEFL Words', N'Tập hợp các từ vựng liên quan đến kỳ thi TOEFL', 1),
(6, 'IELTS Vocabulary', N'Tập hợp từ vựng phổ biến cho kỳ thi IELTS', 0),
(7, 'GRE Flashcards', N'Tập hợp các thẻ ghi nhớ cho kỳ thi GRE', 1),
(8, 'Medical Terms', N'Tập hợp các thuật ngữ y học cơ bản', 0),
(9, 'Programming Concepts', N'Tập hợp các khái niệm cơ bản về lập trình', 1),
(10, 'Business Jargon', N'Tập hợp các thuật ngữ chuyên ngành kinh doanh', 0),
(11, 'Legal Terminology', N'Tập hợp các thuật ngữ pháp lý cơ bản', 1),
(12, 'Chemistry Basics', N'Tập hợp kiến thức cơ bản về hóa học', 0),
(13, 'Physics Formulas', N'Tập hợp các công thức vật lý cơ bản', 1),
(14, 'Psychology Terms', N'Tập hợp các thuật ngữ tâm lý học', 0),
(15, 'Geography Facts', N'Tập hợp các sự kiện địa lý quan trọng', 1),
(16, 'Mathematical Equations', N'Tập hợp các phương trình toán học cơ bản', 0),
(17, 'Literary Devices', N'Tập hợp các thiết kế văn học', 1),
(18, 'Art History Terms', N'Tập hợp các thuật ngữ lịch sử nghệ thuật', 0),
(19, 'Environmental Science Concepts', N'Tập hợp các khái niệm về môi trường học', 1),
(20, 'Economics Principles', N'Tập hợp các nguyên lý kinh tế cơ bản', 0),
(5, 'Political Science Terminology', N'Tập hợp các thuật ngữ chính trị', 1),
(6, 'Sociology Concepts', N'Tập hợp các khái niệm xã hội học', 0),
(7, 'Anthropology Terms', N'Tập hợp các thuật ngữ nhân loại học', 1),
(8, 'Astronomy Facts', N'Tập hợp các sự kiện thiên văn học', 0),
(9, 'Engineering Fundamentals', N'Tập hợp các kiến thức cơ bản về kỹ thuật', 1),
(10, 'Architecture Styles', N'Tập hợp các phong cách kiến trúc', 0),
(11, 'Music Theory Basics', N'Tập hợp các kiến thức cơ bản về lý thuyết âm nhạc', 1),
(12, 'Dance Techniques', N'Tập hợp các kỹ thuật khiêu vũ cơ bản', 0),
(13, 'Film Studies Terminology', N'Tập hợp các thuật ngữ nghệ thuật điện ảnh', 1),
(14, 'Culinary Arts Vocabulary', N'Tập hợp các từ vựng về nghệ thuật ẩm thực', 0),
(15, 'Fashion Design Concepts', N'Tập hợp các khái niệm thiết kế thời trang', 1),
(16, 'Digital Marketing Terms', N'Tập hợp các thuật ngữ marketing số', 0);


-- Creating Terms Table with IDENTITY
CREATE TABLE Terms (
    TermID INT IDENTITY(1,1) PRIMARY KEY,
    TermSetID INT,
	Term NVARCHAR(1000),
    [Definition] NVARCHAR(1000),
	FOREIGN KEY (TermSetID) REFERENCES TermSets(TermSetID)
);

INSERT INTO Terms (TermSetID, Term, [Definition])
VALUES 
(1, N'おはようございます！', N'Chào buổi sáng!'),
(1, N'こんにちは！', N'Chào buổi trưa!'),
(1, N'こんばんは！', N'Chào buổi tối!'),
(1, N'すみません。', N'Xin lỗi'),
(1, N'どうも。', N'Chào buổi trưa!'),
(1, N'ありがとう！', N'Cảm ơn'),
(1, N'どうもありがとうございます。', N'Cảm ơn rất nhiều.'),
(1, N'おやすみなさい。', N'Chúc ngủ ngon.'),
(1, N'さようなら！', N'Tạm biệt.'),
(1, N'わかりますか。', N'Có hiểu không?'),
(1, N'はい、わかりました。', N'Vâng, tôi hiểu rồi'),
(1, N'いただきます。', N'Lời mời trước khi ăn, uống.'),
(1, N'ごちそうさまでした。', N'Cảm ơn sau khi ăn uống.');

--SELECT TermID, TermSetID, Term, [Definition] FROM Terms

-- Creating Tests Table with IDENTITY
CREATE TABLE Tests (
    TestID INT IDENTITY(1,1) PRIMARY KEY,
    ClassID INT,
    QuestionSetID INT,
    Time TIME,
    DateTaken DATE,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (QuestionSetID) REFERENCES QuestionSets(QuestionSetID)
);

-- Creating TestAttempts Table with IDENTITY
CREATE TABLE TestAttempts (
    TestAttemptID INT IDENTITY(1,1) PRIMARY KEY,
    TestID INT,
    UserID INT,
    Marks INT,
    Grade NVARCHAR(255),
    FOREIGN KEY (TestID) REFERENCES Tests(TestID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Creating Review Table with IDENTITY
CREATE TABLE Review (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    TermID INT,
    ReviewDate DATE,
    NextReviewDate DATE,
    Ease NVARCHAR(255),
    Interval INT,
    FOREIGN KEY (TermID) REFERENCES Terms(TermID)
);

--Creating Notifications Table
CREATE TABLE Notifications (
    id INT PRIMARY KEY IDENTITY(1,1),
    message NVARCHAR(MAX),
    is_read BIT DEFAULT 0,
	user_id INT,
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(UserID)
);
