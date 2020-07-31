import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterapp/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {
      print(e);
      return null;
    }
  }

  Future<User> registerInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {
      print(e);
      return null;
    }
  }

  Future logout() async {
    await _fAuth.signOut();
  }

  Stream<User> get currentUser {
    return _fAuth.onAuthStateChanged.map((user) => user != null ? User.fromFirebase(user) : null);
  }
}
