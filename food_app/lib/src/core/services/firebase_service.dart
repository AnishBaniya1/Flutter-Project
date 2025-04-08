import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      print("Attempting to sign in: $emailAddress");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print("Login successful: ${credential.user?.email}");
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print("Sending Mail");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      }
    }
  }

  delete() async {
    // await user?.delete();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
