import 'package:rive/rive.dart';
import 'package:tic_tac/utils/constants.dart';

import '../utils/imports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const RiveAnimation.asset(
              'assets/rive/tic_tac_toe.riv',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tic Tac Toe.',
                  style: TextStyle(
                    fontSize: context.width * 0.12,
                    color: KColors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  ),
                ),
                Text(
                  'A Classic Game',
                  style: TextStyle(
                    fontSize: context.width * 0.07,
                    color: KColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.height * 0.1),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, gameBoardRoute);
                  },
                  child: Container(
                    width: context.width * 0.7,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.1,
                      vertical: context.height * 0.015,
                    ),
                    decoration: BoxDecoration(
                        color: KColors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: KColors.black.withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 15),
                          ),
                        ]),
                    child: Text(
                      'Play',
                      style: TextStyle(
                        fontSize: context.width * 0.05,
                        color: KColors.scaffoldBackground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
