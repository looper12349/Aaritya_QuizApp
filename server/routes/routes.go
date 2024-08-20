package routes

import (
    "encoding/json"
    "net/http"
    "api/models"
    "api/database"
)

func GetQuestions(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(database.GetQuestions())
}

func SubmitAnswers(w http.ResponseWriter, r *http.Request) {
    var userAnswers []models.UserAnswer
    err := json.NewDecoder(r.Body).Decode(&userAnswers)
    if err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }

    result := database.CheckAnswers(userAnswers)
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(result)
}