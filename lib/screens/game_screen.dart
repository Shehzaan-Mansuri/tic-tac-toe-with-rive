import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:tic_tac/utils/imports.dart';
import 'package:tic_tac/widgets/game_board.dart';
import 'package:tic_tac/widgets/player_indicator.dart';
import 'package:tic_tac/widgets/reset_button.dart';

import '../widgets/game_dialog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Create a 3x3 grid to represent the Tic Tac Toe board.
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

  // Variable to keep track of the current player (X starts).
  String currentPlayer = 'X';

  // Function to handle button presses (cell taps).
  void handleTap(int row, int col) {
    if (board[row][col] == '' && checkWinner() == null) {
      setState(() {
        board[row][col] = currentPlayer;
        // Toggle to the next player.
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });

      checkWinnerAndShowDialog();
    } else {
      // Show a snackbar if the cell is already occupied.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This cell is already occupied!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.width * 0.04,
                fontWeight: FontWeight.bold,
              )),
          duration: const Duration(milliseconds: 500),
          backgroundColor: KColors.brown,
        ),
      );
    }
  }

  // Function to check if there's a winner and show a dialog.
  void checkWinnerAndShowDialog() {
    String? winner = checkWinner();
    if (winner != null) {
      String message = winner == 'Draw' ? 'It\'s a draw!' : '$winner wins!';

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return GameDialog(
            message: message,
            onPlayAgain: () {
              resetGame();
              Navigator.of(context).pop();
            },
          );
        },
      );
    }
  }

  // Function to check if there's a winner.
  String? checkWinner() {
    // Check rows, columns, and diagonals for a winner...
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != '') {
        return board[i][0];
      }
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != '') {
        return board[0][i];
      }
    }
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != '') {
      return board[0][0];
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != '') {
      return board[0][2];
    }

    // Check for a draw.
    if (!board.any((row) => row.any((cell) => cell == ''))) {
      return 'Draw';
    }

    // No winner yet.
    return null;
  }

  // Function to reset the game.
  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      currentPlayer = 'X';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 8,
              intensity: 0.5,
              color: KColors.scaffoldBackground,
              lightSource: LightSource.topLeft,
            ),
            margin: EdgeInsets.only(left: context.width * 0.02),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the current player's indicator.
            PlayerIndicator(currentPlayer: currentPlayer),

            // Show the current player's name.
            SizedBox(height: context.height * 0.02),
            Text(
              'Current Player: $currentPlayer',
              style: TextStyle(fontSize: context.width * 0.07),
            ).animate().slideY(
                curve: Curves.easeInOut,
                delay: const Duration(milliseconds: 200)),

            // Display the game board.
            SizedBox(height: context.height * 0.02),
            GameBoard(board: board, onCellTap: handleTap),

            // Add spacing.
            SizedBox(height: context.height * 0.05),

            // Display the reset button.
            ResetButton(onReset: resetGame),
          ],
        ),
      ),
    );
  }
}
