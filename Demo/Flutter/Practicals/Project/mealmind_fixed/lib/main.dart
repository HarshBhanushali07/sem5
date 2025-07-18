import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mealmind/screens/auth/Signupscreen.dart';
import 'firebase_options.dart';

import 'screens/auth/Login_Screen.dart'; // Change this if your login screen is in a different file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealMind',
      debugShowCheckedModeBanner: false,
      home: const Loginscreen(),
    );
  }
}
