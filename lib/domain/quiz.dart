import 'package:uuid/uuid.dart';

var uuid = Uuid();
class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({
      String? id,
      required this.title,
      required this.choices,
      required this.goodChoice,
      required this.point}) : this.id = id ?? uuid.v4();
}

class Answer {
  final String id;
  final String questionID;
  final String answerChoice;

  Answer({String? id, required this.questionID, required this.answerChoice}) : this.id = id ?? uuid.v4();

  bool isGood(Question question) {
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz {
  String id;
  List<Question> questions;
  List<Player> players = [];

  Quiz({String?id, required this.questions}) : this.id = id ?? uuid.v4();

  void addPlayer(Player player) {
    bool found = false;
    for(Player p in players){
      if(p.name.toLowerCase() == player.name.toLowerCase()){
        p.answers = player.answers;
        found = true;
        break;
      }
    }
    if(!found){
      players.add(player);
    }
  }

  Question? getQuestionByID(String id) {
    return questions.firstWhere((element) => element.id == id);
  }

}

class Player {
  String id;
  String name;
  List<Answer> answers = [];

  Player({String? id,required this.name}) : this.id = id ?? uuid.v4();

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  List<int> getResult(Quiz quiz) {
    int totalScore = 0;
    int totalPoint = 0;
    for (Answer answer in answers) {
      if (answer.isGood(quiz.getQuestionByID(answer.questionID)!)) {
        totalScore += quiz.getQuestionByID(answer.questionID)!.point;
      }
      totalPoint+= quiz.getQuestionByID(answer.questionID)!.point;
    }
    return [((totalScore / totalPoint) * 100).toInt(), totalScore];
  }

  Answer getAnswerByID(String id) {
    return answers.firstWhere((element) => element.id == id);
  }
}
