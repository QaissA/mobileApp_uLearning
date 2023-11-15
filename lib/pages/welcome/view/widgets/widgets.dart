import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/signIn/view/sign_in.dart';

Widget appOnboardingPage(BuildContext context,PageController controller,
    {String imagePath = "assets/images/reading.png",
    String title = "",
    String subtitle = "",
    index = 0}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Text24Normal(text: title),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Text16Normal(text: subtitle),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: Duration(milliseconds: 600), 
            curve: Curves.easeIn);
      }else{
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, "/sign_in");
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignIn()));
      }
    },
    child: Container(
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      width: 325,
      height: 50,
      decoration: appBoxShadow(),
      child: Center(
        child: Text16Normal(text: index < 3 ? "Next" : "Get Started", color: Colors.white),
      ),
    ),
  );
}
