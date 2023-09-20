import 'package:tic_tac/utils/imports.dart';

class ResetButton extends StatelessWidget {
  final Function() onReset;
  final String text;

  const ResetButton({super.key, required this.onReset, this.text = 'Reset'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onReset,
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
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: context.width * 0.05,
            color: KColors.scaffoldBackground,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ).animate().fade(
          curve: Curves.easeInOut,
          delay: const Duration(milliseconds: 100),
        );
  }
}
