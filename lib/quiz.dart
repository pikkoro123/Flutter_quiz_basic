import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function selectHandler;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz({
    @required this.selectHandler,
    @required this.questions,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => selectHandler(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
