import 'package:flutter/material.dart';
import '../widgets/animated_background.dart';
import '../screens/home_screen.dart'; // Import the HomeScreen

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final correctAnswers = ModalRoute.of(context)!.settings.arguments as int;
    final incorrectAnswers = 10 - correctAnswers;

    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Quiz Completed!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'You got',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            '$correctAnswers out of 10',
                            style: TextStyle(
                              color: Color(0xFFFFC107),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'questions correct!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton.icon(
                      icon: Icon(Icons.replay),
                      label: Text('Restart Quiz'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        backgroundColor: Color.fromARGB(255, 240, 122, 38),
                        foregroundColor: Color.fromARGB(255, 244, 240, 240),
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: Color.fromARGB(255, 58, 58, 58).withOpacity(0.5),
                        elevation: 10,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/quiz');
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: Icon(Icons.home),
                      label: Text('Go Home'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        backgroundColor:
                            Colors.white, // Set background to white
                        foregroundColor:
                            Color.fromARGB(255, 21, 21, 21), // Set text color to purple
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadowColor: Colors.white.withOpacity(0.5),
                        elevation: 10,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        ); // Route to the HomeScreen
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
