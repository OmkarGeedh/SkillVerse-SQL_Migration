-- Syllabus hierarchy: subject -> chapter. Every game question belongs to one chapter.

CREATE TABLE subjects (
    id         smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code       varchar(32) NOT NULL UNIQUE CHECK (code ~ '^[a-z0-9_]+$'),
    short_code varchar(8)  NOT NULL UNIQUE CHECK (short_code ~ '^[a-z0-9]+$'),
    grade      smallint    NOT NULL CHECK (grade BETWEEN 1 AND 12),
    name       nonblank_t  NOT NULL,
    sort_order smallint    NOT NULL DEFAULT 0
);

CREATE TABLE chapters (
    id         smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    subject_id smallint   NOT NULL REFERENCES subjects (id) ON DELETE CASCADE,
    chapter_no smallint   NOT NULL CHECK (chapter_no BETWEEN 1 AND 99),
    title      nonblank_t NOT NULL,
    UNIQUE (subject_id, chapter_no)
);
