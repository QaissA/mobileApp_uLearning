import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/app_textFields.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search text box
      Container(
        width: 280,
        height: 40,
        decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w),
              child: appImage(imagePath: ImageRes.searchIcon),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: appTextFieldOnly(
                  height: 40,
                  width: 240,
                  hintText: "Search your course",
                  topPadding: 20),
            )
          ],
        ),
      ),
      //serach button
      GestureDetector(
        onTap: () => {},
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: 40.w,
          height: 40.h,
          decoration:
              appBoxShadow(border: Border.all(color: AppColors.primaryElement)),
          child: appImage(imagePath: ImageRes.filter),
        ),
      )
    ],
  );
}
