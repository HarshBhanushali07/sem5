import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../HomeScreen.dart';

// this screen is where new user creates account like name email password thing
class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

// this state is where all the input field and signup logic stuff goes
class _SignupscreenState extends State<Signupscreen> {
  // text fields controller thingy
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // just for that checkbox (not important but looks cool)
  bool isChecked = false;

  // this show little messages at bottom of screen
  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  // when user click that Create Account yellow button
  Future<void> registerUser() async {
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    final confirm = confirmController.text.trim();
    final name = nameController.text.trim();

    // if something not typed then show error
    if (email.isEmpty || pass.isEmpty || confirm.isEmpty || name.isEmpty) {
      showMsg("Please fill in all fields");
      return;
    }

    if (pass != confirm) {
      showMsg("Passwords do not match");
      return;
    }

    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // we store name + email in Firestore (not firebase auth)
      await FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set({
        'name': name,
        'email': email,
      });

      // after sign up go to home screen now directly
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Homescreen()),
      );
    } catch (e) {
      showMsg("Sign up failed: ${e.toString()}");
    }
  }

  // make textfield boxes easily with this
  Widget buildInputField(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  // whole UI here below
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(),
          centerTitle: true,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              buildInputField(nameController, "Name"),
              buildInputField(emailController, "Email"),
              buildInputField(passwordController, "Password", isPassword: true),
              buildInputField(confirmController, "Confirm Password", isPassword: true),

              // that offer updates checkbox thing
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (val) => setState(() => isChecked = val!),
                  ),
                  const Expanded(
                    child: Text("Yes, I want to receive updates and offers."),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text("OR", style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 10),
              const Text("Sign up using", style: TextStyle(fontStyle: FontStyle.italic)),
              const SizedBox(height: 20),

              // google icon thing but no real login here (can add later)
              SizedBox(
                width: 50,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    showMsg("Google Sign-In coming later bro!");
                  },
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

              // create acc button finally
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // already have acc? go login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // goes back to login screen
                    },
                    child: const Text("Login"),
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
