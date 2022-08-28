import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kbsc_2022/main.dart';

import 'alert.dart';

class AuthManage {
  Future<bool> signIn(String id, String pw) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: id,
        password: pw,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('email error');
      } else if (e.code == 'wrong-password') {
        print('pw error');
      } else {
        print(e.code);
      }
      return false;
    }
    return true;
  }
}

class SignUpManage{
  // BuildContext context;
  // SignUpManage(required context);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<bool> signIn(String signUpEmail, String signUpPassword, String signUpName, String signUpPhoneNumber, BuildContext context) async {
    try {
      final newUser =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpEmail,
          password: signUpPassword,
      );
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      final user = UserData(id: newUser.user!.uid, name: signUpName, phoneNumber: signUpPhoneNumber);
      final json = user.toJson();
      await firestore.collection('user').doc(newUser.user!.uid).set(json);
      //FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      await CannotSignUP().ShowDialog(context, e.code);
      return false;
    }
    await NomalAlert().ShowDialog(context, "오~하이~");
    return true;
  }
}

class UserData{
  String id;
  final String name;
  final String phoneNumber;

  UserData({
    this.id = '',
    required this.name,
    required this.phoneNumber
  });

  UserData.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      phoneNumber = json['phoneNumber'];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phoneNumber": phoneNumber
  };
}