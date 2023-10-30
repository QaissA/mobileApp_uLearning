import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/signUp/sign_up.dart';

Widget appButton({
  String text="text here", 
  Color color = Colors.white,
  double width = 325,
  double height = 50,
  bool isLogin=true,
  bool isBorder=false,
  void Function()? func,
  }) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
        color: isLogin? AppColors.primaryElement : Colors.white,
        border: isBorder ?Border.all(color: AppColors.primaryFourElementText ) : Border.all(color: Colors.transparent)
      ),
      child: Center(child: Text16Normal(text: text, color: color)),
    ),
  );
}