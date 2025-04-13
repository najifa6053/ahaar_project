import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahaar_project/common/globs.dart';
import 'package:ahaar_project/common/locator.dart';
import 'package:http/http.dart' as http;

typedef ResSuccess = Future<void> Function(Map<String, dynamic>);
typedef ResFailure = Future<void> Function(dynamic);

class ServiceCall {
  static final NavigationService navigationService = locator<NavigationService>();
  static Map userPayload = {};

  // HTTP POST Request with Firebase Authentication Token
  static void post(Map<String, dynamic> parameter, String path,
      {bool isToken = false, ResSuccess? withSuccess, ResFailure? failure}) {
    Future(() async {
      try {
        var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

        // Add Firebase Authentication token if required
        if (isToken) {
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            String? token = await user.getIdToken();
            headers["Authorization"] = "Bearer $token";
          }
        }

        http
            .post(Uri.parse(path), body: parameter, headers: headers)
            .then((value) {
          if (kDebugMode) {
            print(value.body);
          }
          try {
            var jsonObj =
                json.decode(value.body) as Map<String, dynamic>? ?? {};

            if (withSuccess != null) withSuccess(jsonObj);
          } catch (err) {
            if (failure != null) failure(err.toString());
          }
        }).catchError((e) {
          if (failure != null) failure(e.toString());
        });
      } catch (err) {
        if (failure != null) failure(err.toString());
      }
    });
  }

  // Logout Functionality with Firebase
  static Future<void> logout() async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Clear local user data
      Globs.udBoolSet(false, Globs.userLogin);
      userPayload = {};

      // Navigate to the welcome screen
      navigationService.navigateTo("welcome");
    } catch (e) {
      if (kDebugMode) {
        print("Error during logout: $e");
      }
    }
  }
}