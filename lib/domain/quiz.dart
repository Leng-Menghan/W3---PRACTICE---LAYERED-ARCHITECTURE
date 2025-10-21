class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      required this.point});
}

class Answer {
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz {
  List<Question> questions;
  List<Player> players = [];

  Quiz({required this.questions});

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
}

class Player {
  String name;
  List<Answer> answers = [];

  Player({required this.name});

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  List<int> getResult() {
    int totalScore = 0;
    int totalPoint = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalScore += answer.question.point;
      }
      totalPoint+= answer.question.point;
    }
    return [((totalScore / totalPoint) * 100).toInt(), totalScore];
  }
}
