import 'package:tic_tac/utils/constants.dart';
import 'package:tic_tac/utils/imports.dart';
import 'package:tic_tac/utils/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: KColors.scaffoldBackground,
        fontFamily: GoogleFonts.quicksand().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: KColors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: KColors.black,
            fontSize: context.width * 0.08,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: KColors.black),
        ),
      ),
      // home: const OnBoardingScreen(),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: splashRoute,
    );
  }
}
