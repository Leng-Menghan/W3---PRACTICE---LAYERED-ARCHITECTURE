import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';
import 'package:my_first_project/data/QuizRepository.dart';
void main() {
  // Path to your quiz JSON file
String filePath = 'D:/CADT Year 3th/Term1/Mobile/Week3/1 - START CODE/lib/data/quiz.json';


  // Load quiz from JSON
  QuizRepository repo = QuizRepository(filePath);
  Quiz quiz = repo.readQuiz();

  setUp(() {});
  
  test("test 1", () {
    Player player = Player(name: "MENGHAN");
    player.addAnswer(Answer(questionID: quiz.questions[0].id, answerChoice: "4"));
    player.addAnswer(Answer(questionID: quiz.questions[1].id, answerChoice: "Blue"));

    // Score should be 60 and Percentage should be 100
    expect(player.getResult(quiz), equals([100, 15]));
  });

  test("test 2", () {
    Player player1 = Player(name: "MENGHAN");
    player1.addAnswer(Answer(questionID: quiz.questions[0].id, answerChoice: "4"));
    player1.addAnswer(Answer(questionID: quiz.questions[1].id, answerChoice: "Blue"));
    quiz.addPlayer(player1);

    Player player2 = Player(name: "Menghan"); 
    player2.addAnswer(Answer(questionID: quiz.questions[0].id, answerChoice: "5"));
    player2.addAnswer(Answer(questionID: quiz.questions[1].id, answerChoice: "Blue"));
    quiz.addPlayer(player2); 

    // Now player2's results
    expect(player1.getResult(quiz), equals([33, 5])); // correct score
  });

}
