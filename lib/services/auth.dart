import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_widgetbook/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser(User user) {
    return UserModel(
        uid: user.uid,
        email: user.email!,
        displayName: user.displayName!,
        password: '');
  }

  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  Future signInAnnon() async {
    try {
      print("Singing in....");
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(email, password) async {
    //try {
    print("Singing in....");
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
/*       UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    } */
  }

  Future signUp(String email, String password) async {
    print("Singing up....");

    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
/*       UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("email: $email");
      print("password: $password");
      print(result);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');

      return null; */
    //}
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getUser() async {
    try {
      User? user = _auth.currentUser;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e);
    }
  }
}
