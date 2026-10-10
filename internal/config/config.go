package config

import (
	"bufio"
	"os"
	"strings"
)

// LoadDatabaseURL retrieves the Postgres connection string from environment variables,
// checking DB_URL, DATABASE_URL, or local .env file.
func LoadDatabaseURL(explicitURL string) string {
	if explicitURL != "" {
		return explicitURL
	}

	if url := os.Getenv("DB_URL"); url != "" {
		return url
	}
	if url := os.Getenv("DATABASE_URL"); url != "" {
		return url
	}

	// Try reading .env file if present
	loadDotEnv(".env")
	loadDotEnv("../.env")

	if url := os.Getenv("DB_URL"); url != "" {
		return url
	}
	if url := os.Getenv("DATABASE_URL"); url != "" {
		return url
	}

	return ""
}

func loadDotEnv(filepath string) {
	file, err := os.Open(filepath)
	if err != nil {
		return
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := strings.TrimSpace(scanner.Text())
		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}
		parts := strings.SplitN(line, "=", 2)
		if len(parts) == 2 {
			k := strings.TrimSpace(parts[0])
			v := strings.Trim(strings.TrimSpace(parts[1]), "\"'")
			if os.Getenv(k) == "" {
				os.Setenv(k, v)
			}
		}
	}
}
