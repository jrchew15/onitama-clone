DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS moves;
DROP TABLE IF EXISTS player_games;
DROP TABLE IF EXISTS card_games;

CREATE TABLE players (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(20) NOT NULL
);

CREATE TABLE games (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created_at TIMESTAMP default current_timestamp,
    starting_color VARCHAR(4)
);

CREATE TABLE player_games (
    player_id INTEGER,
    game_id INTEGER,
    PRIMARY KEY (player_id, game_id),
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);

CREATE TABLE moves (
    game_id INTEGER,
    move_number INTEGER,
    piece INTEGER,
    card_id INTEGER,
    card_choice INTEGER,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE SET NULL
);

CREATE TABLE cards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10),
    option1 VARCHAR(7),
    option2 VARCHAR(7),
    option3 VARCHAR(7),
    option4 VARCHAR(7)
);

CREATE TABLE card_games (
    game_id INTEGER,
    card_id INTEGER,
    PRIMARY KEY (game_id, card_id),
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES cards(id) ON DELETE CASCADE
);
