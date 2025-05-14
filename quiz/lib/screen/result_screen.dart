import 'package:flutter/material.dart';
import 'package:roll_dice/data/question.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = "resultScreen";

  const ResultScreen(
      {super.key, required this.resetScreen, required this.chosenAnswers});

  final void Function() resetScreen;

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> resultSummary = [];

    for (var i = 0; i < questions.length; i++) {
      resultSummary.add({
        "question_number": i + 1,
        "question": questions[i].question,
        "correct_answer": questions[i].options[questions[i].correctAnswerIndex],
        "chosen_answer": chosenAnswers[i],
        "result": questions[i].options[questions[i].correctAnswerIndex] ==
            chosenAnswers[i]
      });
    }

    var totalQuestion = questions.length;
    var correctAnswerCount = resultSummary.where((result) {
      return result['correct_answer'] == result['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $correctAnswerCount out of $totalQuestion correctly",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(30),
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...resultSummary.map((result) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: (result['result']) == true
                            ? Colors.green
                            : Colors.red,
                        child: Text(
                          result['question_number'].toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(result['question'].toString(),
                          style: TextStyle(color: Colors.white)),
                      subtitle: (result['result'] == true)
                          ? Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                Text(
                                  result['correct_answer'].toString(),
                                  style: TextStyle(color: Colors.green),
                                  softWrap: true,
                                )
                              ],
                            )
                          : Row(
                              spacing: 10,
                              children: [
                                Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                Text(
                                  result['chosen_answer'].toString(),
                                  style: TextStyle(color: Colors.red),
                                  softWrap: true,
                                ),
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                Text(
                                  result['correct_answer'].toString(),
                                  style: TextStyle(color: Colors.green),
                                  softWrap: true,
                                )
                              ],
                            ),
                    );
                  })
                ],
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: resetScreen,
            icon: Icon(Icons.loop_sharp),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white, iconColor: Colors.white),
            label: Text(
              'Restart Quiz',
            ),
          )
        ],
      ),
    );
  }
}
