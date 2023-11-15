import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/pages/signUp/notifier/signup_notifier.dart';
import 'package:ulearning_app/pages/signUp/repo/sign_up_repo.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp() async {
    var state = ref.read(signUpNotifierProvider);

    String name = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (state.username.isEmpty || name.isEmpty) {
      toastInfo("Pls enter your username");
      return;
    }

    if (state.username.length < 6 || name.length < 6) {
      toastInfo("username is too short");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Pls enter your email");
      return;
    }

    if (!state.email.contains("@")) {
      toastInfo("pls write email in the correct forma");
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastInfo("pls enter your password");
      return;
    }

    if (state.rePassword.isEmpty || rePassword.isEmpty) {
      toastInfo("pls enter your confirmation password");
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("password didnt match");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);

    try {
      // final credential = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(email: state.email, password: state.password);
      final credential = await SignUpRepo.firebaseSignUp(email, password);

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);

        toastInfo(
            "an email has been sent to verify your account, pls open that email and confirm your identity");
        context.pop();
      }
    }on FirebaseAuthException catch (e) {
      if(e.code=="weak-password") {
        toastInfo("password is too weak");
      }else if(e.code == 'email-already-in-use') {
        toastInfo("email already used");
      }

      
    } catch(e) {
            if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
