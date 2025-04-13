// filepath: d:\Study\MAD\LAB\project\ahaar_project\lib\view\auth\firebase_example_with_icon_button.dart
import 'package:ahaar_project/common_widget/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import '../common_widget/round_icon_button.dart';

class FirebaseExampleWithIconButton extends StatelessWidget {
  FirebaseExampleWithIconButton({super.key});

  void signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign-out successful!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign-out failed: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Example with Icon Button")),
      body: Center(
        child: RoundIconButton(
          title: "Sign Out",
          icon: "assets/img/logout.png", // Replace with your icon asset path
          color: Colors.red,
          onPressed: () => signOut(context),
        ),
      ),
    );
  }
}