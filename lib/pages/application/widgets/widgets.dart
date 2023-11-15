import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/pages/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.home,
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.home,
          color: AppColors.primaryElement),
      backgroundColor: Colors.white,
      label: "Home"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.search,
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.search,
          color: AppColors.primaryElement),
      label: "Search"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.play,
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.play,
          color: AppColors.primaryElement),
      label: "play"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.message,
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.message,
          color: AppColors.primaryElement),
      label: "message"),
        BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.profilPhoto,
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: ImageRes.profilPhoto,
          color: AppColors.primaryElement),
      label: "Profile"),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  imagePath = "assets/icons/home.png",
  Color color = AppColors.primaryElement,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}


Widget appScreens(int index) {
  List<Widget> screens=[
    const Home(),
    Center( child: appImage(imagePath: ImageRes.search, width: 90.w, height: 90.h) ,),
    Center( child: appImage(imagePath:  ImageRes.play, width: 90.w, height: 90.h) ,),
    Center( child: appImage(imagePath: ImageRes.message, width: 90.w, height: 90.h) ,),
    Center( child: appImage(imagePath: ImageRes.profilPhoto, width: 90.w, height: 90.h) ,),
  ];

  return screens[index];
}