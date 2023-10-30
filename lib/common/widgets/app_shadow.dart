import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulearning_app/common/utils/appColors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double BrRaduis = 15, 
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
  }) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(BrRaduis),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0,1)
      )
    ]
  );
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double BrRaduis = 15,
  Color borderColor = AppColors.primaryFourElementText
  }) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(BrRaduis),
    border: Border.all(color: borderColor)
 
  );
}