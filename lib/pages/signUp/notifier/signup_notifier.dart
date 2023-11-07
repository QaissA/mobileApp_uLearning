import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/pages/signUp/notifier/signup_state.dart';
part 'signup_notifier.g.dart';

@riverpod
class SignUpNotifier extends _$SignUpNotifier {

  @override
  SignupState build() {
    return SignupState();
  }

  void onUsernameChange(String name) {
    state = state.copyWith(username: name);
  }

    void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  void onRePasswordChange(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }

}