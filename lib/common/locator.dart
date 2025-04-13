import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigate to a specific route
  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  // Push a new route
  Future<dynamic>? navigatePush(Route route) {
    return navigatorKey.currentState?.push(route);
  }

  // Go back to the previous screen
  void goBack() {
    return navigatorKey.currentState?.pop();
  }

  // Navigate to a route only if the user is authenticated
  Future<dynamic>? navigateIfAuthenticated(String routeName) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return navigateTo(routeName);
    } else {
      return navigateTo('/login'); // Redirect to login if not authenticated
    }
  }

  // Check if the user is authenticated
  bool isAuthenticated() {
    return FirebaseAuth.instance.currentUser != null;
  }
}