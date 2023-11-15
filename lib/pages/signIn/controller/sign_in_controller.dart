import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/main.dart';
import 'package:ulearning_app/pages/signIn/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/pages/signIn/repo/sign_in_repo.dart';

class SignInController {

  // WidgetRef ref;

  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);

    String email = state.email;
    String password = state.password;

    print("$email $password");
    print("0");

    emailController.text = email;
    passwordController.text = password;

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

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      
      final credential = await SignInRepo.firebaseSignIn(email, password);

      var user = credential.user;
      if (user == null) {
        toastInfo("User not found");
      }

      if (!user!.emailVerified) {
        toastInfo("you must verify your email");
      }

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity(
          avatar: photoUrl,
          name: displayName,
          email: email,
          open_id: id,
          type: 1,
        );

        asyncPostAllData(loginRequestEntity);
        toastInfo("logged in successfully");
      } else {
        toastInfo("login error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "network-request-failed") {
        toastInfo(
            "Network request failed. Please check your internet connection.");
      }
      if (e.code == "user-not-found") {
        toastInfo("User not found !");
      }
      if (e.code == "wrong-password") {
        toastInfo("password is not correct !");
      }
      if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        toastInfo("invalid credentiels");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    try {
      // var navigator = Navigator.of(ref.context);

      Global.storageService
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode({
            "name" : "qaissa", "email" : "qaissabdelhamid@gmail.com", "age": 27
          }));
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");

      navkey.currentState?.pushNamedAndRemoveUntil("/application", (route) => false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
