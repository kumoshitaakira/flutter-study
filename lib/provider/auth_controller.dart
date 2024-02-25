import 'package:demoapp/custom_exception.dart';
import 'package:demoapp/provider/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<User?> build() async {
    await for (final user
        in ref.read(firebaseAuthProvider).authStateChanges()) {
      return user;
    }
    return null;
  }

  Future<bool> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = (await ref
              .read(firebaseAuthProvider)
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        debugPrint('[Success] Account Created!');
        return true;
      } else {
        debugPrint('[Error] Account Not Created.');
      }
      return false;
    } on FirebaseAuthException catch (e) {
      CustomException(message: e.message);
      return false;
    }
  }

  Future<bool> sighInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = (await ref
              .read(firebaseAuthProvider)
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        debugPrint('[Success] SignIn: $user');
        return true;
      } else {
        debugPrint('[Error] Cannot SignIn.');
      }
      return false;
    } on FirebaseAuthException catch (e) {
      CustomException(message: e.message);
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await ref.read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      CustomException(message: e.message);
    }
  }
}
