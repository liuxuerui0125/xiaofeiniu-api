SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;
/*管理员*/
CREATE TABLE xfn_admin(
	aid  INT PRIMARY KEY AUTO_INCREMENT,
	aname VARCHAR(32) UNIQUE,
	apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES
(NULL,'admin',PASSWORD('123456')),
(NULL,'boss',PASSWORD('999999'));

/*全局设置*/
CREATE TABLE xfn_settings(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	appName VARCHAR(32),
	apiUrl VARCHAR(64),
	adminUrl VARCHAR(64),
	appUrl VARCHAR(64),
	icp VARCHAR(64),
	copyRight VARCHAR(128)
);
INSERT INTO xfn_settings VALUES
(NULL,'小肥牛','http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备12003709号-3','Copyright © 北京达内金桥科技有限公司版权所有');

/*桌台信息表*/
CREATE TABLE xfn_table(
	tid INT PRIMARY KEY AUTO_INCREMENT,
	tname VARCHAR(64),
	type VARCHAR(32),
	status INT
);
INSERT INTO xfn_table VALUES
(NULL,'二月花','6-8人桌','1'),
(NULL,'夕阳红','4人桌','2'),
(NULL,'茶飘香','1-2人桌','4'),
(NULL,'寿启天','6-8人桌','3'),
(NULL,'全家福','8-10人桌','0');

/*桌台预定信息表*/
CREATE TABLE xfn_reservation(
	rid INT PRIMARY KEY AUTO_INCREMENT,
	contactName VARCHAR(64),
	phone VARCHAR(16),
	contactTime BIGINT,
	dinnerTime BIGINT,
    tableId INT
);
INSERT INTO xfn_reservation VALUES
(NULL,'丁丁','13200000000','1328404830420','1548410400000'),
(NULL,'当当','13200000000','1258404830420','1545210400000'),
(NULL,'丫丫','13200000000','1548404830420','1544710400000'),
(NULL,'豆豆','13200000000','1548604830420','1548410400000'),
(NULL,'妞妞','13200000000','1543704830420','1549810400000');

#菜品分类表
CREATE TABLE xfn_category(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(32)
);
INSERT INTO xfn_category VALUES
(NULL,'肉类'),
(NULL,'丸滑类'),
(NULL,'蔬菜豆制品'),
(NULL,'海鲜河鲜'),
(NULL,'菌菇类');

#菜品样式表
CREATE TABLE xfn_dish(
	did INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(32),
	imgUrl VARCHAR(128),
	price DECIMAL(6,2),
	detail VARCHAR(128),
	categroyId INT,
    FOREIGN KEY(categroyId) REFERENCES xfn_category(cid)
);
INSERT INTO xfn_dish VALUES
(100000,'草鱼片','CE7I9470.jpg','55','选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用。','1'),
(NULL,'酥肉','HGS_4760.jpg','55','选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用。','1'),
(NULL,'牛百叶','CE7I9302.jpg','55','毛肚切丝后，配以调味料腌制而成。锅开后再煮2分钟左右即可食用。','1'),
(NULL,'腰花','CE7I9287.jpg','55','选用大型厂家冷鲜腰花，经过解冻、清洗、切片而成。锅开后涮30秒左右即可食用。','1'),
(NULL,'牛仔骨','1-CE7I5290.jpg','55','牛仔骨又称牛小排，选自资质合格的厂家生产配送。锅开后再煮5分钟左右即可食用。','1'),
(NULL,'脆皮肠','CE7I9017.jpg','55','锅开后再煮3分钟左右即可食用。。','2');

#订单表
CREATE TABLE xfn_order(
	oid INT PRIMARY KEY AUTO_INCREMENT,
	startTime BIGINT,
	endTime BIGINT,
	customerCount INT,
	tableId INT,
    FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_order VALUES
(1,'1543704830420','1549810400000',3,1);

#订单详情表
CREATE TABLE xfn_order_detail(
	did INT PRIMARY KEY AUTO_INCREMENT,
	dishId INT,     
	dishCount INT, 
	customerName VARCHAR(64),
	orderId INT,
    FOREIGN KEY(dishId) REFERENCES xfn_dish(did),
    FOREIGN KEY(orderId) REFERENCES xfn_order(oid)
);
INSERT INTO xfn_order_detail VALUES
(NULL,100001,1,'丁丁',1);