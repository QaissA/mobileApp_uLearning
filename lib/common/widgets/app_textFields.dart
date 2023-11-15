import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appTextField({
  required String title,
  required String iconPath,
  String hintText = "hint text",
  bool obscureText = false,
  void Function(String value)? func,
  TextEditingController? controller,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: title),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              //icon in textfield
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconPath),
              ),
              //input of the textfield
              appTextFieldOnly(hintText: hintText, func: func, controller: controller, obscureText: obscureText  )
            ],
          ),
        )
      ],
    ),
  );
}

Widget appTextFieldOnly(
    {TextEditingController? controller,
    String hintText = "hint text",
    double width = 280,
    double height = 0,
    double topPadding = 15,
    void Function(String value)? func,
    bool obscureText = false}) {
  return Container(
    padding: EdgeInsets.only(top: topPadding.h),
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      onChanged: (value) {
        func!(value);
      },
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
    ),
  );
}
