import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

void main() {
  Question q1 = Question(
      title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", point: 10);
  Question q2 = Question(
      title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", point: 50);

  Quiz quiz = Quiz(questions: [q1, q2]);

  setUp(() {});

  test("test 1", () {
    Player player = Player(name: "MENGHAN");
    player.addAnswer(Answer(question: q1, answerChoice: "2"));
    player.addAnswer(Answer(question: q2, answerChoice: "6"));

    // Score should be 60 and Percentage should be 100
    expect(player.getResult(), equals([100, 60]));
  });

  test("test 2", () {
    Player player1 = Player(name: "MENGHAN");
    player1.addAnswer(Answer(question: q1, answerChoice: "2"));
    player1.addAnswer(Answer(question: q2, answerChoice: "6"));
    quiz.addPlayer(player1);

    Player player2 = Player(name: "Menghan"); 
    player2.addAnswer(Answer(question: q1, answerChoice: "5"));
    player2.addAnswer(Answer(question: q2, answerChoice: "6"));
    quiz.addPlayer(player2); 

    // Now player2's results
    expect(player1.getResult(), equals([83, 50])); // correct score
  });

}
