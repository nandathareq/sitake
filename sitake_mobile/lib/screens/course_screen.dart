import 'package:flutter/material.dart';

import '../models/content_model.dart';
import '../models/data.dart';
import '../utils/constants.dart';
import 'video_screen.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget _ContentItem(ContentModel content) {
    Widget widget;
    widget = Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                  child: ListTile(
                title: Text(
                  content.title,
                  style: h4Style,
                ),
                subtitle: Row(children: [
                  Text(content.score.toString()),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[600],
                    size: 20,
                  )
                ]),
              )),
              content.isCompleted
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green[700],
                      size: 40,
                    )
                  : Icon(
                      Icons.navigate_next_rounded,
                      color: Colors.black54,
                      size: 40,
                    )
            ],
          ),
        ));

    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoScreen(videoUrl: content.videoUrl)))
      },
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.75))
                ]),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: h2Style,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style: h5Style,
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: ListView.builder(
                clipBehavior: Clip.hardEdge,
                shrinkWrap: true,
                reverse: true,
                physics: const ClampingScrollPhysics(),
                itemCount: contents.length,
                itemBuilder: (_, index) => _ContentItem(contents[index]),
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
