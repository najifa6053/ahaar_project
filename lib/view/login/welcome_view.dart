import 'package:ahaar_project/common/color_extension.dart';
import 'package:ahaar_project/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
                Image.asset(
                  "assets/image/welcome_top_shape.png",
                  width: media.width,
                ),
                Image.asset(
                  "assets/image/AHAAR.png",
                  width: media.width * 0.6,
                  height: media.width * 0.6,
                  fit: BoxFit.contain,
                ),
              ],
          ),

          SizedBox(height: media.height * 0.05),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(title: "Login", onPressed: () {

            },),
          ),
          SizedBox(
            height: 
            media.height * 0.05
            ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(title: "Create An Account",
            type: RoundButtonType.textPrimary, 
            onPressed: () {

            },),
          ),
        ],
      ),
    );
  }
}