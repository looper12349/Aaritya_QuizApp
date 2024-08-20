package database

import "api/models"

var questions = []models.Question{
    {
        ID:       1,
        Question: "What is 'blockchain' technology?",
        Options: []models.Option{
            {ID: 1, Text: "A chain of blocks in a file system"},
            {ID: 2, Text: "A decentralized ledger of transactions"},
            {ID: 3, Text: "A type of cryptocurrency"},
            {ID: 4, Text: "A method of data encryption"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/blockchain.jpg", // Valid URL
    },
    {
        ID:       2,
        Question: "What does 'AI' stand for?",
        Options: []models.Option{
            {ID: 1, Text: "Automated Interface"},
            {ID: 2, Text: "Artificial Intelligence"},
            {ID: 3, Text: "Algorithmic Integration"},
            {ID: 4, Text: "Analog Input"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/ai.jpg", // Valid URL
    },
    {
        ID:       3,
        Question: "What is 'machine learning'?",
        Options: []models.Option{
            {ID: 1, Text: "A type of artificial intelligence"},
            {ID: 2, Text: "A programming language"},
            {ID: 3, Text: "A hardware component"},
            {ID: 4, Text: "A type of neural network"},
        },
        CorrectAnswer: 1,
        ImageUrl:      "https://example.com/machine_learning.jpg", // Valid URL
    },
    {
        ID:       4,
        Question: "What is 'cloud computing'?",
        Options: []models.Option{
            {ID: 1, Text: "A software that controls the weather"},
            {ID: 2, Text: "A network of remote servers hosted on the internet"},
            {ID: 3, Text: "A type of computer programming"},
            {ID: 4, Text: "A method of database management"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/cloud_computing.jpg", // Valid URL
    },
    {
        ID:       5,
        Question: "What does 'IoT' stand for?",
        Options: []models.Option{
            {ID: 1, Text: "Internet of Things"},
            {ID: 2, Text: "Information on Technology"},
            {ID: 3, Text: "Integrated Operations Terminal"},
            {ID: 4, Text: "Input/Output Technology"},
        },
        CorrectAnswer: 1,
        ImageUrl:      "https://example.com/iot.jpg", // Valid URL
    },
    {
        ID:       6,
        Question: "Which programming language is known for its use in web development?",
        Options: []models.Option{
            {ID: 1, Text: "Python"},
            {ID: 2, Text: "JavaScript"},
            {ID: 3, Text: "C++"},
            {ID: 4, Text: "Swift"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/javascript.jpg", // Valid URL
    },
    {
        ID:       7,
        Question: "What is 'Big Data'?",
        Options: []models.Option{
            {ID: 1, Text: "A large file size in a computer"},
            {ID: 2, Text: "A vast volume of structured and unstructured data"},
            {ID: 3, Text: "A type of database"},
            {ID: 4, Text: "A method of data encryption"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/big_data.jpg", // Valid URL
    },
    {
        ID:       8,
        Question: "What is the purpose of 'cybersecurity'?",
        Options: []models.Option{
            {ID: 1, Text: "To protect networks, devices, and data from cyberattacks"},
            {ID: 2, Text: "To develop new software applications"},
            {ID: 3, Text: "To create user interfaces"},
            {ID: 4, Text: "To manage cloud storage systems"},
        },
        CorrectAnswer: 1,
        ImageUrl:      "https://example.com/cybersecurity.jpg", // Valid URL
    },
    {
        ID:       9,
        Question: "What is 'Augmented Reality (AR)'?",
        Options: []models.Option{
            {ID: 1, Text: "A virtual reality experience"},
            {ID: 2, Text: "A technology that overlays digital content on the real world"},
            {ID: 3, Text: "A 3D modeling software"},
            {ID: 4, Text: "A type of artificial intelligence"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/ar.jpg", // Valid URL
    },
    {
        ID:       10,
        Question: "What is the function of a 'firewall' in a computer network?",
        Options: []models.Option{
            {ID: 1, Text: "To prevent unauthorized access to or from a private network"},
            {ID: 2, Text: "To store large amounts of data"},
            {ID: 3, Text: "To speed up network performance"},
            {ID: 4, Text: "To monitor internet traffic"},
        },
        CorrectAnswer: 1,
        ImageUrl:      "https://example.com/firewall.jpg", // Valid URL
    },
}

func GetQuestions() []models.Question {
    return questions
}

func CheckAnswers(userAnswers []models.UserAnswer) models.QuizResult {
    var result models.QuizResult

    for _, userAnswer := range userAnswers {
        for _, question := range questions {
            if question.ID == userAnswer.QuestionID {
                if question.CorrectAnswer == userAnswer.AnswerID {
                    result.CorrectAnswers++
                } else {
                    result.IncorrectAnswers++
                }
                break
            }
        }
    }

    return result
}
