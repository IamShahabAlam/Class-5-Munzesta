import 'question.dart';

class QuizBrain {

    int _questionNo = 0;

  List<Question> _questionBank = [
    Question(qtn: 'Pakistan was founded in 1947', ans: true),
    Question(qtn: 'Flutter is maintained by Facebook', ans: false),
    Question(qtn: "Is Munzesta Solution located in Pakistan ?", ans: true),
    Question(qtn: 'Firebase is one of the backend databases for Flutter',ans: true),
    Question(qtn: 'Is E=mc^3 ?', ans: false),
    Question(qtn: "Pakistan Cricket Team has won 2 T20 Worldcups ?", ans: false),
    Question(qtn: 'More CPU cores means slower PC', ans: false),
    Question(qtn: 'Ram makes PC faster', ans: true),
    Question(qtn: 'Laptop has no heating issues', ans: false),
  ] ;

void nextQuestion(){
  if(_questionNo < _questionBank.length - 1){
    _questionNo++;
  }
  print(_questionNo);
  print(_questionBank.length);
}

  String getQuestionText(){
    return _questionBank[_questionNo].questionText;
  }

   bool getCorrectAns() {
     return _questionBank[_questionNo].questionAnswer;
   }

   bool isFinished() {
    if (_questionNo >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNo = 0;
  }
}

