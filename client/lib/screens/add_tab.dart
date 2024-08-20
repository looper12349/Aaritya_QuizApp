import 'package:flutter/material.dart';

class AddTab extends StatefulWidget {
  @override
  _AddTabState createState() => _AddTabState();
}

class _AddTabState extends State<AddTab> {
  final _formKey = GlobalKey<FormState>();
  String? _quizTitle;
  String? _quizDescription;
  List<Question> _questions = [];

  void _addQuestion() {
    setState(() {
      _questions.add(Question());
    });
  }

  void _removeQuestion(int index) {
    setState(() {
      _questions.removeAt(index);
    });
  }

  void _submitQuiz() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle quiz submission logic here
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Quiz Submitted!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Quiz'),
        backgroundColor: Colors.white, // White background for AppBar
        titleTextStyle: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quiz Title',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quiz title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quizTitle = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quiz Description',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                onSaved: (value) {
                  _quizDescription = value;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Questions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return QuestionForm(
                    question: _questions[index],
                    onRemove: () => _removeQuestion(index),
                  );
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addQuestion,
                child: Text('Add Question'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Orange color for buttons
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitQuiz,
                child: Text('Submit Quiz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Blue color for submit button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionForm extends StatefulWidget {
  final Question question;
  final VoidCallback onRemove;

  QuestionForm({required this.question, required this.onRemove});

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Question Text',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the question text';
                }
                return null;
              },
              onSaved: (value) {
                widget.question.text = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<QuestionType>(
              value: widget.question.type,
              decoration: InputDecoration(
                labelText: 'Question Type',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              items: QuestionType.values.map((QuestionType type) {
                return DropdownMenuItem<QuestionType>(
                  value: type,
                  child: Text(
                    type == QuestionType.mcq
                        ? 'Multiple Choice (Single Answer)'
                        : 'Multiple Choice (Multiple Answers)',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  widget.question.type = value!;
                });
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Option 1',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              onSaved: (value) {
                widget.question.options[0] = value;
              },
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Option 2',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              onSaved: (value) {
                widget.question.options[1] = value;
              },
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Option 3',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              onSaved: (value) {
                widget.question.options[2] = value;
              },
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Option 4',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
              onSaved: (value) {
                widget.question.options[3] = value;
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: widget.onRemove,
                  child: Text('Remove Question'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  String? text;
  QuestionType type = QuestionType.mcq;
  List<String?> options = List.filled(4, null);

  Question({this.text});
}

enum QuestionType { mcq, multipleAnswer }

void main() {
  runApp(MaterialApp(
    home: AddTab(),
    theme: ThemeData.light().copyWith(
      scaffoldBackgroundColor:
          Colors.white, // White background for the scaffold
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Poppins', // Font family to match the theme
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
    ),
  ));
}
