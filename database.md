#Geek-Fitness Database

###Create the databse
```SQL
DROP DATABASE IF EXISTS geek_fitness;
CREATE DATABASE IF NOT EXISTS geek_fitness;
USE geek_fitness;

CREATE TABLE location (
location_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (location_id)
);

CREATE TABLE vlan (
vlan_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (vlan_id)
);

CREATE TABLE devicetype (
devicetype_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
PRIMARY KEY (devicetype_id)
);

CREATE TABLE device (
device_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(256) NOT NULL,
mac_address VARCHAR(14) NOT NULL,
ipv4_address VARCHAR(15),
type_id INTEGER NOT NULL,
vlan_id INTEGER,
location_id INTEGER,
PRIMARY KEY  (device_id)
);

CREATE TABLE connections (
device1_id INTEGER NOT NULL,
device2_id INTEGER NOT NULL
);

/******************************************************************************/
/***                              Foreign Keys                              ***/
/******************************************************************************/

ALTER TABLE device
ADD FOREIGN KEY (type_id) REFERENCES devicetype(devicetype_id);
ALTER TABLE device
ADD FOREIGN KEY (vlan_id) REFERENCES vlan(vlan_id);
ALTER TABLE device
ADD FOREIGN KEY (location_id) REFERENCES location(location_id);
ALTER TABLE connections
ADD FOREIGN KEY (device1_id) REFERENCES device(device_id) ;
ALTER TABLE connections
ADD FOREIGN KEY (device2_id) REFERENCES device(device_id);

```

###Fill the database with data
```SQL
USE geek_fitness;

/**   devicetype   **/

INSERT INTO devicetype(devicetype_id, name)
VALUES (1, 'Computer');

INSERT INTO devicetype(devicetype_id, name)
VALUES (2, 'Laptop');

INSERT INTO devicetype(devicetype_id, name)
VALUES (3, 'Tablet');

INSERT INTO devicetype(devicetype_id, name)
VALUES (4, 'Smartphone');

INSERT INTO devicetype(devicetype_id, name)
VALUES (5, 'Server');

INSERT INTO devicetype(devicetype_id, name)
VALUES (6, 'Router');

INSERT INTO devicetype(devicetype_id, name)
VALUES (7, 'Switch');

INSERT INTO devicetype(devicetype_id, name)
VALUES (8, 'Access Point');

/**   vlan   **/

INSERT INTO vlan(vlan_id, name)
VALUES (10, 'Geschaeftsfuehrung');

INSERT INTO vlan(vlan_id, name)
VALUES (11, 'Verwaltung');

INSERT INTO vlan(vlan_id, name)
VALUES (20, 'Finanzen');

INSERT INTO vlan(vlan_id, name)
VALUES (30, 'Lager');

INSERT INTO vlan(vlan_id, name)
VALUES (40, 'Einkauf');

INSERT INTO vlan(vlan_id, name)
VALUES (50, 'Verkauf');

INSERT INTO vlan(vlan_id, name)
VALUES (60, 'WLAN-MA');

INSERT INTO vlan(vlan_id, name)
VALUES (70, 'WLAN-KD');

INSERT INTO vlan(vlan_id, name)
VALUES (80, 'WLAN-GA');

INSERT INTO vlan(vlan_id, name)
VALUES (99, 'Management');

INSERT INTO vlan(vlan_id, name)
VALUES (100, 'Server');

/**   location   **/

INSERT INTO location(location_id, name)
VALUES (10, 'Geschaeftsfuehrung, Verwaltung und Managment');

INSERT INTO location(location_id, name)
VALUES (20, 'Finanzen');

INSERT INTO location(location_id, name)
VALUES (30, 'Lager');

INSERT INTO location(location_id, name)
VALUES (40, 'Einkauf');

INSERT INTO location(location_id, name)
VALUES (50, 'Verkauf');

INSERT INTO location(location_id, name)
VALUES (100, 'Server');

/**   device   **/

INSERT INTO device(device_id, name, mac_address, ipv4_address, type_id, vlan_id, location_id)
VALUES
(1, 'PC-EK01', '0001.6346.BBC5', '10.1.40.101', 1, 40, 40),
(2, 'PC-EK02', '00D0.584C.20AD', '10.1.40.102', 1, 40, 40),
(3, 'Helmut Pc', '0001.42CB.008B', '10.1.40.103', 1, 40, 40),
(4, 'Helmut Tablet', '0010.1140.4027', '10.1.40.104', 3, 40, 40),
(5, 'PC-FI01', '000D.BD51.B6B8', '10.1.20.11', 1, 20, 20),
(6, 'PC-FI02', '0000.0C93.0D89', '10.1.20.10', 1, 20, 20),
(7, 'DHCP/DNS-Server', '0001.C9B8.896B', '192.168.100.3', 5, 100, 100),
(8, 'WEB-Server', '0004.9AE0.5129', '192.168.100.9', 5, 100, 100),
(9, 'Fileserver', '00E0.8F31.D67E', '192.168.100.12', 5, 100, 100),
(10, 'Gast-Laptop01', '000D.BD08.C293', '10.1.80.100', 2, 80, 10),
(11, 'KD-Smartphone01', '0005.5EC7.C5CD', '10.1.70.10', 4, 70, 50);

INSERT INTO device(device_id, name, mac_address, type_id, vlan_id, location_id)
VALUES (12, 'SW-Einkauf', '0007.ECEA.20CC', 7, 40, 40),
       (13, 'AP-Einkauf', '0005.56C4.12D3', 8, 40, 40);

/**   connections   **/

INSERT INTO connections(device1_id, device2_id)
VALUES (1,12),
(2,12),
(3,12),
(13,12),
(12,1),
(12,2),
(12,3),
(12,13);
```

###Now you can start testing the database
```SQL
/** Select all devices from the Einkauf department **/
SELECT * FROM device
WHERE location_id = 40;

/** Select all the IPv4-addresses from PCs **/
SELECT ipv4_address FROM device
WHERE type_id = 1;

/** Select all employees from the Einkauf department **/
SELECT name FROM device
WHERE location_id = 40;

/** Select all PCs **/
SELECT name FROM device
WHERE type_id = 1;

/** Select devicetype of '10.1.40.104' **/
SELECT ipv4_address, devicetype.name as type FROM device
INNER JOIN devicetype ON device.type_id = devicetype.devicetype_id
WHERE ipv4_address = '10.1.40.104';

/** Select all devices that are connected with device 12 **/
SELECT device.name FROM connections
INNER JOIN device ON connections.device2_id = device.device_id
WHERE device1_id = 12;

```
