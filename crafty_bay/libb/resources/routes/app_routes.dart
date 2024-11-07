import 'package:crafty_bay/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:get/get.dart';

import 'routes_name.dart';

class AppRoutes {
  static appRoutes() => [
        //GetPage(name: name, page: page,transition: ,title: ,transitionDuration: )
        GetPage(
          name: RoutesName.splashScreen,
          page: () => SplashScreen(),
        ),
        GetPage(
            name: RoutesName.emailVerificationScreen,
            page: () => EmailVerificationScreen())
      ];
}
