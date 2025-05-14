import 'package:flutter/material.dart';
import 'package:roll_dice/data/question.dart';
import 'package:roll_dice/widget/AnswerButton.dart';

class QuestionScreen extends StatefulWidget {
  static const String routeName = 'questionScreen';

  const QuestionScreen({super.key,required this.chooseAnswer});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
    int currentIndex = 0;

    void answerQuestion(String answer){
      widget.chooseAnswer(answer);

      setState(() {
        currentIndex++;
      });
    }


  @override
  Widget build(BuildContext context) {

    var currentQuestion = questions[currentIndex];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            style: TextStyle( fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
             
            textAlign: TextAlign.center,
          ), 
          const SizedBox(height: 20),
          ...currentQuestion.options.map((option) {
            return AnswerButton(answerText: option, onPressed:answerQuestion);
          })
                  ],
      ),
    );
  }
}

