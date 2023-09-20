import 'package:page_transition/page_transition.dart';
import 'package:tic_tac/screens/game_screen.dart';
import 'package:tic_tac/screens/splash.dart';
import 'package:tic_tac/utils/constants.dart';

import 'imports.dart';

/// Routes is used to define all the routes in the app and to generate routes for the app
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeRoute:
        return PageTransition(
          child: const OnBoardingScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: const Duration(milliseconds: 800),
        );
      case gameBoardRoute:
        return PageTransition(
          child: const GameScreen(),
          type: PageTransitionType.size,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 400),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                    'No route defined for ${settings.name}',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  )),
                ));
    }
  }
}
