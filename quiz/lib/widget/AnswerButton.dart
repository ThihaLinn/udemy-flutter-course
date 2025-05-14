import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onPressed,
  });

  final void Function(String answer) onPressed;
  final String answerText;

  @override
  Widget build(BuildContext context) {


    return ElevatedButton(
      onPressed: () => onPressed(answerText),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        
      ),
      
      child: Text(answerText,textAlign: TextAlign.center,style: TextStyle(
        color: Colors.white,
        
      ),),
    );
  }
}
