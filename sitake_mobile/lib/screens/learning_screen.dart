import 'package:flutter/material.dart';
import 'package:sitake_mobile/models/course_model.dart';
import 'package:sitake_mobile/models/data.dart';
import 'package:sitake_mobile/screens/course_screen.dart';
import 'package:sitake_mobile/widgets/input_field.dart';

import '../utils/constants.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  Widget _CourseMenu(CourseModel course) {
    Widget widget;
    widget = Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // add this
          children: <Widget>[
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                course.image,
                fit: BoxFit.fill,
              ),
            )),
            ListTile(
              title: Text(
                course.title,
                style: h4Style,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(course.score.toString()),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                        size: 20,
                      )
                    ],
                  ),
                  course.isCompleted
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green[700],
                          size: 20,
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseScreen(title: course.title)))
      },
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Nanda",
                      style: h1Style,
                    ),
                    Text(
                      "Statistik Pembelajaran",
                      style: h4Style,
                    )
                  ]),
            )),
        Container(
          height: 50,
        ),
        InputField(
          keyboard: TextInputType.text,
          obscure: false,
          hint: "Cari",
          iconData: Icons.search,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const ClampingScrollPhysics(),
              itemCount: courses.length,
              itemBuilder: (_, index) {
                return _CourseMenu(courses[index]);
              },
            ),
          ),
        ),
      ],
    ));
  }
}
