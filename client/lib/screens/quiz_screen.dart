import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/api_service.dart';
import '../widgets/animated_background.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Question>> _questions;
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  int? _selectedOptionId;
  bool? _isCorrect;

  @override
  void initState() {
    super.initState();
    _questions = ApiService().fetchQuestions();
  }

  void _answerQuestion(int selectedOptionId) {
    _questions.then((questions) {
      setState(() {
        _selectedOptionId = selectedOptionId;
        _isCorrect =
            selectedOptionId == questions[_currentQuestionIndex].correctAnswer;

        if (_isCorrect!) {
          _correctAnswers++;
        }

        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            if (_currentQuestionIndex < questions.length - 1) {
              _currentQuestionIndex++;
              _selectedOptionId = null;
              _isCorrect = null;
            } else {
              Navigator.pushReplacementNamed(context, '/result',
                  arguments: _correctAnswers);
            }
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for light theme
      body: AnimatedBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return FutureBuilder<List<Question>>(
                future: _questions,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 237, 112, 59))); // Purple color
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(
                                color: Colors.red[300], fontSize: 18)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('No questions available',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 18)));
                  } else {
                    final question = snapshot.data![_currentQuestionIndex];

                    double padding = constraints.maxWidth > 800 ? 40 : 20;
                    double textSize = constraints.maxWidth > 800 ? 28 : 24;

                    return Column(
                      children: [
                        LinearProgressIndicator(
                          value: (_currentQuestionIndex + 1) /
                              snapshot.data!.length,
                          backgroundColor: Colors.grey[300],
                          color: Color.fromARGB(255, 233, 106, 37),
                          minHeight: 8,
                        ),
                        Expanded(
                          child: Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white, // Start with white
                                  Colors.white, // End with white
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: padding, vertical: padding),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Question ${_currentQuestionIndex + 1}/${snapshot.data!.length}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  if (question.imageUrl.isNotEmpty)
                                    Container(
                                      constraints: BoxConstraints(
                                        maxHeight: constraints.maxHeight *
                                            0.3, // Limit the height of the image
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Image.network(
                                        question.imageUrl,
                                        fit: BoxFit.contain,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        (loadingProgress
                                                                .expectedTotalBytes ??
                                                            1)
                                                    : null,
                                              ),
                                            );
                                          }
                                        },
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Text(
                                            'Image not available',
                                            style: TextStyle(color: Colors.red),
                                          ); // Handle broken URLs or loading errors
                                        },
                                      ),
                                    )
                                  else
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(
                                          'No image available'), // Or show a placeholder image
                                    ),
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(padding),
                                      decoration: BoxDecoration(
                                        color: _selectedOptionId != null
                                            ? (_isCorrect!
                                                ? Colors.green[100]
                                                : Colors.red[100])
                                            : Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            spreadRadius: 3,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        question.question,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: textSize,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Column(
                                    children: question.options.map((option) {
                                      bool isSelected =
                                          _selectedOptionId == option.id;
                                      bool isCorrectOption =
                                          option.id == question.correctAnswer;

                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8),
                                        width: constraints.maxWidth * 0.8,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: isSelected
                                                ? (isCorrectOption
                                                    ? Colors.green
                                                    : Colors.red)
                                                : Color.fromARGB(255, 224, 115, 26),
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            shadowColor: isSelected
                                                ? (isCorrectOption
                                                    ? Colors.greenAccent
                                                    : Colors.redAccent)
                                                : Colors.black.withOpacity(0.5),
                                            elevation: 8,
                                            side: isSelected
                                                ? BorderSide(
                                                    color: isCorrectOption
                                                        ? Colors.greenAccent
                                                        : Colors.redAccent,
                                                    width: 2,
                                                  )
                                                : BorderSide.none,
                                          ),
                                          onPressed: _selectedOptionId == null
                                              ? () => _answerQuestion(option.id)
                                              : null,
                                          child: Text(
                                            option.text,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
