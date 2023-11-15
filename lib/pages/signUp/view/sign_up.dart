import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/appColors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textFields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/signUp/notifier/signup_notifier.dart';
import 'package:ulearning_app/pages/signUp/controller/signup_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = ref.watch(signUpNotifierProvider);

    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              appBar: buildAppbar(title: "Sign Up"),
              backgroundColor: Colors.white,
              body: loader == false
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Center(
                              child: Text14Normal(
                                  text:
                                      "Enter your details below & free sign up")),
                          SizedBox(
                            height: 50.h,
                          ),
                          //user name input
                          appTextField(
                              title: "Username",
                              iconPath: ImageRes.user,
                              hintText: "Enter your Username",
                              func: (value) => ref
                                  .read(signUpNotifierProvider.notifier)
                                  .onUsernameChange(value)),
                          SizedBox(
                            height: 20.h,
                          ),
                          //input text of the login form Email
                          appTextField(
                            title: "Email",
                            iconPath: ImageRes.user,
                            hintText: "Enter your Email",
                            func: (value) => ref
                                .read(signUpNotifierProvider.notifier)
                                .onEmailChange(value),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          //input for password
                          appTextField(
                              title: "password",
                              iconPath: ImageRes.lock,
                              hintText: "Enter your Password",
                              obscureText: true,
                              func: (value) => ref
                                  .read(signUpNotifierProvider.notifier)
                                  .onPasswordChange(value)),
                          SizedBox(
                            height: 20.h,
                          ),
                          //input for confirming password
                          appTextField(
                              title: "Confirm Password",
                              iconPath: ImageRes.lock,
                              hintText: "Enter your Confirm password",
                              obscureText: true,
                              func: (value) => ref
                                  .read(signUpNotifierProvider.notifier)
                                  .onRePasswordChange(value)),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Text14Normal(
                                  isCenter: false,
                                  text:
                                      "By creating an account you have agree with our them & condition")),
                          SizedBox(
                            height: 100.h,
                          ),
                          //Login button
                          Center(
                              child: appButton(
                                  text: "Sign Up",
                                  func: () => _controller.handleSignUp())),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        color: AppColors.primaryElement,
                      ),
                    ),),),
    );
  }
}
