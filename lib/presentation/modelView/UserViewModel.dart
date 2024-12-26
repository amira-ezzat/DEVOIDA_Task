import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  UserViewModel() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      // Create the user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user = userCredential.user;

      // Update the user profile with the name
      await _user?.updateDisplayName(name);

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
