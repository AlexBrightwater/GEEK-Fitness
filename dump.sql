USE geek_fitness;

/**     devicetype      **/

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

/**     vlan      **/

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

/** location **/

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

/** device **/

INSERT INTO device(device_id, name, mac_address, ipv4_address, type_id, vlan_id, location_id)
VALUES (1, 'Helmut', '0001:42CB:008B', '10.1.40.103', 1, 40, 40);

#todo insert devices and connections
