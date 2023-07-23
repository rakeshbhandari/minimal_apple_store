import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 121, 189, 126);
const kSecondaryColor = Color.fromARGB(255, 0, 0, 0);
const kThirdColor = Color.fromARGB(255, 255, 255, 255);
const kLightBackground = Color.fromARGB(255, 255, 255, 255);
const kWhiteColor = Color.fromARGB(255, 255, 255, 255);
const kBlackColor = Color.fromARGB(255, 0, 0, 0);
const kLightGreen = Color.fromARGB(255, 164, 219, 224);

class AppTheme {
  static const kBigTitle =
      TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold);

  static const kHeadingOne = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const kSeeAll = TextStyle(color: kPrimaryColor);

  static const kBodyText = TextStyle(
    color: Colors.black87,
    fontSize: 12,
  );

  static const kCardTitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}
