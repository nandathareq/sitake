import 'package:flutter/material.dart';
import 'package:sitake_mobile/screens/Quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("90"),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.restart_alt,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => QuizScreen()));
              }),
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
