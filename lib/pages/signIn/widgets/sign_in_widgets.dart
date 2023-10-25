import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

AppBar buildAppbar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.red,
        height: 1,
      ),
    ),
    centerTitle: true,
    title: Text16Normal(text: "Login", color: AppColors.primaryText),
  );
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(right: 80, left: 80, top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton(imagePath: "assets/icons/google.png"),
        _loginButton(imagePath: "assets/icons/apple.png"),
        _loginButton(imagePath: "assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton({required String imagePath}) {
  return GestureDetector(
    onTap: () { },
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(imagePath),
    ),
  );
}

Widget appTextField({required String title}) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: title),
        Container(
          width: 325,
          height: 50,
          color: Colors.red,
        )

      ],
    ),
  );
}