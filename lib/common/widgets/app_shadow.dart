import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulearning_app/common/utils/appColors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double BrRaduis = 15, 
  double sR = 1,
  double bR = 2,
  double offset = 0.1
  }) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(BrRaduis),
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