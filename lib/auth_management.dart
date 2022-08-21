import 'package:firebase_auth/firebase_auth.dart';
import 'package:kbsc_2022/main.dart';

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
