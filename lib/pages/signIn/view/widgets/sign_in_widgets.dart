import 'package:flutter/material.dart';



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
    onTap: () {},
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(imagePath),
    ),
  );
}

