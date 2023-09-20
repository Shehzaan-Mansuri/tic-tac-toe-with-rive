import 'package:tic_tac/utils/imports.dart';

class PlayerIndicator extends StatelessWidget {
  final String currentPlayer;

  const PlayerIndicator({super.key, required this.currentPlayer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: context.width * 0.15,
            height: context.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPlayer == 'X'
                  ? KColors.brown
                  : KColors.scaffoldBackground,
              border: Border.all(
                color: KColors.brown,
                width: 4,
              ),
            ),
            child: Center(
              child: Text(
                'X',
                style: TextStyle(
                  fontSize: context.width * 0.1,
                  fontWeight: FontWeight.bold,
                  color: currentPlayer == 'X'
                      ? KColors.scaffoldBackground
                      : KColors.brown,
                ),
              ),
            ),
          ),
          Container(
            width: context.width * 0.15,
            height: context.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPlayer == 'O'
                  ? KColors.brown
                  : KColors.scaffoldBackground,
              border: Border.all(
                color: KColors.brown,
                width: 4,
              ),
            ),
            child: Center(
              child: Text(
                'O',
                style: TextStyle(
                  fontSize: context.width * 0.1,
                  fontWeight: FontWeight.bold,
                  color: currentPlayer == 'O'
                      ? KColors.scaffoldBackground
                      : KColors.brown,
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().slideX(
          curve: Curves.easeInOut,
          delay: const Duration(milliseconds: 100),
        );
  }
}
