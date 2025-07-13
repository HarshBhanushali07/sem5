//wap to  add password visibility icon in the textField
import 'package:flutter/material.dart';

class Passwordicon extends StatefulWidget {
  const Passwordicon({super.key});
  @override
  State<Passwordicon> createState() => _PasswordiconState();
}

class _PasswordiconState extends State<Passwordicon> {
  bool passwordV = true;
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Password Visibility",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: password,
                  obscureText: passwordV,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordV = !passwordV;
                        });
                      },
                      icon: Icon(
                        passwordV ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
