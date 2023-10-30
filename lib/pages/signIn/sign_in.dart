import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textFields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/signIn/widgets/sign_in_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              appBar: buildAppbar(title: "Login"),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //thirdPartyLogin
                    thirdPartyLogin(),
                    //more login options message
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                        child: Text14Normal(
                            text: "Or use your email account to login")),
                    SizedBox(
                      height: 50.h,
                    ),
                    //first input text of the login form Email
                    appTextField(
                        title: "Email",
                        iconPath: "assets/icons/user.png",
                        hintText: "Enter your Email"),
                    SizedBox(
                      height: 20.h,
                    ),
                    appTextField(
                        title: "password",
                        iconPath: "assets/icons/lock.png",
                        hintText: "Enter your Password",
                        obscureText: true),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: TextUnderline(text: "Forgot password ?")),
                    SizedBox(
                      height: 100.h,
                    ),
                    //Login button
                    Center(child: appButton(text: "Login")),

                    SizedBox(
                      height: 10.h,
                    ),
                    //Register button
                    Center(
                        child: appButton(
                            text: "Register",
                            color: AppColors.primaryText,
                            isLogin: false,
                            isBorder: true,
                            func: () {
                              Navigator.pushNamed(context, "/signUp");
                            })),
                  ],
                ),
              ))),
    );
  }
}
