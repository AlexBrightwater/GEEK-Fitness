/** Select all devices from the Einkauf department **/
SELECT * FROM device
WHERE location_id = 40;

/** Select all the IPv4-addresses from PCs **/
SELECT ipv4_address FROM device
WHERE type_id = 1;

/** Select all employees from the Einkauf department **/
SELECT name FROM device
WHERE location_id = 40;
