create database if not exists microegg;

use microegg;

create table Users (
userId INT NOT NULL AUTO_INCREMENT primary key,
fname varchar(100) not null,
lname varchar(100) not null,
gender varchar(10) not null,
mobile int not null
);

create table Login_Credentials (
emailId varchar(50) not null primary key,
password varchar(200) not null,
userId Int not null,
FOREIGN KEY (userId) REFERENCES Users(userId)
);

create table address(
addressId INT NOT NULL AUTO_INCREMENT primary key,
buildingNo varchar(10) not null,
street1 varchar(100) not null,
street2 varchar(100) not null,
city varchar(100) not null,
province varchar(100) not null,
zip int not null,
userId Int not null,
FOREIGN KEY (userId) REFERENCES Users(userId)
);


create table Product (
productId INT NOT NULL AUTO_INCREMENT primary key,
productType varchar(100) not null
);

create table cards(
cardId INT NOT NULL AUTO_INCREMENT primary key,
cardHolderName varchar(100) not null,
cardNumber INT not null,
expirationDate Date not null,
userId INT not null,
FOREIGN KEY (userId) REFERENCES Users(userId)
);

create table cart(
cartId INT NOT NULL AUTO_INCREMENT primary key,
userId INT not null,
FOREIGN KEY (userId) REFERENCES Users(userId)
);

create table computerCases (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
SIZE VARCHAR(100) NOT NULL,
productDescription VARCHAR(5000),
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table MotherBoard (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
chipSet VARCHAR(100) NOT NULL,
SIZE VARCHAR(100) NOT NULL,
productDescription VARCHAR(5000),
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table GRAPHICCARD (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
chipSet VARCHAR(100) NOT NULL,
MODEL VARCHAR(100) NOT NULL,
productDescription VARCHAR(5000),
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table PROCESSORS (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
CORES VARCHAR(100) NOT NULL,
MODEL VARCHAR(100) NOT NULL,
productDescription VARCHAR(5000),
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table RAM (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
SIZE INT NOT NULL,
SPEED INT NOT NULL,
productDescription VARCHAR(5000),
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table COOLING (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
productDescription VARCHAR(5000),
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table STORAGES (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
productDescription VARCHAR(5000),
SIZE VARCHAR(100),
MODEL VARCHAR(100),
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table POWERSUPPLY (
productId INT NOT NULL PRIMARY KEY,
make VARCHAR(50) NOT NULL,
productName VARCHAR(200) NOT NULL,
productDescription VARCHAR(5000) NOT NULL,
WATTAGE INT NOT NULL,
RATING VARCHAR(100) NOT NULL,
PRICE INT  NOT NULL,
AVAILABLEQUANTITY int NOT NULL,
FOREIGN KEY (productId) REFERENCES Product(productId)
);

create table Cart_Products(
cartId INT NOT NULL AUTO_INCREMENT,
productId INT not null,
quantity INT not null,
FOREIGN KEY (productId) REFERENCES Product(productId),
PRIMARY KEY(cartId,productId)
);

create table Orders(
orderId INT NOT NULL AUTO_INCREMENT primary key,
orderDate DATE not null,
userId INT not null,
addressId INT not null,
FOREIGN KEY (userId) REFERENCES Users(userId),
FOREIGN KEY (addressId) REFERENCES Address(addressId)
);

create table Orders_Products(
orderId INT not null AUTO_INCREMENT,
productId INT not null,
quantity INT not null,
totalAmount INT not null,
FOREIGN KEY (orderId) REFERENCES Orders(orderId),
FOREIGN KEY (productId) REFERENCES Product(productId),
PRIMARY KEY(orderId,productId)
);

create table Transactions(
transactionId INT NOT NULL AUTO_INCREMENT primary key,
paymentMode varchar(100) not null,
cardId INT not null,
totalAmount INT not null,
transactionDate Date not null,
FOREIGN KEY (cardId) REFERENCES Cards(cardId)
);

INSERT INTO PRODUCT(productType) VALUES('COMPUTERCASES');
INSERT INTO PRODUCT(productType) VALUES('COMPUTERCASES');
INSERT INTO PRODUCT(productType) VALUES('COMPUTERCASES');
INSERT INTO PRODUCT(productType) VALUES('COMPUTERCASES');
INSERT INTO PRODUCT(productType) VALUES('COMPUTERCASES');
insert into COMPUTERCASES(productId,make,productName,productDescription,SIZE,PRICE,AVAILABLEQUANTITY) values(
	1,'FRONTECH','Frontech Computer Case Cabinet',
	'The Frontech cabinet ATX Cabinet is full of features that make your new system perform with real muscle.','LARGE',100,50);
insert into COMPUTERCASES(productId,make,productName,productDescription,SIZE,PRICE,AVAILABLEQUANTITY) values(
	2,'DEEPCOOL','DEEPCOOL MATREXX 40 Mid-Tower',
	'The DEEPCOOL cabinet ATX Cabinet is full of features that make your new system perform with real muscle.','MEDIUM',110,50);
insert into COMPUTERCASES(productId,make,productName,productDescription,SIZE,PRICE,AVAILABLEQUANTITY) values(
	3,'ANT','Ant Esports ICE-130AG Mid Tower',
	'The Ant cabinet ATX Cabinet is full of features that make your new system perform with real muscle.','SMALL',120,50);
insert into COMPUTERCASES(productId,make,productName,productDescription,SIZE,PRICE,AVAILABLEQUANTITY) values(
	4,'CORSAIR','Corsair Carbide SPEC-05 Mid-Tower Gaming Case',
	'The Corsair cabinet ATX Cabinet is full of features that make your new system perform with real muscle.','LARGE',130,50);
insert into COMPUTERCASES(productId,make,productName,productDescription,SIZE,PRICE,AVAILABLEQUANTITY) values(
	5,'ANT','Ant Esports ICE-200TG Mid Tower',
	'The ANT cabinet ATX Cabinet is full of features that make your new system perform with real muscle.','SMALL',140,50);

INSERT INTO PRODUCT(productType) VALUES('MOTHERBOARD');
INSERT INTO PRODUCT(productType) VALUES('MOTHERBOARD');
INSERT INTO PRODUCT(productType) VALUES('MOTHERBOARD');
INSERT INTO PRODUCT(productType) VALUES('MOTHERBOARD');
INSERT INTO PRODUCT(productType) VALUES('MOTHERBOARD');
insert into MOTHERBOARD(productId,make,productName,chipSet,SIZE,productDescription,PRICE,AVAILABLEQUANTITY) values(
	6,'MSI','MSI B450 TOMAHAWK MAX II AM4 AMD B450 SATA 6Gb/s ATX AMD Motherboard','AMD','ATX',
	'AMD B450 motherboard comes packed with Heavy-plated Gaming Heat Sinks.
	Supports 1st, 2nd and 3rd Gen AMD Ryzen / Ryzen with Radeon Vega Graphics and 2nd Gen AMD Ryzen with Radeon Graphics/Athlon with Radeon Vega Graphics Desktop Processors for Socket AM4. 
	For AMD Ryzen Gen3 (R5/R7/R9): Supports DDR4 4133/ 4000/ 3466/ 3200/ 3066/ 3000/ 2933/ 2800/ 2667 MHz by A-XMP OC MODE. 
	For AMD Other CPU: Supports DDR4 3466/ 3200/ 3066/ 3000/ 2933/ 2800/ 2667 MHz by A-XMP OC MODE. 
	Supports DDR4 2667/ 2400/ 2133/ 1866 MHz by JEDEC',110,50);
insert into MOTHERBOARD(productId,make,productName,chipSet,SIZE,productDescription,PRICE,AVAILABLEQUANTITY) values(
	7,'ASRock','ASRock B550 Phantom Gaming-ITX/ax AM4 AMD B550 SATA 6Gb/s Mini ITX AMD Motherboard','AMD','Mini-ITX',
	'BIOS update might require for AMD Zen 3 Ryzen 5000 series CPU. AMD B550. 
	Supports AMD Ryzen 5000 Series/4000 G-Series/3000 Series Processors. DDR4 5400(OC)+/5300(OC)/5200(OC)/5100(OC)/5000(OC)/4933(OC)/4866(OC)/4800(OC)/4733(OC)/4666(OC)/4600(OC)/4533(OC)/4466(OC)/4400(OC)/4333(OC)/4266(OC)/4200(OC)/4133(OC)/4000(OC)/3866(OC)/3800(OC)/3733(OC)/3600(OC)/3466(OC)/3200/2933/2667/2400/2133(AMD Ryzen series APUs (Renoir)). 
	DDR4 5100(OC)+/5000(OC)/4933(OC)/4866(OC)/4800(OC)/4733(OC)/4666(OC)/4600(OC)/4533(OC)/4466(OC)/4400(OC)/4333(OC)/4266(OC)/4200(OC)/4133(OC)/4000(OC)/3866(OC)/3800(OC)/3733(OC)/3600(OC)/3466(OC)/3200/2933/2667/2400/2133 (AMD Ryzen series CPUs (Matisse))',150,50);
insert into MOTHERBOARD(productId,make,productName,chipSet,SIZE,productDescription,PRICE,AVAILABLEQUANTITY) values(
	8,'GIGABYTE','GIGABYTE Z690 AERO G DDR4 LGA 1700 Intel Z690 ATX Motherboard with DDR4, Quad M.2, PCIe 5.0, USB 3.2 Gen2X2 Type-C, WiFi 6, Intel 2.5 GbE LAN','INTEL','ATX',
	'Intel Z690. Intel LGA 1700 Socket: Supports 12th Gen Intel Core Series Processors. 
	Comprehensive Thermal Design: Advanced Thermal Architecture, Enlarged Thermal Guards. 
	Next Gen Connectivity: PCIe 5.0, VisionLINK I/O, Quad NVMe PCIe 4.0 x4 M.2, SuperSpeed USB 3.2 Gen 2x2 Type-C. 
	Fast Networking: WiFi 6 802.11ax, Intel 2.5 GbE LAN, BT5. 
	Fine Tuning Features: RGB FUSION 2.0, Supports Addressable LED & RGB LED Strips, Smart Fan 6, Q-Flash Plus Update BIOS without installing, CPU, Memory, and GPU. 
	Dedicated LGA1700 mounting bracket is required',290,50);
insert into MOTHERBOARD(productId,make,productName,chipSet,SIZE,productDescription,PRICE,AVAILABLEQUANTITY) values(
	9,'ASUS','ASUS Prime Z690-A LGA 1700 Intel 12th ATX Motherboard- 16+1 DrMOS, PCIe 5.0, DDR5, 4x M.2, Intel 2.5 Gb LAN, USB 3.2 Gen 2 Front Panel Type-C, Thunderbolt 4, Aura Sync RGB Lighting','INTEL','ATX',
	'Intel LGA 1700 socket: Ready for 12th Gen Intel Core processors and Windows 11, support PCIe 5.0 and DDR5. 
	AI Motherboard : AI overclocking, AI cooling and Two-way AI noise cancellation. 
	Enhanced Power Solution: 16+1 DrMOS, ProCool sockets, alloy chokes and durable capacitors for stable power delivery. 
	Next-gen connectivity: DDR5 memory, PCIe 5.0, Intel 2.5 Gb Ethernet, USB 3.2 Gen2x2 Type-C, front panel USB 3.2 Gen 2 Type-C, Thunderbolt 4 header support. 
	Boosted Memory Performance: Careful routing of traces and vias, plus ground layer optimizations to preserve signal integrity for improved memory overclocking with ASUS OptiMem II. 
	New Prime Aesthetics: New ID design, sliver scheme, ASUS-exclusive Aura Sync RGB lighting, including RGB headers and Gen 2 addressable headers. 
	All ASUS Z690 Motherboards designed with dual mounting holes compatible with both Intel LGA1700 and LGA1200 cooling brackets.',300,50);
insert into MOTHERBOARD(productId,make,productName,chipSet,SIZE,productDescription,PRICE,AVAILABLEQUANTITY) values(
	10,'GIGABYTE','GIGABYTE Z690 AORUS MASTER LGA 1700 Intel Z690 EATX Motherboard with DDR5, 5x M.2, PCIe 5.0, USB 3.2 Gen2X2 Type-C, Intel WiFi 6E, AQUANTIA 10GbE LAN','INTEL','ATX',
	'Intel Z690. Intel LGA 1700 Socket: Supports 12th Gen Intel Core Series Processors. DDR5 Compatible: Dual Channel Non-ECC Unbuffered DDR5.
	Commanding Power Design: 19+1+2 Phases Direct VRM Design with 105A Power Stage with Tantalum Polymer Capacitors. Cutting-Edge Thermal Design: Thermal Reactive Armor with NanoCarbon Fins-Array III, Heatsink. 
	Direct Touch Heatpipe II, NanoCarbon Baseplate, Thermal Guards XTREME. 5 x Ultra-Fast NVMe PCIe 4.0/3.0 x4 M.2 with Thermal Guards. AQUANTIA 10GbE BASE-T LAN. 
	Intel WIFI 6E 802.11ax 2T2R & BT5 with AORUS Antenna. Audio Solution with ESS Sabre ES9118 125dB on Rear Audio. Fine Tuning Features: RGB FUSION 2.0, Supports Addressable LED & RGB LED Strips, Smart Fan 6, Q-Flash Plus Update BIOS without installing, CPU, Memory, and GPU. 
	Dedicated LGA1700 mounting bracket is required',470,50);

INSERT INTO PRODUCT(productType) VALUES('GRAPHICCARD');
INSERT INTO PRODUCT(productType) VALUES('GRAPHICCARD');
INSERT INTO PRODUCT(productType) VALUES('GRAPHICCARD');
INSERT INTO PRODUCT(productType) VALUES('GRAPHICCARD');
INSERT INTO PRODUCT(productType) VALUES('GRAPHICCARD');
insert into GRAPHICCARD(productId,make,productName,chipSet,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	11,'ASUS','ASUS TUF Gaming NVIDIA GeForce RTX 3080 V2 OC Edition Graphics Card (PCIe 4.0, 10GB GDDR6X, LHR, HDMI 2.1, DisplayPort 1.4a, Dual Ball Fan Bearings, Military-grade Certification, GPU Tweak II)',
	'NVIDIA','3080','10GB 320-Bit GDDR6X. Core Clock 1440 MHz. Boost Clock OC Mode: 1815 MHz. Gaming Mode (Default): 1785 MHz. 2 x HDMI 2.1 3 x DisplayPort 1.4a. 
	8704 CUDA Cores. PCI Express 4.0 x16.',1580,20);
insert into GRAPHICCARD(productId,make,productName,chipSet,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	12,'GIGABYTE','GIGABYTE Gaming OC GeForce RTX 3060 12GB GDDR6 PCI Express 4.0 ATX Video Card GV-N3060GAMING OC-12GD (rev. 2.0) (LHR)',
	'NVIDIA','3060','12GB 192-Bit GDDR6. Boost Clock 1837 MHz. 2 x HDMI 2.1 2 x DisplayPort 1.4a. 3584 CUDA Cores. PCI Express 4.0',850,20);
insert into GRAPHICCARD(productId,make,productName,chipSet,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	13,'MSI','MSI Gaming GeForce RTX 3080 10GB GDDR6X PCI Express 4.0 ATX Video Card RTX 3080 GAMING Z TRIO 10G LHR',
	'NVIDIA','3080','10GB 320-Bit GDDR6X. Boost Clock 1830 MHz. 1 x HDMI 2.1 3 x DisplayPort 1.4a. 8704 CUDA Cores. PCI Express 4.0 x16. 
	This GeForce RTX 3080 graphics card with LHR (lite hash rate) delivers 43 MH/s ETH hash rate (estimate).',1535,20);
insert into GRAPHICCARD(productId,make,productName,chipSet,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	14,'ASRock','ASRock OC Formula Radeon RX 6900 XT 16GB GDDR6 PCI Express 4.0 ATX Video Card RX6900XT OCF 16G',
	'AMD','6900','16GB Memory 256-Bit GDDR6. Max Reoslution of 7680 x 4320. Core Clock 2125 MHz. Boost Clock 2475 MHz. 
	1 x HDMI 2.1 VRR 3 x DisplayPort 1.4 with DSC. 5120 Stream Processors. PCI Express 4.0',1600,20);
insert into GRAPHICCARD(productId,make,productName,chipSet,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	15,'Yeston','Yeston Radeon RX6800XT 16GB D6 GDDR6 256bit 7nm Desktop computer PC Video Graphics Cards support PCI-Express 4.0 2*DP+1*HDMI-compatible +1*Type c RGB light effect Fragrant graphics card',
	'AMD','6800','Core code and process: Navi 21 / 7nm. Unified shaders: 4608. Core frequency/Video frequency:2065-2310MHz(core game/acceleration frequency) / 16GHz (video frequency). 
	Video memory capacity and specification: 16G/ 256bit /GDDR6. Infinity Cache: 128MB. 3D features: full DirectX 12 / Ray tracing. OS feature: Win10 64. 
	Radiator:3 Fans + ARGB synchronization. Other features: AMD liquidvr ™ Technology, AMD freesync ™ Technology 2 ™ VR Ready. Bus interface: PCI Express 4.0. 
	Output interface: DP (1.4 with DSC) * 2 + HDMI-compatible (2.1 VRR and FRL) + Type-C. External power supply: 8 + 8 pin (Power supply above 750W)',1530,20);

INSERT INTO PRODUCT(productType) VALUES('PROCESSORS');
INSERT INTO PRODUCT(productType) VALUES('PROCESSORS');
INSERT INTO PRODUCT(productType) VALUES('PROCESSORS');
INSERT INTO PRODUCT(productType) VALUES('PROCESSORS');
INSERT INTO PRODUCT(productType) VALUES('PROCESSORS');
insert into PROCESSORS(productId,make,productName,CORES,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	16,'AMD','AMD Ryzen 5 5600X - Ryzen 5 5000 Series Vermeer (Zen 3) 6-Core 3.7 GHz Socket AM4 65W Desktop Processor - 100-100000065BOX',
	'6','Ryzen 5 5000','7nm Vermeer (Zen 3) 65W. 32MB L3 Cache. 3MB L2 Cache. Windows 11 Supported',299,45);
insert into PROCESSORS(productId,make,productName,CORES,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	17,'INTEL','Intel Core i7-12700K - Core i7 12th Gen Alder Lake 12-Core (8P+4E) 3.6 GHz LGA 1700 125W Intel UHD Graphics 770 Desktop Processor - BX8071512700K',
	'12', 'Intel i7-12700K' ,'Intel 7 Alder Lake Processor Base Power: 125W. Maximum Turbo Power: 190W. 25MB L3 Cache. 12MB L2 Cache. Intel UHD Graphics 770. Windows 11 Supported',420,45);
insert into PROCESSORS(productId,make,productName,CORES,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	18,'INTEL','Intel Core i9-11900K - Core i9 11th Gen Rocket Lake 8-Core 3.5 GHz LGA 1200 125W Intel UHD Graphics 750 Desktop Processor - BX8070811900K',
	'8','Intel i9-11900K','14nm Rocket Lake 125W. 16MB L3 Cache. Intel UHD Graphics 750. Windows 11 Supported',545,15);
insert into PROCESSORS(productId,make,productName,CORES,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	19,'AMD','AMD Ryzen 7 5800X - Ryzen 7 5000 Series Vermeer (Zen 3) 8-Core 3.8 GHz Socket AM4 105W Desktop Processor - 100-100000063WOF',
	'8','Ryzen 7 5800X','7nm Vermeer (Zen 3) 105W. 32MB L3 Cache. 4MB L2 Cache. Windows 11 Supported',390,45);
insert into PROCESSORS(productId,make,productName,CORES,MODEL,productDescription,PRICE,AVAILABLEQUANTITY) values(
	20,'AMD','AMD Ryzen 7 5700G - Ryzen 7 5000 G-Series Cezanne (Zen 3) 8-Core 3.8 GHz Socket AM4 65W AMD Radeon Graphics Desktop Processor - 100-100000263BOX',
	'8','Ryzen 7 5700G','7nm Vermeer (Zen 3) 65W. 16MB L3 Cache. 4MB L2 Cache. AMD Radeon Graphics. Windows 11 Supported',330,45);

INSERT INTO PRODUCT(productType) VALUES('RAM');
INSERT INTO PRODUCT(productType) VALUES('RAM');
INSERT INTO PRODUCT(productType) VALUES('RAM');
INSERT INTO PRODUCT(productType) VALUES('RAM');
INSERT INTO PRODUCT(productType) VALUES('RAM');
insert into RAM(productId,make,productName,SIZE,SPEED,productDescription,PRICE,AVAILABLEQUANTITY) values(
	21,'G.SKILL','G.SKILL Ripjaws V Series 32GB (2 x 16GB) 288-Pin DDR4 SDRAM DDR4 3200 (PC4 25600) Desktop Memory Model F4-3200C16D-32GVK',
	32,3200,'DDR4 3200 (PC4 25600). Timing 16-18-18-38. CAS Latency 16. Voltage 1.35V',115,150);
insert into RAM(productId,make,productName,SIZE,SPEED,productDescription,PRICE,AVAILABLEQUANTITY) values(
	22,'CORSAIR','CORSAIR Vengeance LPX 16GB (2 x 8GB) 288-Pin DDR4 SDRAM DDR4 3200 (PC4 25600) Intel XMP 2.0 Desktop Memory Model CMK16GX4M2B3200C16R',
	16,3200,'DDR4 3200 (PC4 25600). Timing 16-18-18-36. CAS Latency 16. Voltage 1.35V',74,150);
insert into RAM(productId,make,productName,SIZE,SPEED,productDescription,PRICE,AVAILABLEQUANTITY) values(
	23,'G.SKILL','G.SKILL Trident Z Royal Series 32GB (2 x 16GB) 288-Pin DDR4 SDRAM DDR4 3600 (PC4 28800) Intel XMP 2.0 Desktop Memory Model F4-3600C19D-32GTRS',
	32,3600,'DDR4 3600 (PC4 28800). Timing 19-20-20-40. CAS Latency 19. Voltage 1.35V',165,150);
insert into RAM(productId,make,productName,SIZE,SPEED,productDescription,PRICE,AVAILABLEQUANTITY) values(
	24,'G.SKILL','G.SKILL Trident Z Royal Series 32GB (2 x 16GB) 288-Pin DDR4 SDRAM DDR4 4000 (PC4 32000) Intel XMP 2.0 Desktop Memory Model F4-4000C18D-32GTRS',
	32,4000,'DDR4 4000 (PC4 32000). Timing 18-22-22-42. CAS Latency 18. Voltage 1.40V',180,150);
insert into RAM(productId,make,productName,SIZE,SPEED,productDescription,PRICE,AVAILABLEQUANTITY) values(
	25,'CORSAIR','CORSAIR Vengeance RGB Pro 32GB (2 x 16GB) 288-Pin DDR4 SDRAM DDR4 3600 (PC4 28800) Intel XMP 2.0 Desktop Memory Model CMW32GX4M2D3600C18',
	32,3600powersupplypowersupply,'DDR4 3600 (PC4 28800). Timing 18-22-22-42. CAS Latency 18. Voltage 1.35V',140,150);

INSERT INTO PRODUCT(productType) VALUES('COOLING');
INSERT INTO PRODUCT(productType) VALUES('COOLING');
INSERT INTO PRODUCT(productType) VALUES('COOLING');
INSERT INTO PRODUCT(productType) VALUES('COOLING');
INSERT INTO PRODUCT(productType) VALUES('COOLING');
insert into COOLING(productId,make,productName,productDescription,PRICE,AVAILABLEQUANTITY) values(
	26,'CoolerMaster','CoolerMaster MasterLiquid ML240L RGB V2, Close-Loop AIO CPU Liquid Cooler, Dual SickleFlow 120mm, RGB Lighting, 3rd Gen Dual Chamber Pump for AMD Ryzen/Intel LGA1200/1151 LGA 1700 Compatible',
	'3rd Gen: 3rd Generation Dual Chamber Pump for overall cooling efficiency and performance. 
	New SickleFlow: Refreshed exterior design for improved lighting and fan blades for a quiet airflow performance. 
	RGB Lighting: Signature cooling performance with a RGB design: for all of the users wanting lighting effects that are fully customizable. 
	Larger Surface Area: Increased the surface area of the fins on the radiator for better heat dissipation. 
	Industrial Grade Seal: High Industrial Grade EPDM material to strengthen the seal for improved longevity and Anti-Leaking. 
	Controller: Included a wired RGB Controller. Extra LGA 1700 brackets required, contact MFR for bracket',90,75);
insert into COOLING(productId,make,productName,productDescription,PRICE,AVAILABLEQUANTITY) values(
	27,'ASUS','ASUS ROG Strix LC 360 RGB All-in-one Liquid CPU Cooler 360mm Radiator, Intel 115x/2066 and AMD AM4/TR4 Support, Triple 120mm 4-pin PWM Addressable RGB Fans LGA 1700 Compatible',
	'ROG-designed RGB radiator fans for optimized airflow and static pressure.
	Individually addressable RGB and NCVM-coating pump over accentuates the sleek, modern aesthetics. 
	Styled to complement ROG motherboard, at the center stage of your build. 
	Reinforced, sleeved tubing for increased durability. 
	CPU Socket Support: AMD: AM4, TR4; Intel: LGA 115x,1366, 2011, 2011-3, 2066. 
	Extra LGA 1700 brackets required, contact MFR for bracket. 
	Pair with ASUS Z690 Motherboards, designed with dual mounting holes compatible with both Intel LGA 1700 and LGA 1200 brackets',225,75);
insert into COOLING(productId,make,productName,productDescription,PRICE,AVAILABLEQUANTITY) values(
	28,'CORSAIR','CORSAIR iCUE H150i ELITE CAPELLIX Liquid CPU Cooler LGA 1700 Compatible - White',
	'High-Performance RGB Pump Head. CORSAIR iCUE Commander CORE Included. Magnetic Levitation RGB Fans. Extreme CPU Cooling. 
	Brilliant White Finish. Zero RPM Mode. Powerful CORSAIR iCUE Software. Split-Flow Copper Cold Plate. Low-Noise Centrifugal Pump. 
	360mm Radiator. Easy to Install. Extra LGA 1700 brackets required, contact MFR for bracket',200,75);
insert into COOLING(productId,make,productName,productDescription,PRICE,AVAILABLEQUANTITY) values(
	29,'CoolerMaster','MasterLiquid ML280 Mirror ARGB Close-Loop AIO CPU Liquid Cooler, Mirror ARGB Pump, 280 Radiator, Dual SickleFlow 140mm, 3rd Gen Dual Chamber Pump for AMD Ryzen/Intel 1200, 1151, LGA 1700 Compatible',
	'3rd Generation Dual Chamber Pump: New dual chamber pump for optimized to improved overall cooling efficiency and performance. 
	New SickleFlow 140 Non-LED Fan: Dual SickleFlow 140 All-Black fans with a refreshed exterior design with 2-tier anti-dust prevention, quietness and airflow performance. 
	ARGB Lighting Solution: Signature cooling performance with a Vibrant Infinite Mirror ARGB pump design for all of the users wanting a fully customizable lighting effects. 
	3rd Generation Dual Chamber Pump: New dual chamber pump for optimized to improved overall cooling efficiency and performance. 
	Larger Surface Area: Increased the surface area of the fins on the radiator for better heat dissipation. 
	CPU Socket Support: AM4, AM3+, AM3, AM2+, AM2, FM2+, FM2, FM1, LGA1200, LGA1151, LGA1150, LGA1156, LGA1155, LGA2066, LGA2011-v3, LGA2011. 
	Extra LGA 1700 brackets required, contact MFR for bracket',85,75);
insert into COOLING(productId,make,productName,productDescription,PRICE,AVAILABLEQUANTITY) values(
	30,'Corsair','Corsair Hydro Series, iCUE H100i ELITE CAPELLIX, 240mm Radiator, Dual ML120 RGB PWM Fans, Powerful iCUE Software, Liquid CPU Cooler LGA 1700 Compatible',
	'A high-performance RGB pump head provides powerful, low-noise cooling for your CPU, lit by 33 ultra-bright CAPELLIX RGB LEDs. 
	Includes a CORSAIR iCUE Commander CORE Smart RGB Lighting and Fan Speed Controller, for precise speed and lighting control over up to six RGB fans. 
	Two 120mm CORSAIR ML RGB Magnetic Levitation PWM fans deliver powerful airflow for extreme CPU cooling performance, with eight RGB LEDs per fan. 
	Accurately control your cooling via PWM, adjusting fan speeds from 400 to 2,400 RPM. 
	Zero RPM fan profiles in CORSAIR iCUE software allow fans to stop entirely at low temperatures, eliminating fan noise. 
	Compatible Sockets: Intel LGA 1150, 1151, 1155, 1156, 1200, 1366, 2011, 2011-3, 2066 and AMD AM2, AM3, AM4, FM1, FM2, sTR4, sTRX4. 
	Extra LGA 1700 brackets required, contact MFR for bracket',130,75);

INSERT INTO PRODUCT(productType) VALUES('STORAGES');
INSERT INTO PRODUCT(productType) VALUES('STORAGES');
INSERT INTO PRODUCT(productType) VALUES('STORAGES');
INSERT INTO PRODUCT(productType) VALUES('STORAGES');
INSERT INTO PRODUCT(productType) VALUES('STORAGES');
insert into STORAGES(productId,make,productName,productDescription,SIZE,MODEL,PRICE,AVAILABLEQUANTITY) values(
	31,'Western Digital','Western Digital WD BLACK SN850 NVMe M.2 2280 1TB PCI-Express 4.0 x4 3D NAND Internal Solid State Drive (SSD) WDS100T1X0E',
	'Next-gen PCIe Gen4 technology optimized for top-tier gaming (not intended for NAS or server environments).
	Irrationally fast read/write speeds up to 7000/5300 MB/s (1TB model) and up to 1,000,000 IOPS (1TB and 2TB models).
	Up to 2TB capacity to hold your favorite battle-ready games.
	Downloadable WD_BLACK Dashboard software to customize and control your gaming experience.
	Compact form factor design for easy connectivity. Optimized for top-tier gaming','1 TB','m.2',140,150);
insert into STORAGES(productId,make,productName,productDescription,SIZE,MODEL,PRICE,AVAILABLEQUANTITY) values(
	32,'SAMSUNG','SAMSUNG 980 M.2 2280 1TB PCI-Express 3.0 x4, NVMe 1.4 V-NAND MLC Internal Solid State Drive (SSD) MZ-V8V1T0B/AM',
	'UPGRADE TO IMPRESSIVE NVMe SPEED Whether you need a boost for gaming or a seamless workflow for heavy graphics, the 980 is a smart choice for outstanding SSD performance. 
	PACKED WITH SPEED 980 delivers value, without sacrificing sequential read/write speeds up to 3,500/3,000 MB/s. 
	KEEP MOVING WITH FULL POWER MODE Keep your SSD running at its peak with Full Power Mode, which drives continuous and consistent high performance. 
	RELIABLE THERMAL CONTROL 980 uses nickel coating to help manage the controller heat level and a heat spreader label to deliver effective thermal control of the NAND chip. 
	SMART THERMAL SOLUTION Embedded with Samsung cutting edge thermal control algorithm, 980 manages heat on its own to deliver durable and reliable performance, while minimizing performance fluctuations during extended usage','1 TB','m.2',120,150);
insert into STORAGES(productId,make,productName,productDescription,SIZE,MODEL,PRICE,AVAILABLEQUANTITY) values(
	33,'Western Digital','WD Blue 3D NAND 1TB Internal SSD - SATA III 6Gb/s 2.5"/7mm Solid State Drive - WDS100T2B0A',
	'Award Winning WD Blue 3D NAND SATA SSD. Capacities up to 4TB with enhanced reliability.
	An active power draw up to 25% lower than previous generations of WD Blue SSD. 
	Sequential read speeds up to 560 MB/s and sequential write speeds up to 530 MB/s. 
	An industry-leading 1.75M hours mean time to failure (MTTF) and up to 400 terabytes written (TBW) for enhanced reliability. 
	WD F.I.T. Lab certification for compatibility with a wide range of computers. 
	Free downloadable software to monitor the status of your drive and clone a drive, or backup your data.','1 TB','SSD',90,150);
insert into STORAGES(productId,make,productName,productDescription,SIZE,MODEL,PRICE,AVAILABLEQUANTITY) values(
	34,'Seagate','Seagate BarraCuda ST4000DM004 4TB 5400 RPM 256MB Cache SATA 6.0Gb/s 3.5" Hard Drives Bare Drive - OEM',
	'Cost-effective storage upgrade for laptop or desktop computers. Store all your games, music, movies and more with up to 4TB of storage. 
	SATA 6Gb/s interface optimizes burst performance; 256MB Cache','4 TB','HHD',75,150);
insert into STORAGES(productId,make,productName,productDescription,SIZE,MODEL,PRICE,AVAILABLEQUANTITY) values(
	35,'Western Digital','WD Red Plus 4TB NAS Hard Disk Drive - 5400 RPM Class SATA 6Gb/s, CMR, 128MB Cache, 3.5 Inch - WD40EFZX - OEM',
	'Available in capacities ranging from 1-14TB with support for up to 8 bays. Supports up to 180 TB/yr workload rate. 
	NASware firmware for compatibility. Small or medium business NAS systems in a 24x7 environment. 
	3-year limited warranty','4 TB','HHD',85,150);

INSERT INTO PRODUCT(productType) VALUES('POWERSUPPLY');
INSERT INTO PRODUCT(productType) VALUES('POWERSUPPLY');
INSERT INTO PRODUCT(productType) VALUES('POWERSUPPLY');
INSERT INTO PRODUCT(productType) VALUES('POWERSUPPLY');
INSERT INTO PRODUCT(productType) VALUES('POWERSUPPLY');
insert into POWERSUPPLY(productId,make,productName,productDescription,WATTAGE,RATING,PRICE,AVAILABLEQUANTITY) values(
	36,'CORSAIR','CORSAIR RMx Series (2021) RM850x CP-9020200-NA 850 W ATX12V / EPS12V 80 PLUS GOLD Certified Full Modular Power Supply',
	'Fully Modular: Only connect the cables your system needs, making clean and tidy builds easier. 
	135mm Magnetic Levitation Fan: Utilizes a magnetic levitation bearing and custom engineered rotors for high performance, low noise, and superior reliability. 
	EPS12V Connector: For wide compatibility with modern graphics cards and motherboards. 
	100% All Japanese 105°C Capacitors: Premium internal components ensure unwavering power delivery and long-term reliability. 
	Modern Standby Compatible: Extremely fast wake-from-sleep times and better low-load efficiency. 
	80 PLUS Gold Certified: High efficiency operation for lower power consumption, less noise, and cooler temperatures. 
	Zero RPM Fan Mode: At low and medium loads the cooling fan switches off entirely for near-silent operation. 
	Resonant LLC Topology with DC-to-DC Conversion: Provides clean, consistent power, reduces coil whine for quieter operation, and enables use of more energy efficient sleep states.',850,'Gold',130,60);
insert into POWERSUPPLY(productId,make,productName,productDescription,WATTAGE,RATING,PRICE,AVAILABLEQUANTITY) values(
	37,'Seasonic','Seasonic FOCUS GX-1000, 1000W 80+ Gold, Full-Modular, Fan Control in Fanless, Silent, and Cooling Mode, 10 Year Warranty, Perfect Power Supply for Gaming and Various Application, SSR-1000FX.',
	'COMPACT SIZE: 140 MM deep fits ALL ATX systems. FULL MODULAR: Use only the cables you need to reduce clutter to maximize airflow for a better ventilated system. 
	80 PLUS GOLD: Less energy gets wasted during power conversion; Cut down your electricity usage and be Eco-Friendly. 
	PREMIUM HYBRID FAN CONTROL: Unsurpassed silent performance in Fanless Mode. The fan control button at the back of the power supply allows users to customize cooling needs by selecting between Seasonic S2FC (fan control without Fanless Mode) and S3FC (fan control including Fanless Mode). 
	10 YEAR WORRY-FREE WARRANTY: Our commitment to superior quality.',1000,'Gold',180,60);
insert into POWERSUPPLY(productId,make,productName,productDescription,WATTAGE,RATING,PRICE,AVAILABLEQUANTITY) values(
	38,'EVGA','EVGA 500 BA 100-BA-0500-K1 500 W ATX12V / EPS12V SLI CrossFire 80 PLUS BRONZE Certified Non-Modular Active PFC Power Supply',
	'80 PLUS Bronze certified, with 85% efficiency or higher under typical loads. 
	Single 12V. Rail with DC-DC Converter to improve 3.3V/5V stability. Active Power Factor Correction (PFC). 
	Heavy-duty protections, including OVP (Over Voltage Protection), UVP (Under Voltage Protection), OCP (Over Current Protection), OPP (Over Power Protection), SCP (Short Circuit Protection), and OTP (Over Temperature Protection). 
	3 Year Warranty',500,'Bronze',40,60);
insert into POWERSUPPLY(productId,make,productName,productDescription,WATTAGE,RATING,PRICE,AVAILABLEQUANTITY) values(
	39,'CORSAIR','CORSAIR RMx Series RM650x 2018 CP-9020178-NA 650 W ATX12V / EPS12V 80 PLUS GOLD Certified Full Modular Power Supply',
	'ATX12V / EPS12V. Full Modular. 80 PLUS GOLD Certified. 100 - 240 V 47 - 63 Hz. 
	+3.3V@25A, +5V@25A, +12V@54A, -12V@0.8A, +5VSB@3A',650,'Gold',85,60);
insert into POWERSUPPLY(productId,make,productName,productDescription,WATTAGE,RATING,PRICE,AVAILABLEQUANTITY) values(
	40,'EVGA','EVGA SuperNOVA 850 GA, 80 Plus Gold 850W, Fully Modular, Eco Mode, 10 Year Warranty, Includes Power ON Self Tester, Compact 150mm Size, Power Supply 220-GA-0850-X1',
	'ATX12V. Full Modular. 80 PLUS GOLD Certified. 100 - 240 V 50/60 Hz. 
	+3.3V@20A, +5V@20A, +12V@70.8A, -12V@0.3A, +5VSB@3A',850,'Gold',125,60);
