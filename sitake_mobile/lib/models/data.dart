import 'package:sitake_mobile/models/content_model.dart';
import 'package:sitake_mobile/models/course_model.dart';
import 'package:sitake_mobile/models/question_model.dart';

List<CourseModel> courses = [
  CourseModel(
      title: "sejarah takenaka",
      score: 3,
      image: "https://picsum.photos/200/300",
      isCompleted: false),
  CourseModel(
      title: "filosofi dan visi perusahaan",
      score: 2,
      image: "https://picsum.photos/200/300",
      isCompleted: false),
  CourseModel(
      title: "kode etik perusahaan",
      score: 3,
      image: "https://picsum.photos/200/300",
      isCompleted: false),
  CourseModel(
      title: "Struktur Organisasi",
      score: 5,
      image: "https://picsum.photos/200/300",
      isCompleted: true),
  CourseModel(
      title: "sejarah takenaka",
      score: 3,
      image: "https://picsum.photos/200/300",
      isCompleted: false),
  CourseModel(
      title: "filosofi dan visi perusahaan",
      score: 2,
      image: "https://picsum.photos/200/300",
      isCompleted: false),
  CourseModel(
      title: "kode etik perusahaan",
      score: 3,
      image: "https://picsum.photos/200/300",
      isCompleted: false),
  CourseModel(
      title: "Struktur Organisasi",
      score: 5,
      image: "https://picsum.photos/200/300",
      isCompleted: true),
];

List<ContentModel> contents = [
  ContentModel(
      title: "Awal berdiri Takenaka Corp",
      score: 3.0,
      isCompleted: false,
      videoUrl:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4"),
  ContentModel(
      title: "Takenaka Indonesia",
      score: 3.0,
      isCompleted: true,
      videoUrl:
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
  ContentModel(
      title: "Proyek Ternama di dunia",
      score: 3.0,
      isCompleted: false,
      videoUrl:
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
  ContentModel(
      title: "Proyek Takenaka di Indonesia",
      score: 3.0,
      isCompleted: true,
      videoUrl:
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
  ContentModel(
      title: "Awal berdiri Takenaka Corp",
      score: 3.0,
      isCompleted: true,
      videoUrl:
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
  ContentModel(
      title: "Takenaka Indonesia",
      score: 3.0,
      isCompleted: false,
      videoUrl:
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
  ContentModel(
      title: "Proyek Ternama di dunia",
      score: 3.0,
      isCompleted: true,
      videoUrl:
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
  ContentModel(
      title: "Proyek Takenaka di Indonesia",
      score: 3.0,
      isCompleted: false,
      videoUrl:
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'),
];

List<Question> questions = [
  Question(question: "dimana kantor takenaka?", answers: [
    Answer(answer: "sudirman", isTrue: true),
    Answer(answer: "bintaro", isTrue: false),
    Answer(answer: "ciketing", isTrue: false)
  ]),
  Question(question: "dimana kantor takenaka?", answers: [
    Answer(answer: "sudirman", isTrue: true),
    Answer(answer: "bintaro", isTrue: false),
    Answer(answer: "ciketing", isTrue: false)
  ]),
  Question(question: "dimana kantor takenaka?", answers: [
    Answer(answer: "sudirman", isTrue: true),
    Answer(answer: "bintaro", isTrue: false),
    Answer(answer: "ciketing", isTrue: false)
  ]),
  Question(question: "dimana kantor takenaka?", answers: [
    Answer(answer: "sudirman", isTrue: true),
    Answer(answer: "bintaro", isTrue: false),
    Answer(answer: "ciketing", isTrue: false)
  ])
];
