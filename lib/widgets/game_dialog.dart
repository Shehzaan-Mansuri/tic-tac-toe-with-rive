import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac/utils/imports.dart';
import 'package:tic_tac/widgets/reset_button.dart';

class GameDialog extends StatelessWidget {
  final String message;
  final Function() onPlayAgain;

  const GameDialog({
    super.key,
    required this.message,
    required this.onPlayAgain,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Neumorphic(
              padding: EdgeInsets.symmetric(
                vertical: context.width * 0.02,
              ),
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(context.width * 0.02),
                ),
                depth: 5,
                intensity: 0.5,
                color: const Color(0xFF5F4B43),
              ),
              child: Text(
                'Game Over',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: context.width * 0.07,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.goldman().fontFamily,
                  color: KColors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: context.height * 0.02),
          Lottie.network(
            message.contains('draw')
                ? 'https://lottie.host/82f3e60b-aa5d-48fb-b9d7-af9cad11f51c/9FdVPfQrxz.json'
                : 'https://lottie.host/b9db128a-3f69-4363-b44a-2bd4fafc35b3/W4GE8tyelc.json',
          ),
          SizedBox(height: context.height * 0.02),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.width * 0.1,
              fontWeight: FontWeight.bold,
              color: KColors.black,
            ),
          ),
          SizedBox(height: context.height * 0.02),
          ResetButton(onReset: onPlayAgain, text: 'Play Again')
        ],
      ),

      // actions: [
      //   TextButton(
      //     onPressed: () {
      //       onPlayAgain();
      //     },
      //     child: const Text('Play Again'),
      //   ),
      // ],
    );
  }
}
