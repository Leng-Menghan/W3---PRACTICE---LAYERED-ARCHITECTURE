import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Your name:');
      String? userName = stdin.readLineSync();
      if (userName == null || userName == "") {
        print('--- Quiz Finished ---');
        break;
      }
      Player player = Player(name: userName);
      for (var question in quiz.questions) {
        print('Question: ${question.title}');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          player.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }
      }
      quiz.addPlayer(player);
      print('${player.name}, your score in Percentage: ${player.getResult()[0]} %');
      print('${player.name}, your score in Point :${player.getResult()[1]}');
      for (Player player in quiz.players) {
        print('Player: ${player.name}\t\t\tScore: ${player.getResult()[1]}');
      }
    }
  }
}
