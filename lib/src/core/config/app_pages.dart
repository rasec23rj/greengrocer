import 'package:get/get.dart';
import 'package:greengrocer/src/screens/auth/view/sign_in_screens.dart';
import 'package:greengrocer/src/screens/auth/view/sign_up_screens.dart';
import 'package:greengrocer/src/screens/base/base_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => SignInScreens()),
    GetPage(name: Routes.signin, page: () => SignInScreens()),
    GetPage(name: Routes.signup, page: () => SignUpScreens()),
    GetPage(name: Routes.base, page: () => BaseScreen()),
  ];
}

abstract class Routes {
  static const String splash = '/splash';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String base = '/';
}
