import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/signIn/notifier/signin_state.dart';

class SignInNotifier extends StateNotifier<SigninState>  {
  SignInNotifier():super(const SigninState());


    void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}

final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SigninState>((ref) => SignInNotifier());