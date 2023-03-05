import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sitake_mobile/models/data.dart';
import 'package:sitake_mobile/screens/result_screen.dart';
import 'package:sitake_mobile/utils/constants.dart';

import '../widgets/question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget timer({required int timeMinute}) {
    return TweenAnimationBuilder<Duration>(
        duration: Duration(minutes: timeMinute),
        tween: Tween(begin: Duration(minutes: timeMinute), end: Duration.zero),
        onEnd: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ResultScreen()));
        },
        builder: (BuildContext context, Duration value, Widget? child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text('$minutes:$seconds',
                  textAlign: TextAlign.center, style: h3Style));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: "a",
          backgroundColor: Colors.white,
          child: Icon(
            Ionicons.checkmark_done,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ResultScreen()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.timelapse,
              color: Colors.black,
            ),
            timer(timeMinute: 1)
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => QuestionCard(
                    question: questions[index].question,
                    answers: questions[index].answers),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 10,
                    ),
                itemCount: questions.length)),
      ),
    );
  }
}
