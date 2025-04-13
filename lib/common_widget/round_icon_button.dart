import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback function for button press
  final String title; // Button title
  final String icon; // Icon asset path
  final Color color; // Background color
  final double fontSize; // Font size for the button text
  final FontWeight fontWeight; // Font weight for the button text

  const RoundIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w500,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: TColor.white,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}