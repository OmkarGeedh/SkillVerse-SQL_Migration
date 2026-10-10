package seeder

// Manifest describes the seed content version and declared files.
type Manifest struct {
	ContentVersion int                 `json:"content_version"`
	Description    string              `json:"description"`
	Entities       map[string][]string `json:"entities,omitempty"`
}

// TopicSeed defines a learning topic.
type TopicSeed struct {
	TopicCode   string `json:"topic_code"`
	Name        string `json:"name"`
	Description string `json:"description,omitempty"`
}

// TopicFile represents the JSON structure for a topics file.
type TopicFile struct {
	Topics []TopicSeed `json:"topics"`
}

// ChapterSeed defines a chapter within a topic.
type ChapterSeed struct {
	ChapterCode string `json:"chapter_code"`
	TopicCode   string `json:"topic_code"`
	Name        string `json:"name"`
	Description string `json:"description,omitempty"`
}

// ChapterFile represents the JSON structure for a chapters file.
type ChapterFile struct {
	Chapters []ChapterSeed `json:"chapters"`
}

// QuestionSeed defines an MCQ, Sudden Death, or other game-mode question.
type QuestionSeed struct {
	QuestionCode  string  `json:"question_code"`
	QuestionType  string  `json:"question_type"`
	TopicID       string  `json:"topic_id"`
	Prompt        string  `json:"prompt"`
	OptionA       string  `json:"option_a"`
	OptionB       string  `json:"option_b"`
	OptionC       string  `json:"option_c"`
	OptionD       string  `json:"option_d"`
	CorrectOption string  `json:"correct_option"`
	Difficulty    int     `json:"difficulty"`
	Points        int     `json:"points"`
	Hint          *string `json:"hint,omitempty"`
	Explanation   *string `json:"explanation,omitempty"`
}

// QuestionFile represents the JSON structure for a questions file.
type QuestionFile struct {
	Questions []QuestionSeed `json:"questions"`
}

// UserProfileSeed defines initial profile metrics and settings.
type UserProfileSeed struct {
	FullName      string `json:"full_name"`
	AvatarID      string `json:"avatar_id"`
	Class         string `json:"class"`
	Board         string `json:"board"`
	Subjects      string `json:"subjects"`
	IsOnboarded   bool   `json:"is_onboarded"`
	Coins         int    `json:"coins"`
	Gems          int    `json:"gems"`
	Experience    int    `json:"experience"`
	Level         int    `json:"level"`
	CurrentStreak int    `json:"current_streak"`
	HighestStreak int    `json:"highest_streak"`
	WeeklyScore   int    `json:"weekly_score"`
}

// UserSeed defines demo accounts for development and testing.
type UserSeed struct {
	Username     string           `json:"username"`
	Email        string           `json:"email"`
	Phone        string           `json:"phone,omitempty"`
	PasswordHash string           `json:"password_hash"`
	RawPassword  string           `json:"raw_password,omitempty"`
	Status       string           `json:"status"`
	Profile      *UserProfileSeed `json:"profile,omitempty"`
}

// UserFile represents the JSON structure for a users file.
type UserFile struct {
	Users []UserSeed `json:"users"`
}
