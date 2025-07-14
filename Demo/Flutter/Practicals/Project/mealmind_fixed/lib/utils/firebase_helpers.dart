import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<User?> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': name,
        'email': email,
      });
    }
    return user;
  }

  static Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  static User? get currentUser => _auth.currentUser;

  static Future<void> logout() async {
    await _auth.signOut();
  }
}
