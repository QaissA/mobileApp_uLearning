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
import 'package:ulearning_app/pages/signIn/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/pages/signIn/controller/sign_in_controller.dart';
import 'package:ulearning_app/pages/signIn/view/widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _controller = SignInController();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "Login"),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //thirdPartyLogin
                      thirdPartyLogin(),
                      //more login options message
                      SizedBox(
                        height: 15.h,
                      ),
                      const Center(
                          child: Text14Normal(
                        text: "Or use your email account to login",
                        color: AppColors.primaryThreeElementText,
                        isCenter: true,
                      )),
                      SizedBox(
                        height: 50.h,
                      ),
                      //first input text of the login form Email
                      appTextField(
                          controller: _controller.emailController,
                          title: "Email",
                          iconPath: ImageRes.user,
                          hintText: "Enter your Email",
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onEmailChange(value)),
                      SizedBox(
                        height: 20.h,
                      ),
                      appTextField(
                          controller: _controller.passwordController,
                          title: "password",
                          iconPath: ImageRes.lock,
                          hintText: "Enter your Password",
                          obscureText: true,
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onPasswordChange(value)),
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
                      Center(
                          child: appButton(
                              text: "Login",
                              func: () => _controller.handleSignIn(ref))),

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
                                Navigator.pushNamed(context, "/sign_up");
                              })),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
