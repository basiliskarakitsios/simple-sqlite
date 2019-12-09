PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS "CART";
CREATE TABLE IF NOT EXISTS "CART" (
	"cartID"	INTEGER NOT NULL,
	"itemID"	INTEGER NOT NULL,
	"size"	TEXT NOT NULL,
	"colour"	TEXT NOT NULL,
	"availability"	INTEGER NOT NULL,
	"customerID"	INTEGER NOT NULL,
	"date"	NUMERIC NOT NULL,
	PRIMARY KEY("cartID","itemID","size","colour","availability","customerID"),
	FOREIGN KEY("itemID","size","colour","availability") REFERENCES "ITEM"("itemID","size","colour","availability") ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY("customerID") REFERENCES "CUSTOMER"("customerID") ON UPDATE CASCADE ON DELETE CASCADE
);
DROP TABLE IF EXISTS "ITEM";
CREATE TABLE IF NOT EXISTS "ITEM" (
	"itemID"	INTEGER NOT NULL,
	"size"	TEXT NOT NULL,
	"colour"	TEXT NOT NULL,
	"availability"	INTEGER NOT NULL,
	"price"	INTEGER NOT NULL,
	"description"	TEXT NOT NULL,
	PRIMARY KEY("itemID","size","colour","availability")
);	
DROP TABLE IF EXISTS "CUSTOMER";
CREATE TABLE IF NOT EXISTS "CUSTOMER" (
	"customerID"	INTEGER NOT NULL PRIMARY KEY,
	"name"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"address"	TEXT NOT NULL
);

INSERT INTO "CUSTOMER" VALUES(1,'Vasilis Karakitsios','billy_kara@hotmail.com','Ioannina Greece');
INSERT INTO "CUSTOMER" VALUES(2,'Linus Sebastian','linus@ltt.com','Richmond Canada');
INSERT INTO "CUSTOMER" VALUES(3,'Mike Wazowski','mwaz@minc.com','Monsters Incorporated');
INSERT INTO "CUSTOMER" VALUES(4,'Ken Block','kenblock@fordracing.com','New York,USA');
INSERT INTO "CUSTOMER" VALUES(5,'Maximus Graecus','maxgraecus@gov.spqr.it','Rome.Italy');
INSERT INTO "ITEM" VALUES (1,'M','red',5,20,'jeans');
INSERT INTO "ITEM" VALUES (1,'L','blue',5,20,'jeans');
INSERT INTO "ITEM" VALUES (2,'S','purple',5,20,'jeans');
INSERT INTO "ITEM" VALUES (3,'XL','black',5,20,'jeans');
INSERT INTO "ITEM" VALUES (4,'M','white',5,20,'jeans');
INSERT INTO "CART" VALUES(10,1,'M','red',5,1,'10/11/19');
INSERT INTO "CART" VALUES(20,1,'L','blue',5,1,'5/11/19');
INSERT INTO "CART" VALUES(30,2,'S','purple',5,2,'6/11/19');
INSERT INTO "CART" VALUES(40,3,'XL','black',5,3,'2/11/19');
INSERT INTO "CART" VALUES(50,4,'M','white',5,4,'8/11/19');
COMMIT;