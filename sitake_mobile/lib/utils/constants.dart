import 'package:flutter/material.dart';

extension StringExtension on String {
  String get addOverFlow {
    if (length < 15) {
      return this;
    } else {
      return "${substring(0, 15)}...";
    }
  }
}

// Colors
const kBackgroundColor = Color(0xFFD2FFF4);
const kPrimaryColor = Color(0xFF2D5D70);
const kSecondaryColor = Color(0xFF265DAB);
const lightOrange = Color(0xFFFAA33C);

const h1Style = TextStyle(
    fontSize: 50,
    color: Colors.black,
    fontFamily: "Poppins",
    height: 1.4,
    fontWeight: FontWeight.w700);

const h2Style = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600);

const h3Style = TextStyle(
    fontFamily: "Poppins",
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black);

const h4Style = TextStyle(
    fontFamily: "Poppins",
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black);

const h5Style = TextStyle(
    fontFamily: "Poppins",
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.black);

final textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
);

const String logo = "lib/assets/images/logo.png";

const String loading = "lib/assets/animations/loading.json";
