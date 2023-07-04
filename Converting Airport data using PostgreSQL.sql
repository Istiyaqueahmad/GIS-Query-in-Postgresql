CREATE EXTENSION postgis;

SELECT AddGeometryColumn ('public','airports','geom',4326,'POINT',2);

UPDATE airports
SET geom = ST_SetSRID(ST_MakePoint(longitude_deg, latitude_deg),4326);

SELECT AddGeometryColumn('public', 'navaids', 'geom', 4326, 'POINT', 2 );
SELECT AddGeometryColumn('public', 'navaids', 'dme_geom', 4326, 'POINT', 2 );

UPDATE navaids
SET geom = ST_SetSRID(ST_MakePoint(longitude_deg, latitude_deg),4326),
	dme_geom = ST_SetSRID(ST_MakePoint(dme_longitude_deg, dme_latitude_deg),4326);


SELECT AddGeometryColumn('public', 'runways', 'le_geom', 4326, 'POINT', 2 );
SELECT AddGeometryColumn('public', 'runways', 'he_geom', 4326, 'POINT', 2 );

UPDATE runways
SET le_geom = ST_SetSRID(ST_MakePoint(le_longitude_deg, le_latitude_deg),4326),
	he_geom = ST_SetSRID(ST_MakePoint(he_longitude_deg, he_latitude_deg),4326);


--these are the delete statements
SELECT DropGeometryColumn ('public','airports','geom');
SELECT DropGeometryColumn('public', 'navaids', 'geom' );
SELECT DropGeometryColumn('public', 'navaids', 'dme_geom');
SELECT DropGeometryColumn('public', 'runways', 'le_geom');
SELECT DropGeometryColumn('public', 'runways', 'he_geom' );
