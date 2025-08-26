import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class AuthScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // ✅ User logged in → go to HomeScreen
          return HomeScreen();
        } else {
          // ✅ Show login screen
          return Scaffold(
            appBar: AppBar(title: Text("Login to SkillCycle")),
            body: Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _auth.signInAnonymously();
                },
                child: Text("Login (Anonymous)"),
              ),
            ),
          );
        }
      },
    );
  }
}
