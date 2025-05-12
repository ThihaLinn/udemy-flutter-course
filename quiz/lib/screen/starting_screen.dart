import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

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

          OutlinedButton.icon(onPressed: () {},
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