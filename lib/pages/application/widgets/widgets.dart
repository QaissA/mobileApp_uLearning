import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/home.png",
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/home.png",
          color: AppColors.primaryElement),
      backgroundColor: Colors.white,
      label: "Home"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/search2.png",
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/search2.png",
          color: AppColors.primaryElement),
      label: "Search"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/play-circle1.png",
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/play-circle1.png",
          color: AppColors.primaryElement),
      label: "play"),
  BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/message-circle.png",
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/message-circle.png",
          color: AppColors.primaryElement),
      label: "message"),
        BottomNavigationBarItem(
      icon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/person2.png",
          color: AppColors.primaryFourElementText),
      activeIcon: _bottomContainer(
          width: 15,
          height: 15,
          imagePath: "assets/icons/person2.png",
          color: AppColors.primaryElement),
      label: "Profile"),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  imagePath = "assets/icons/home.png",
  Color color = AppColors.primaryElement,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: appImageWithColor(imagePath: imagePath, color: color),
  );
}


Widget appScreens(int index) {
  List<Widget> screens=[
    Center( child: appImage(imagePath: "assets/icons/home.png", width: 90.w, height: 90.h) ,),
    Center( child: appImage(imagePath: "assets/icons/search2.png", width: 90.w, height: 90.h) ,),
    Center( child: appImage(imagePath: "assets/icons/play-circle1.png", width: 90.w, height: 90.h) ,),
    Center( child: appImage(imagePath: "assets/icons/message-circle.png", width: 90.w, height: 90.h) ,),
    Center( child: appImage(imagePath: "assets/icons/person2.png", width: 90.w, height: 90.h) ,),
  ];

  return screens[index];
}