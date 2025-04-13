import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap; // Callback function for button press
  final String title; // Button title
  final String icon; // Icon asset path
  final bool isSelected; // Whether the tab is selected

  const TabButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 15,
            height: 15,
            color: isSelected ? TColor.primary : TColor.placeholder,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? TColor.primary : TColor.placeholder,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}