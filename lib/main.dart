import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizBrain quizBrain = QuizBrain();

  void _answerQuestion(bool userAnswer) {
    setState(() {
      if (quizBrain.checkAnswer(userAnswer)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Correct!')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Wrong!')));
      }

      if (quizBrain.isQuizFinished()) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Quiz Finished'),
                content: Text('Your score: ${quizBrain.getScore()}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      quizBrain.resetQuiz();
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: const Text('Restart'),
                  ),
                ],
              ),
        );
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          // Center the title
          child: Text(
            'Quizzler',
            style: TextStyle(color: Color.fromARGB(255, 255, 24, 3),fontWeight: FontWeight.bold,), // Make the title red
          ),
          
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quizBrain.getCurrentQuestion(),
                style: const TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Green for True button
                ),
                onPressed: () => _answerQuestion(true),
                child: const Text('True'),
              ),
              const SizedBox(height: 10.0), // Add spacing between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Red for False button
                ),
                onPressed: () => _answerQuestion(false),
                child: const Text('False'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
