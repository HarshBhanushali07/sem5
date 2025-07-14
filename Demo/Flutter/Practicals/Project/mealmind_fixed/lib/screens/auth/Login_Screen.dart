import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mealmind/screens/auth/Signupscreen.dart';
import '../../HomeScreen.dart';

// this is login page where user types email pass or google thing
class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

// this do all login logic stuff
class _LoginscreenState extends State<Loginscreen> {
  // for typing email n pass
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // show little error/info below
  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  // this login user using email/pass (normal method)
  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showMsg("Please fill in all fields");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // if login works, go to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Homescreen()),
      );
    } catch (e) {
      showMsg("Login failed. Check your credentials."); // maybe wrong pass
    }
  }

  // this login using google
  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // user cancelled maybe

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // go home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Homescreen()),
      );
    } catch (e) {
      showMsg("Google Sign-In failed"); // maybe internet or firebase setup wrong
    }
  }

  // input fields (makes easier)
  Widget buildInputField(
      TextEditingController controller,
      String label, {
        bool isPassword = false,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // now full UI thing below
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Sign In",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: const BackButton(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              buildInputField(emailController, "Email"),
              buildInputField(passwordController, "Password", isPassword: true),

              // forgot pass (no logic yet)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    showMsg("Reset password coming soon...");
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Text("OR", style: TextStyle(fontSize: 14, color: Colors.black54)),
              const SizedBox(height: 10),
              const Text("Sign In using", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 20),

              // googol circle button (yes i typoed on purpose)
              SizedBox(
                width: 50,
                height: 50,
                child: OutlinedButton(
                  onPressed: loginWithGoogle,
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.grey),
                    padding: EdgeInsets.zero,
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      "https://www.citypng.com/public/uploads/preview/google-logo-icon-gsuite-hd-701751694791470gzbayltphh.png?v=2025061907",
                    ),
                    radius: 20,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // big yellow login btn
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // user no acc? go to signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Need an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Signupscreen()),
                      );
                    },
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
