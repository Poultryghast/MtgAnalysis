﻿CREATE TABLE tournaments (
	id SERIAL PRIMARY KEY,
	cardset VARCHAR,
	gametype VARCHAR,
	date DATE
);

CREATE TABLE decks (
	id SERIAL PRIMARY KEY,
	tournament INTEGER REFERENCES tournaments(id) ON DELETE CASCADE
);

CREATE TABLE games (
	winner INTEGER REFERENCES decks(id) ON DELETE CASCADE,
	loser INTEGER REFERENCES decks(id) ON DELETE CASCADE
);

CREATE TABLE clusters (
	id SERIAL PRIMARY KEY,
	centroid INTEGER REFERENCES decks(id) ON DELETE CASCADE,
	size DECIMAL
);

CREATE TABLE cards (
	name VARCHAR,
	deck INTEGER REFERENCES decks(id) ON DELETE CASCADE,
	inmainboard BOOLEAN
);

CREATE TABLE top_cards (
	name VARCHAR,
	cluster INTEGER REFERENCES clusters(id) ON DELETE CASCADE,
	frequency INTEGER
);

CREATE TABLE tmp_tournaments (
	index INTEGER,
	cardset VARCHAR,
	gametype VARCHAR,
	date DATE
);
