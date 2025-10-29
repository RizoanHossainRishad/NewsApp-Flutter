import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_first/screens/Auth_screens/welcome_screen.dart';
import 'package:newsapp_first/screens/bottomNav/BottomNav.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // show loader while waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // if logged in -> show bottom nav
        if (snapshot.hasData) {
          return const BottomNav();
        }

        // not logged in -> show welcome/login
        return const WelcomeScreen();
      },
    );
  }
}
