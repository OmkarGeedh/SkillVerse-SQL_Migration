# SkillVerse-SQL_Migration

PostgreSQL schema and game content for SkillVerse. Content is authored as CSV in
`Sheets Dump/`, converted to idempotent SQL in `seeds/sql/`, and applied with `game-db`.

```bash
cp .env.example .env        # set DB_URL
make import                 # CSV -> seeds/sql
make migrate-up && make seed
```

Full guide (CSV layout, question codes, schema, rules): [AGENTS.md](AGENTS.md).
