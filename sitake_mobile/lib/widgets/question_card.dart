import 'package:flutter/material.dart';

import '../models/question_model.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({Key? key, required this.question, required this.answers})
      : super(key: key);

  final String question;
  final List<Answer> answers;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String _selectedAnswer = "";
  bool isAnswerTrue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.question),
        SizedBox(
          height: 15,
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.answers.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => ListTile(
                title: Text(widget.answers[index].answer),
                leading: Radio(
                  value: widget.answers[index].answer,
                  groupValue: _selectedAnswer,
                  onChanged: ((value) {
                    setState(() {
                      _selectedAnswer = value!;
                      isAnswerTrue = widget.answers[index].isTrue;
                    });
                  }),
                )))
      ],
    );
  }
}
