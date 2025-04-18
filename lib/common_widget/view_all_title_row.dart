import 'package:ahaar_project/common/color_extension.dart';
import 'package:flutter/material.dart';

class ViewAllTitleRow extends StatelessWidget {
  final String title; // Title of the row
  final VoidCallback onView; // Callback for "View All" button

  const ViewAllTitleRow({
    super.key,
    required this.title,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: onView,
          child: Text(
            "View All",
            style: TextStyle(
              color: TColor.primary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
