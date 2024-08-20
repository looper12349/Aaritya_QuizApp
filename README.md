# Aaritya QuizApp

Aaritya QuizApp is a comprehensive quiz application developed with Flutter for the client-side and Go for the server-side. This app enables users to participate in quizzes, view leaderboards, and manage their profiles with a modern and intuitive design optimized for both Android and iOS devices.

## Demo Video

[Watch the Demo Video](https://drive.google.com/file/d/18spTEzc0i9zIHAJPYpirKomKz3y_ed3X/view?usp=sharing) 

## Features

- **Home Screen**: Displays the user's greeting, recent quizzes, live quizzes, and a navigation bar for easy access to other features.
- **Quiz Screen**: Allows users to take quizzes related to various topics such as market analysis and technical indicators.
- **Leaderboard**: Shows the ranking of users based on their quiz scores.
- **Profile Management**: Users can view and edit their profile information.
- **Server Integration**: Backend written in Go, handling user authentication, quiz management, and leaderboard updates.
- **Real-time Data**: Provides real-time updates for quiz questions and user scores.

## Screens

### Home Screen

- Displays greeting, recent quizzes, live quizzes, and allows navigation to other tabs.
- Contains a "Start Quiz" button on each quiz item that navigates to the quiz screen.

### Quiz Screen

- Users can take quizzes on various topics. This screen is accessed by clicking the "Start Quiz" button from the Home Screen.

## Project Structure

### Client (Flutter)

- **lib/**: Contains the main application code.
  - `main.dart`: Entry point of the application.
  - `screens/`: Contains different screen widgets.
  - `models/`: Data models for quizzes and user profiles.
  - `services/`: API services for communicating with the Go backend.
  - `widgets/`: Reusable widgets used throughout the app.
- **assets/**: Contains images and other assets used in the app.
- **pubspec.yaml**: Lists the dependencies and configurations for the Flutter project.

### Server (Go)

- **cmd/**: Contains the main application entry point.
- **pkg/**: Contains reusable packages and modules.
  - `handlers/`: HTTP request handlers for quiz and user management.
  - `models/`: Data models and database interactions.
  - `services/`: Business logic for handling quizzes and user profiles.
- **config/**: Configuration files for server settings.
- **go.mod**: Module dependencies for the Go project.
- **main.go**: Entry point of the Go server application.

## Installation & Usage

### Client (Flutter)

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/looper12349/Aaritya_QuizApp.git
    cd Aaritya_QuizApp
    ```

2. **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the Application**:
    ```bash
    flutter run
    ```

### Server (Go)

1. **Clone the Server Repository**:
    ```bash
    git clone https://github.com/looper12349/Aaritya_QuizApp_Server.git
    cd Aaritya_QuizApp_Server
    ```

2. **Install Dependencies**:
    ```bash
    go mod tidy
    ```

3. **Run the Server**:
    ```bash
    go run main.go
    ```

4. **Configuration**:
   - Update server configuration in the `config/` directory as needed (e.g., database connection settings).

## Customization

- **Theme Customization**: Modify `lib/theme/` to adjust the app’s appearance.
- **Quiz Content**: Update quiz questions and answers in the server’s database or configuration files.
- **API Endpoints**: Adjust API endpoints and methods in the `lib/services/` directory to match any changes in the server.

## Contributing

Contributions are welcome! If you would like to contribute to Aaritya QuizApp, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/) for the powerful framework to build the client-side application.
- [Go](https://golang.org/) for providing a robust backend solution.
- [Your Contributors] for their valuable contributions.

## Contact

For any questions or support, please reach out to [amriteshindal29@gmail.com](mailto:amriteshindal29@gmail.com).

