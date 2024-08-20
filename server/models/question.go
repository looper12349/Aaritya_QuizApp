package models

type Option struct {
    ID    int    `json:"id"`
    Text  string `json:"text"`
}

type Question struct {
    ID            int      `json:"id"`
    Question      string   `json:"question"`
    Options       []Option `json:"options"`
    CorrectAnswer int      `json:"correct_answer"`
    ImageUrl      string   `json:"image_url"` // Ensure this is non-null
}


type UserAnswer struct {
    QuestionID int `json:"question_id"`
    AnswerID   int `json:"answer_id"`
}

type QuizResult struct {
    CorrectAnswers   int `json:"correct_answers"`
    IncorrectAnswers int `json:"incorrect_answers"`
}


