import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/view/application.dart';
import 'package:ulearning_app/pages/home/view/home.dart';
import 'package:ulearning_app/pages/signIn/view/sign_in.dart';
import 'package:ulearning_app/pages/signUp/view/sign_up.dart';
import 'package:ulearning_app/pages/welcome/view/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.SIGN_UP, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.Application, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      if (result.isNotEmpty) {
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          bool isLoggedIn = Global.storageService.isLoggedIn();

          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const Application(), settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => const SignIn(), settings: settings);
          }
        } else {
          if (kDebugMode) {
            print("app runs first time");
          }

          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }
      }
    }

    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
