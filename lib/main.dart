//import 'package:ahaar_project/view/main_tabview/main_tabview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ahaar_project/view/login/welcome_view.dart';
//import 'package:ahaar_project/view/on_boarding/startup_view.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Metropolis",

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const WelcomeView(),
    );
  }
}
