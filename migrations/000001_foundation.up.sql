-- Shared domains: constraints declared once, reused by every table.

CREATE DOMAIN game_mode_t AS text
    CHECK (VALUE IN ('mcq', 'sudden_death', 'sort_it_out', 'match_the_following'));

CREATE DOMAIN difficulty_t AS smallint
    CHECK (VALUE BETWEEN 1 AND 3);

CREATE DOMAIN nonblank_t AS text
    CHECK (btrim(VALUE) <> '');

-- <subject short code>-<chapter>-<mode>-<seq>, e.g. acc11-04-mcq-0012
CREATE DOMAIN question_code_t AS varchar(20)
    CHECK (VALUE ~ '^[a-z0-9]+(-[a-z0-9]+)*$');
