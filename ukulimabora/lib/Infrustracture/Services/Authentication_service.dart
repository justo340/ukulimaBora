import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
 AuthenticationService({required this.firebaseAuth});
  final FirebaseAuth firebaseAuth;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<String?> signIn({required String email, required String password}) async{
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password,);
      return 'Signed In';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password,);
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
