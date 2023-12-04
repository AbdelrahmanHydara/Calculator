import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../../shared/constants/constants.dart';
import 'my_button.dart';
import 'user_text.dart';

class HomeScreenBody extends StatefulWidget
{
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
{
  var userQuestion = "";
  var userAnswer = "";

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
        Expanded(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                UserText(
                  userQuestionOrAnswer: userQuestion , alignment: Alignment.centerLeft,),
                UserText(
                  userQuestionOrAnswer: userAnswer, alignment: Alignment.centerRight,),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
           child: GridView.builder(
             itemCount: buttonTextList.length,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 4
             ),
             itemBuilder: (context,index)
             {
               if(index == 0) {
                 return MyButton(
                   color: Colors.teal,
                   textColor: Colors.white,
                   text: buttonTextList[index],
                   onTap: () {
                     setState(() {
                       userQuestion = "";
                     });
                   },
                 );
               }
               else if(index == 1) {
                 return MyButton(
                   color: Colors.red,
                   textColor: Colors.white,
                   text: buttonTextList[index],
                   onTap: () {
                     setState(() {
                       userQuestion = userQuestion.substring(0,userQuestion.length-1);
                     });
                   },
                 );
               }
               else if(index == buttonTextList.length-1) {
                 return MyButton(
                   color: Colors.deepPurple,
                   textColor: Colors.white,
                   text: buttonTextList[index],
                   onTap: () {
                     setState(() {
                         String finalQuestion = userQuestion;
                         finalQuestion = finalQuestion.replaceAll("x", "*");
                         Parser p = Parser();
                         Expression exp = p.parse(finalQuestion);
                         ContextModel cm = ContextModel();
                         double eval = exp.evaluate(EvaluationType.REAL, cm);
                         userAnswer = eval.toString();
                     });
                   },
                 );
               }
               else if(index == buttonTextList.length-2) {
                 return MyButton(
                   color: Colors.white,
                   textColor: Colors.deepPurple,
                   text: buttonTextList[index],
                   onTap: () {
                     setState(() {
                       userQuestion += userAnswer;
                     });
                   },
                 );
               }
               else {
                 return MyButton(
                   color:  isOperator(buttonTextList[index]) ? Colors.deepPurple :Colors.white,
                   textColor: isOperator(buttonTextList[index]) ? Colors.white : Colors.deepPurple,
                   text: buttonTextList[index],
                   onTap: () {
                     setState(() {
                       userQuestion += buttonTextList[index];
                     });
                   },
                 );
               }
             },
           ),
          ),
        ),
      ],
    );
  }
}
