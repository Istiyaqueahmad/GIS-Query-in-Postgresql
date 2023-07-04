CREATE INDEX idx_airports_geom
ON airports USING gist(geom);

CREATE INDEX idx_navaids_geom
ON navaids USING gist(geom);

CREATE INDEX idx_navaids_dme_geom
ON navaids USING gist(dme_geom);

CREATE INDEX idx_runways_le_geom
ON runways USING gist(le_geom);

CREATE INDEX idx_runways_he_geom
ON runways USING gist(he_geom);

SELECT a.name,b.name,b.geom
FROM airports a
JOIN airports b ON ST_DWithin(a.geom, b.geom, 0.5)
WHERE a.id=20426;

SELECT n.name,n.type,frequency_khz,n.geom
FROM airports a
JOIN navaids n ON ST_DWithin(a.geom, n.geom, 1)
WHERE a.id=19958;
