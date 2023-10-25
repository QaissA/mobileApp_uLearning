import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/appColors.dart';

Widget Text24Normal({required String text, Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color, fontSize: 24, fontWeight: FontWeight.normal),
  );
}

Widget Text16Normal({required String text, Color color= AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color, fontSize: 16, fontWeight: FontWeight.normal),
  );
}

Widget Text14Normal({required String text, Color color= AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        color: color, fontSize: 14, fontWeight: FontWeight.normal),
  );
}
