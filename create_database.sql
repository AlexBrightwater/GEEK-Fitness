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
ALTER TABLE connections
    ADD FOREIGN KEY (device1_id) REFERENCES device(device_id) ;
ALTER TABLE connections
    ADD FOREIGN KEY (device2_id) REFERENCES device(device_id);
