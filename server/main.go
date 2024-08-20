package main

import (
    "net/http"
    "api/routes"
    "github.com/gorilla/mux"
    "github.com/rs/cors"
)

func CreateHandler() http.Handler {
    r := mux.NewRouter()

    r.HandleFunc("/api/questions", routes.GetQuestions).Methods("GET")
    r.HandleFunc("/api/submit", routes.SubmitAnswers).Methods("POST")

    c := cors.New(cors.Options{
        AllowedOrigins: []string{"*"},
        AllowedMethods: []string{"GET", "POST", "OPTIONS"},
        AllowedHeaders: []string{"Content-Type"},
        AllowCredentials: true,
    })

    return c.Handler(r)
}

// Handler is the main entry point for Vercel
func Handler(w http.ResponseWriter, r *http.Request) {
    handler := CreateHandler()
    handler.ServeHTTP(w, r)
}

func main() {
    // This is only used when running the server locally
    http.ListenAndServe(":8080", CreateHandler())
}