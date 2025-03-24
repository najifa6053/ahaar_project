import 'package:ahaar_project/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {

  @override
  void initState() {
    super.initState();
    goWelcomePage();
  }


  void goWelcomePage() async{
     await Future.delayed( const Duration(seconds: 3));
    welcomePage();
     
  }
  

  void welcomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeView(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/image/splash_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/image/AHAAR.png",
            width: media.width * 0.6,
            height: media.width * 0.6,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
