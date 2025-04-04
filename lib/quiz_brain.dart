import 'question.dart';

class QuizBrain {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Question> _questions = [
    Question('The sky is blue.', true),
    Question('Cats can fly.', false),
    Question('Flutter is a framework for mobile development.', true),
    Question('The Earth is flat.', false),
    Question('Fish can live out of water.', false),
    Question('The sun rises in the east.', true),
    Question('Humans need oxygen to survive.', true),
    Question('The capital of France is Berlin.', false),
    Question('Water boils at 100 degrees Celsius.', true),
    Question('There are 26 letters in the English alphabet.', true),
  ];

  String getCurrentQuestion() {
    return _questions[_currentQuestionIndex].questionText;
  }

  bool checkAnswer(bool userAnswer) {
    if (userAnswer == _questions[_currentQuestionIndex].answer) {
      _score++;
      return true;
    }
    return false;
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    }
  }

  bool isQuizFinished() {
    return _currentQuestionIndex >= _questions.length - 1;
  }

  int getScore() {
    return _score;
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
  }
}
