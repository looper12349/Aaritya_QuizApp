class Option {
  final int id;
  final String text;

  Option({required this.id, required this.text});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      text: json['text'],
    );
  }
}

class Question {
  final int id;
  final String question;
  final List<Option> options;
  final int correctAnswer;
  final String imageUrl; // Add this line to include the image URL

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.imageUrl = "", // Default to an empty string
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      options:
          (json['options'] as List).map((o) => Option.fromJson(o)).toList(),
      correctAnswer: json['correct_answer'],
      imageUrl: json['image_url'] ?? "", // Handle null image URLs
    );
  }
}
