import 'package:flutter/material.dart';
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
              appBar: buildAppbar(),
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //thirdPartyLogin
                  thirdPartyLogin(),
                  //more login options message
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: Text14Normal(
                          text: "Or use your email account to login")),
                  const SizedBox(
                    height: 50,
                  ),
                  //first input text of the login form Email
                  appTextField(title: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  appTextField(title: "password"),
                ],
              ))),
    );
  }
}
