import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:tic_tac/utils/constants.dart';
import 'package:tic_tac/utils/imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, homeRoute);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeumorphicText(
            'Tic Tac Toe',
            style: NeumorphicStyle(
              depth: 10,
              color: KColors.black,
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: context.width * 0.12,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            ),
          ),
          SizedBox(height: context.height * 0.05),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.08,
            ),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: 8,
                lightSource: LightSource.topLeft,
              ),
              child: NeumorphicProgressIndeterminate(
                height: context.width * 0.07,
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 2),
                reverse: true,
                style: ProgressStyle(
                  accent: KColors.black,
                  variant: KColors.black,
                  depth: 10,
                  borderRadius:
                      BorderRadius.all(Radius.circular(context.width)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
