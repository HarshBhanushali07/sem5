import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'screens/auth/Login_Screen.dart'; // Make sure path is correct

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  Future<void> logoutUser(BuildContext context) async {
    // firebase logout
    await FirebaseAuth.instance.signOut();

    // also sign out from Google if used
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }

    // go to login screen, clear nav stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const Loginscreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to MealMind'),
        backgroundColor: Colors.yellow.shade700,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logoutUser(context),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Hello, ${user?.email ?? "Guest"}!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
