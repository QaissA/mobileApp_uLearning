import 'package:riverpod_annotation/riverpod_annotation.dart';
part'home_notifier.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots  extends _$HomeScreenBannerDots {

  @override
  int build() {
    return 0;
  }

  void setIndex(int value) {
    state = value;
  }
}