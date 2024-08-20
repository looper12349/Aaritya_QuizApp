import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/quiz_screen.dart'; // Import QuizScreen
import 'screens/result_screen.dart'; 
// Import ResultScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Color.fromARGB(255, 252, 252, 252), // Dark purple background
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: SignInScreen(),
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/quiz': (context) => QuizScreen(), // Add QuizScreen route
        '/result': (context) => ResultScreen(), // Add ResultScreen route
      },
    );
  }
}
