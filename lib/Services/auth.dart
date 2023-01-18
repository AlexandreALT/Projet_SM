import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<User?> get userChanged => _auth.authStateChanges();

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    }catch (e){}
  }

  Future<bool> signIn(String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    on FirebaseException catch (e){
      return false;
    }
  }

  signUp(String name, String email, String password) {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e){
      return false;
    }
  }

  User get user => FirebaseAuth.instance.currentUser!;
}