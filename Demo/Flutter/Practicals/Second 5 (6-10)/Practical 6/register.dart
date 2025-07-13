import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  bool _termsAccepted = false;
  String? _selectedCountry;
  final List<String> _countries = ['USA', 'India', 'UK', 'Canada'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Registration')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text('Register', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.person)),
                  validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(Icons.email)),
                  validator: (value) => value!.isEmpty ? 'Enter your email' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (value) => value!.isEmpty ? 'Enter your password' : null,
                ),
                SizedBox(height: 16),
                Text('Gender:', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) => setState(() => _gender = value),
                    ),
                    Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) => setState(() => _gender = value),
                    ),
                    Text('Female'),
                  ],
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Country', prefixIcon: Icon(Icons.public)),
                  value: _selectedCountry,
                  items: _countries
                      .map((country) => DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  ))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedCountry = value),
                  validator: (value) => value == null ? 'Select a country' : null,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _termsAccepted,
                      onChanged: (value) => setState(() => _termsAccepted = value!),
                    ),
                    Expanded(child: Text('I accept the terms and conditions')),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _gender != null && _termsAccepted) {
                      // Handle registration logic
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}