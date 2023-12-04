import 'package:math_expressions/math_expressions.dart';

List<String> buttonTextList = [
  "C","DEL","%","/",
  "9","8","7","x",
  "6","5","4","-",
  "3","2","1","+",
  "0",".","ANS","="
];

bool isOperator(String index) {
  if(index == "%" || index == "/" || index == "x" ||
      index == "-" || index == "+" || index == "=")
  {
    return true;
  }
  return false;
}

void equalPressed({
  required String userQuestion,
  required String userAnswer,
}){
  String finalQuestion = userQuestion;
  finalQuestion = finalQuestion.replaceAll("x", "*");

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  userAnswer = eval.toString();
}