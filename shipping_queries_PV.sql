use shipping;

-- Calculate volume of all containers not located on a ship
SELECT containerID, dimensionHeight*dimensionLength*dimensionWidth AS 'Container Volume'
FROM containers
WHERE shipID IS NULL;

-- List the total number of crew members found on ships from each home port
SELECT homePort, SUM(crewSize) AS mySum
FROM ships
GROUP BY homePort
ORDER BY mySum DESC;

-- Find the ship with the lowest displacement using a subquery
SELECT shipID, displacement
FROM ships
WHERE displacement=
	(SELECT MIN(displacement)
	 FROM ships);

-- List all ship IDs and the country of origin of their home port using a JOIN query
SELECT s.shipID, p.country
FROM ships s, ports p
WHERE p.portID=s.homePort
ORDER BY p.country;

-- List the number of containers on ships with a crew size of 25 or less using a JOIN query
SELECT s.shipID, COUNT(c.containerID) AS myCount
FROM ships s, containers c
WHERE crewSize<=25 AND s.shipID=c.shipID
GROUP BY s.shipID
ORDER BY myCount DESC;

-- List the container IDs of containers found aboard ships originating from Cairo or Bangkok using a JOIN query
SELECT c.containerID
FROM containers c, ships s, ports p
WHERE c.shipID=s.shipID AND s.homePort=p.portID AND (p.city='Bangkok' OR p.city='Cairo');

-- List the ship ID, displacement, and total weight of the containers on every ship using a JOIN query
SELECT s.shipID, SUM(c.weight) AS mySum, s.displacement
FROM ships s, containers c
WHERE c.shipID=s.shipID
GROUP BY s.shipID
ORDER BY mySum DESC;

-- List the ship ID of all ships originating from Melbourne and holding containers that weigh over 6000 pounds using a JOIN query
SELECT DISTINCT s.shipID
FROM ships s, containers c, ports p
WHERE s.homePort=p.portID AND s.shipID=c.shipID AND c.weight>6000 AND p.city='Melbourne';

-- List the ship ID and year it was built for all ships built in the decade of the 2000s
SELECT shipID, yearBuilt
FROM ships
WHERE yearBuilt BETWEEN 2000 and 2009
ORDER BY yearBuilt;

-- List the ship ID and captain name of any ship who has a captain whose first name starts with "S"
SELECT shipID, captainName
FROM ships
WHERE captainName LIKE 'S%'
ORDER BY captainName;

