import 'package:tic_tac/utils/imports.dart';

class GameBoard extends StatelessWidget {
  final List<List<String>> board;
  final Function(int, int) onCellTap;

  const GameBoard({
    super.key,
    required this.board,
    required this.onCellTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (col) {
            return GestureDetector(
              onTap: () {
                onCellTap(row, col);
              },
              child: Container(
                width: context.width * 0.3,
                height: context.width * 0.3,
                margin: EdgeInsets.all(context.width * 0.005),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.width * 0.03),
                  border: Border.all(
                    color: KColors.brown,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: KColors.brown.withOpacity(0.15),
                      blurRadius: 18,
                      offset: const Offset(5, 8),
                    ),
                  ],
                  color: KColors.scaffoldBackground,
                ),
                alignment: Alignment.center,
                child: Text(
                  board[row][col],
                  style: TextStyle(
                    fontSize: context.width * 0.2,
                  ),
                ),
              ).animate().scale(
                    curve: Curves.easeInOut,
                    delay: Duration(milliseconds: 100 * (row + col)),
                  ),
            );
          }),
        );
      }),
    );
  }
}
