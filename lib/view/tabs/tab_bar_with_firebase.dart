// filepath: d:\Study\MAD\LAB\project\ahaar_project\lib\view\tabs\tab_bar_with_firebase.dart
import 'package:ahaar_project/common_widget/tab_button.dart';
import 'package:ahaar_project/view/auth/firebase_example_with_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabBarWithFirebase extends StatefulWidget {
  const TabBarWithFirebase({super.key});

  @override
  State<TabBarWithFirebase> createState() => _TabBarWithFirebaseState();
}

class _TabBarWithFirebaseState extends State<TabBarWithFirebase> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirebaseExampleWithIconButton()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tab Bar with Firebase")),
      body: Center(
        child: Text("Selected Tab: $selectedIndex"),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TabButton(
            title: "Home",
            icon: "assets/img/home.png",
            isSelected: selectedIndex == 0,
            onTap: () => onTabSelected(0),
          ),
          TabButton(
            title: "Sign Out",
            icon: "assets/img/logout.png",
            isSelected: selectedIndex == 1,
            onTap: () => onTabSelected(1),
          ),
        ],
      ),
    );
  }
}