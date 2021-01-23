CREATE SCHEMA mongo_fdw;
CREATE EXTENSION mongo_fdw SCHEMA mongo_fdw;
CREATE SERVER mongo FOREIGN DATA WRAPPER mongo_fdw OPTIONS (address 'db', port '27017', authentication_database 'admin');
CREATE USER MAPPING FOR postgres SERVER mongo;

CREATE FOREIGN TABLE mongo_measurements
	(
		_id name,
		"value" text,
		sensor_id name,
		"createdAt" timestamptz,
		"location.coordinates" real[3]
	)
	SERVER mongo
	OPTIONS (database 'api-test', collection 'measurements');

SELECT * from mongo_measurements LIMIT 10;

CREATE TABLE measurements(
		_id name,
		"value" real,
		sensor_id name,
		created_at timestamptz,
    lat real,
    lon real,
    alt real
);

INSERT INTO measurements(_id,"value",sensor_id,created_at,lat,lon,alt) SELECT
    _id,
    "value"::real,
    sensor_id,
    "createdAt" AS created_at,
    "location.coordinates"[1] AS lon,
    "location.coordinates"[2] AS lat,
    "location.coordinates"[3] AS alt
  FROM mongo_measurements;
