BEGIN TRANSACTION;
CREATE TABLE "Campaign" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"RecordTypeId" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	"Display_on_Website__c" VARCHAR(255), 
	"EndDate" VARCHAR(255), 
	"StartDate" VARCHAR(255), 
	"Status" VARCHAR(255), 
	"Type" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Campaign" VALUES(1,'Warehouse Volunteer Days','Join us as a regular Tuesday volunteer to help get items ready to go our to families in need across Colorado. We need help checking gear, sorting and bagging clothing and supporting our Warehouse staff to make sure we have everything we need.','012630000021TSpAAM','True','True','2040-03-01','2021-03-01','In Progress','Event');
INSERT INTO "Campaign" VALUES(2,'Volunteer Positions','','012630000021TSpAAM','False','True','','','Planned','Event');
CREATE TABLE "Campaign_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "Campaign_rt_mapping" VALUES('012630000021TSpAAM','Volunteers_Campaign');
CREATE TABLE "GW_Volunteers__Volunteer_Job__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"GW_Volunteers__Description__c" VARCHAR(255), 
	"GW_Volunteers__Display_on_Website__c" VARCHAR(255), 
	"GW_Volunteers__Inactive__c" VARCHAR(255), 
	"GW_Volunteers__Location_City__c" VARCHAR(255), 
	"GW_Volunteers__Location_Information__c" VARCHAR(255), 
	"Location_Name__c" VARCHAR(255), 
	"GW_Volunteers__Location__c" VARCHAR(255), 
	"GW_Volunteers__Location_Street__c" VARCHAR(255), 
	"GW_Volunteers__Location_Zip_Postal_Code__c" VARCHAR(255), 
	"GW_Volunteers__Ongoing__c" VARCHAR(255), 
	"GW_Volunteers__Skills_Needed__c" VARCHAR(255), 
	"GW_Volunteers__Volunteer_Website_Time_Zone__c" VARCHAR(255), 
	"GW_Volunteers__Campaign__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "GW_Volunteers__Volunteer_Job__c" VALUES(1,'Graphic Design Intern','<p><span style="font-size: 14px; color: rgb(62, 62, 60);">Design and production of event, social media and fundraising materials. Must be skilled in print design and production (Wordpress knowledge a plus!) BFA in Graphic Design or current Graphic Design student preferred. Knowledge of Adobe Creative Suite necessary. Will have design support and guidance as needed.</span></p>','True','False','','','','','','','False','','','2');
INSERT INTO "GW_Volunteers__Volunteer_Job__c" VALUES(2,'Group Volunteer Events','<p><span style="font-size: 14px; color: rgb(62, 62, 60);">Are you interested in hosting a private, sponsored, group volunteer event?</span></p>','True','False','','','','','','','False','','','2');
INSERT INTO "GW_Volunteers__Volunteer_Job__c" VALUES(3,'Warehouse Helpers','<p><span style="color: rgb(62, 62, 60);">Assist staff with the organization/sorting of donations.</span></p>','True','False','','','','','','','False','','','2');
INSERT INTO "GW_Volunteers__Volunteer_Job__c" VALUES(4,'Warehouse Volunteer','','True','False','Aurora','','20 S Havana St suite 210, Aurora, CO 80012','CO','20 S Havana St suite 210','80012','False','','America/Denver','1');
INSERT INTO "GW_Volunteers__Volunteer_Job__c" VALUES(5,'Gear Drive Coordinators','<p><span style="font-size: 14px;">Organize/host a gear drive or reach out to other community members to host drives. Assist with publicizing the gear drive. Coordinate pick up/delivery of gear to the warehouse.</span></p>','True','False','','','','','','','False','','','2');
CREATE TABLE "GW_Volunteers__Volunteer_Shift__c" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"GW_Volunteers__Description__c" VARCHAR(255), 
	"GW_Volunteers__Desired_Number_of_Volunteers__c" VARCHAR(255), 
	"Display_on_Website__c" VARCHAR(255), 
	"GW_Volunteers__Duration__c" VARCHAR(255), 
	"GW_Volunteers__Start_Date_Time__c" VARCHAR(255), 
	"GW_Volunteers__System_Note__c" VARCHAR(255), 
	"GW_Volunteers__Total_Volunteers__c" VARCHAR(255), 
	"GW_Volunteers__Volunteer_Job__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(1,'Shift-00000','','2.0','True','5.0','2021-03-09T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','2.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(2,'Shift-00001','','2.0','True','5.0','2021-03-16T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(3,'Shift-00002','','2.0','True','5.0','2021-03-23T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(4,'Shift-00003','','2.0','True','5.0','2021-03-30T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(5,'Shift-00004','','2.0','True','5.0','2021-04-06T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(6,'Shift-00005','','2.0','True','5.0','2021-04-13T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(7,'Shift-00006','','2.0','True','5.0','2021-04-20T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(8,'Shift-00007','','2.0','True','5.0','2021-04-27T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(9,'Shift-00008','','2.0','True','5.0','2021-05-04T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(10,'Shift-00009','','2.0','True','5.0','2021-05-11T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(11,'Shift-00010','','2.0','True','5.0','2021-05-18T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(12,'Shift-00011','','2.0','True','5.0','2021-05-25T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(13,'Shift-00012','','2.0','True','5.0','2021-06-01T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(14,'Shift-00013','','2.0','True','5.0','2021-06-08T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(15,'Shift-00014','','2.0','True','5.0','2021-06-15T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(16,'Shift-00015','','2.0','True','5.0','2021-06-22T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(17,'Shift-00016','','2.0','True','5.0','2021-06-29T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(18,'Shift-00017','','2.0','True','5.0','2021-07-06T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(19,'Shift-00018','','2.0','True','5.0','2021-07-13T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(20,'Shift-00019','','2.0','True','5.0','2021-07-20T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(21,'Shift-00020','','2.0','True','5.0','2021-07-27T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(22,'Shift-00021','','2.0','True','5.0','2021-08-03T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(23,'Shift-00022','','2.0','True','5.0','2021-08-10T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(24,'Shift-00023','','2.0','True','5.0','2021-08-17T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(25,'Shift-00024','','2.0','True','5.0','2021-08-24T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(26,'Shift-00025','','2.0','True','5.0','2021-08-31T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(27,'Shift-00026','','2.0','True','5.0','2021-09-07T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(28,'Shift-00027','','2.0','True','5.0','2021-09-14T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(29,'Shift-00028','','2.0','True','5.0','2021-09-21T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(30,'Shift-00029','','2.0','True','5.0','2021-09-28T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(31,'Shift-00030','','2.0','True','5.0','2021-10-05T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(32,'Shift-00031','','2.0','True','5.0','2021-10-12T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(33,'Shift-00032','','2.0','True','5.0','2021-10-19T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(34,'Shift-00033','','2.0','True','5.0','2021-10-26T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(35,'Shift-00034','','2.0','True','5.0','2021-11-02T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(36,'Shift-00035','','2.0','True','5.0','2021-11-09T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(37,'Shift-00036','','2.0','True','5.0','2021-11-16T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(38,'Shift-00037','','2.0','True','5.0','2021-11-23T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(39,'Shift-00038','','2.0','True','5.0','2021-11-30T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(40,'Shift-00039','','2.0','True','5.0','2021-12-07T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(41,'Shift-00040','','2.0','True','5.0','2021-12-14T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(42,'Shift-00041','','2.0','True','5.0','2021-12-21T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(43,'Shift-00042','','2.0','True','5.0','2021-12-28T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(44,'Shift-00043','','2.0','True','5.0','2022-01-04T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(45,'Shift-00044','','2.0','True','5.0','2022-01-11T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(46,'Shift-00045','','2.0','True','5.0','2022-01-18T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(47,'Shift-00046','','2.0','True','5.0','2022-01-25T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(48,'Shift-00047','','2.0','True','5.0','2022-02-01T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(49,'Shift-00048','','2.0','True','5.0','2022-02-08T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(50,'Shift-00049','','2.0','True','5.0','2022-02-15T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(51,'Shift-00050','','2.0','True','5.0','2022-02-22T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(52,'Shift-00051','','2.0','True','5.0','2022-03-01T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(53,'Shift-00052','','2.0','True','5.0','2022-03-08T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(54,'Shift-00053','','2.0','True','5.0','2022-03-15T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(55,'Shift-00054','','2.0','True','5.0','2022-03-22T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(56,'Shift-00055','','2.0','True','5.0','2022-03-29T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(57,'Shift-00056','','2.0','True','5.0','2022-04-05T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(58,'Shift-00057','','2.0','True','5.0','2022-04-12T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(59,'Shift-00058','','2.0','True','5.0','2022-04-19T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(60,'Shift-00059','','2.0','True','5.0','2022-04-26T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(61,'Shift-00060','','2.0','True','5.0','2022-05-03T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(62,'Shift-00061','','2.0','True','5.0','2022-05-10T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(63,'Shift-00062','','2.0','True','5.0','2022-05-17T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(64,'Shift-00063','','2.0','True','5.0','2022-05-24T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(65,'Shift-00064','','2.0','True','5.0','2022-05-31T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(66,'Shift-00065','','2.0','True','5.0','2022-06-07T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(67,'Shift-00066','','2.0','True','5.0','2022-06-14T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(68,'Shift-00067','','2.0','True','5.0','2022-06-21T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(69,'Shift-00068','','2.0','True','5.0','2022-06-28T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(70,'Shift-00069','','2.0','True','5.0','2022-07-05T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(71,'Shift-00070','','2.0','True','5.0','2022-07-12T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(72,'Shift-00071','','2.0','True','5.0','2022-07-19T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(73,'Shift-00072','','2.0','True','5.0','2022-07-26T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(74,'Shift-00073','','2.0','True','5.0','2022-08-02T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(75,'Shift-00074','','2.0','True','5.0','2022-08-09T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(76,'Shift-00075','','2.0','True','5.0','2022-08-16T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(77,'Shift-00076','','2.0','True','5.0','2022-08-23T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(78,'Shift-00077','','2.0','True','5.0','2022-08-30T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(79,'Shift-00078','','2.0','True','5.0','2022-09-06T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(80,'Shift-00079','','2.0','True','5.0','2022-09-13T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(81,'Shift-00080','','2.0','True','5.0','2022-09-20T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(82,'Shift-00081','','2.0','True','5.0','2022-09-27T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(83,'Shift-00082','','2.0','True','5.0','2022-10-04T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(84,'Shift-00083','','2.0','True','5.0','2022-10-11T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(85,'Shift-00084','','2.0','True','5.0','2022-10-18T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(86,'Shift-00085','','2.0','True','5.0','2022-10-25T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(87,'Shift-00086','','2.0','True','5.0','2022-11-01T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(88,'Shift-00087','','2.0','True','5.0','2022-11-08T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(89,'Shift-00088','','2.0','True','5.0','2022-11-15T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(90,'Shift-00089','','2.0','True','5.0','2022-11-22T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(91,'Shift-00090','','2.0','True','5.0','2022-11-29T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(92,'Shift-00091','','2.0','True','5.0','2022-12-06T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(93,'Shift-00092','','2.0','True','5.0','2022-12-13T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(94,'Shift-00093','','2.0','True','5.0','2022-12-20T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(95,'Shift-00094','','2.0','True','5.0','2022-12-27T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(96,'Shift-00095','','2.0','True','5.0','2023-01-03T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(97,'Shift-00096','','2.0','True','5.0','2023-01-10T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(98,'Shift-00097','','2.0','True','5.0','2023-01-17T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(99,'Shift-00098','','2.0','True','5.0','2023-01-24T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(100,'Shift-00099','','2.0','True','5.0','2023-01-31T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(101,'Shift-00100','','2.0','True','5.0','2023-02-07T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(102,'Shift-00101','','2.0','True','5.0','2023-02-14T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(103,'Shift-00102','','2.0','True','5.0','2023-02-21T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(104,'Shift-00103','','2.0','True','5.0','2023-02-28T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(105,'Shift-00104','','2.0','True','5.0','2023-03-07T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(106,'Shift-00105','','2.0','True','5.0','2023-03-14T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(107,'Shift-00106','','2.0','True','5.0','2023-03-21T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(108,'Shift-00107','','2.0','True','5.0','2023-03-28T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(109,'Shift-00108','','2.0','True','5.0','2023-04-04T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(110,'Shift-00109','','2.0','True','5.0','2023-04-11T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(111,'Shift-00110','','2.0','True','5.0','2023-04-18T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(112,'Shift-00111','','2.0','True','5.0','2023-04-25T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(113,'Shift-00112','','2.0','True','5.0','2023-05-02T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(114,'Shift-00113','','2.0','True','5.0','2023-05-09T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(115,'Shift-00114','','2.0','True','5.0','2023-05-16T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(116,'Shift-00115','','2.0','True','5.0','2023-05-23T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(117,'Shift-00116','','2.0','True','5.0','2023-05-30T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(118,'Shift-00117','','2.0','True','5.0','2023-06-06T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(119,'Shift-00118','','2.0','True','5.0','2023-06-13T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(120,'Shift-00119','','2.0','True','5.0','2023-06-20T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(121,'Shift-00120','','2.0','True','5.0','2023-06-27T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(122,'Shift-00121','','2.0','True','5.0','2023-07-04T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(123,'Shift-00122','','2.0','True','5.0','2023-07-11T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(124,'Shift-00123','','2.0','True','5.0','2023-07-18T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(125,'Shift-00124','','2.0','True','5.0','2023-07-25T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(126,'Shift-00125','','2.0','True','5.0','2023-08-01T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(127,'Shift-00126','','2.0','True','5.0','2023-08-08T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(128,'Shift-00127','','2.0','True','5.0','2023-08-15T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(129,'Shift-00128','','2.0','True','5.0','2023-08-22T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(130,'Shift-00129','','2.0','True','5.0','2023-08-29T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(131,'Shift-00130','','2.0','True','5.0','2023-09-05T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(132,'Shift-00131','','2.0','True','5.0','2023-09-12T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(133,'Shift-00132','','2.0','True','5.0','2023-09-19T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(134,'Shift-00133','','2.0','True','5.0','2023-09-26T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(135,'Shift-00134','','2.0','True','5.0','2023-10-03T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(136,'Shift-00135','','2.0','True','5.0','2023-10-10T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(137,'Shift-00136','','2.0','True','5.0','2023-10-17T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(138,'Shift-00137','','2.0','True','5.0','2023-10-24T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(139,'Shift-00138','','2.0','True','5.0','2023-10-31T19:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(140,'Shift-00139','','2.0','True','5.0','2023-11-07T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(141,'Shift-00140','','2.0','True','5.0','2023-11-14T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(142,'Shift-00141','','2.0','True','5.0','2023-11-21T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(143,'Shift-00142','','2.0','True','5.0','2023-11-28T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(144,'Shift-00143','','2.0','True','5.0','2023-12-05T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(145,'Shift-00144','','2.0','True','5.0','2023-12-12T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(146,'Shift-00145','','2.0','True','5.0','2023-12-19T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(147,'Shift-00146','','2.0','True','5.0','2023-12-26T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(148,'Shift-00147','','2.0','True','5.0','2024-01-02T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(149,'Shift-00148','','2.0','True','5.0','2024-01-09T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(150,'Shift-00149','','2.0','True','5.0','2024-01-16T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(151,'Shift-00150','','2.0','True','5.0','2024-01-23T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(152,'Shift-00151','','2.0','True','5.0','2024-01-30T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(153,'Shift-00152','','2.0','True','5.0','2024-02-06T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(154,'Shift-00153','','2.0','True','5.0','2024-02-13T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(155,'Shift-00154','','2.0','True','5.0','2024-02-20T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(156,'Shift-00155','','2.0','True','5.0','2024-02-27T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
INSERT INTO "GW_Volunteers__Volunteer_Shift__c" VALUES(157,'Shift-00156','','2.0','True','5.0','2024-03-05T20:00:00.000+0000','Auto-created for Job Recurrence Schedule: JRS-00000.','0.0','4');
COMMIT;
