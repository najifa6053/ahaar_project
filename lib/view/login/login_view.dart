import 'package:ahaar_project/common/color_extension.dart';
import 'package:ahaar_project/common_widget/round_button.dart';
import 'package:ahaar_project/common_widget/round_icon_button.dart';
import 'package:ahaar_project/common_widget/round_textfiled.dart';
import 'package:ahaar_project/view/login/reset_password_view.dart';
import 'package:ahaar_project/view/login/sing_up_view.dart';
import 'package:ahaar_project/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';

// Ensure this path is correct

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Removed unused variable 'media'
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text(
                "Login",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),

              Text(
                "Add your details to login",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),
              RoundTextfiled(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25),
              RoundTextfiled(
                hintText: "Password",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(height: 25),
              RoundButton(title: "Login", onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: 
                    (context) => const OnBoardingView()),
                  );

              }),
              const SizedBox(height: 4),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => 
                      const ResetPasswordView()
                      ),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "or Login with",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              RoundIconButton(
                title: "Login with Facebook",
                onPressed: () {},
                icon: "assets/image/facebook_logo.png",
                color: const Color(0xff367fc0),
              ),

              const SizedBox(height: 25),

              RoundIconButton(
                title: "Login with Google",
                onPressed: () {},
                icon: "assets/image/google_logo.png",
                color: const Color(0xffDD4B39),
              ),

              const SizedBox(height: 80),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SingUpView()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
