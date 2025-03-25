import 'package:ahaar_project/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTextfiled extends StatelessWidget {

  final TextEditingController ? controller;
  final String  hintText;
  final TextInputType ? keyboardType;
  final bool obscureText;

  const RoundTextfiled(
    {super.key, 
    required this.hintText, 
    this.controller, 
    this.keyboardType,
    this.obscureText = false,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  color: TColor.textfield,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  autocorrect: false, 
                  controller: controller, 
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: TColor.placeholder,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
  }
}