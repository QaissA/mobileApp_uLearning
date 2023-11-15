import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

Widget appImage(
    {String imagePath = ImageRes.home,
    double width = 16,
    double height = 16}) {
  return Image.asset(
    imagePath,
    width: width,
    height: height,
  );
}

Widget appImageWithColor(
    {String imagePath = ImageRes.defaultImg,
    double width = 16,
    double height = 16,
    Color color = AppColors.primaryElement}) {
  return Image.asset(
    imagePath,
    width: width,
    height: height,
    color: color,
  );
}
