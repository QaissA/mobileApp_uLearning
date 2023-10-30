import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/appColors.dart';

Widget Text24Normal(
    {required String text, Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.normal),
  );
}

Widget Text16Normal(
    {required String text,
    Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal),
  );
}

Widget Text14Normal(
    {required String text, Color color = AppColors.primaryThreeElementText, bool isCenter=true}) {
  return Text(
    text,
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.normal),
  );
}

Widget TextUnderline({String text = "", Color color = AppColors.primaryText, Color underlineColors = AppColors.primaryText}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        color: color,
        decoration: TextDecoration.underline,
        decorationColor: underlineColors,
        fontWeight: FontWeight.normal,
        fontSize: 12
        ),
    ),
  );
}
