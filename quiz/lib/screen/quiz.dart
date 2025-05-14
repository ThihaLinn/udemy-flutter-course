
import 'package:flutter/material.dart';
import 'package:roll_dice/data/question.dart';
import 'package:roll_dice/screen/question_scrren.dart';
import 'package:roll_dice/screen/result_screen.dart';
import 'package:roll_dice/screen/starting_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _State();
}

class _State extends State<QuizScreen> {
  String activeScreen = StartingScreen.routeName;

   List<String> selectedAnswers = [];

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultScreen.routeName;
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen.routeName;
    });
  }

  void resetScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartingScreen.routeName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: buildActiveScreen(),
        ),
      ),
    );
  }

  Widget buildActiveScreen() {
    switch (activeScreen) {
      case StartingScreen.routeName:
        return StartingScreen(startQuiz: switchScreen);
      case QuestionScreen.routeName:
        return QuestionScreen(chooseAnswer: chooseAnswer,);
      case ResultScreen.routeName:
        return ResultScreen(resetScreen: resetScreen,chosenAnswers: selectedAnswers,);
      default:
        return StartingScreen(startQuiz: switchScreen);
    }
  }
}
