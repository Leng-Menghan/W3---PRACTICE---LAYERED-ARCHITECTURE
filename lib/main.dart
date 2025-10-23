import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import './data/QuizRepository.dart';

void main() {

  String filePath = 'data/quiz.json';

  QuizRepository repo = QuizRepository(filePath);
  Quiz quiz = repo.readQuiz();

  // Start the quiz console
  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();

}
