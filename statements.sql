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
