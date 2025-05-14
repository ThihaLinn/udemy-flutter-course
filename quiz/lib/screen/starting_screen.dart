import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {

  static const  String routeName = 'startingScreen';

  const StartingScreen({super.key,required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return   Center(
      child:Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 30,
        children: [
          Image.asset(
            'assets/images/quiz.jpg',
            width: 300,
          ),
          Text(
            'Learn flutter in fun way',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          OutlinedButton.icon(onPressed: startQuiz,
           icon: Icon(Icons.play_arrow),
           style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            ),
           label: Text(
            'Start Quiz',
            
          ),)
        ],
      )
    );
  }
}