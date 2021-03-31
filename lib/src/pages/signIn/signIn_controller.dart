import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket/locator.dart';
import 'package:pocket/src/models/user_model.dart';
import 'package:pocket/src/services/navigator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'signIn_controller.g.dart';

class SignInController = _SignInController with _$SignInController;

abstract class _SignInController with Store {
  final NavigationService _navigationService = locator<NavigationService>();
  Future<SharedPreferences> _localStorage = SharedPreferences.getInstance();

  final user = UserModel();

  @action
  signIn() async {
    try {
      final signInResponse = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.email, password: user.password);
      final tokenResponse = await signInResponse.user.getIdToken();

      Firestore.instance
          .collection('users')
          .document(signInResponse.user.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          print('Document exists on the database');
          final SharedPreferences localStorage = await _localStorage;
          localStorage.setBool('signed', true);
          localStorage.setString('email', user.email);
          localStorage.setString('token', tokenResponse.token);
          user.changeName(documentSnapshot.data['name']);
          localStorage.setString('name', documentSnapshot.data['name']);
          _navigationService.navigateToReplacement('/CardList');
        }
      });
    } catch (e) {
      print('error $e');
    }
    // user = UserModel(email: user.email, password: user.password, signed: true);
  }

  @action
  signOut() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await _localStorage;
    prefs.setBool('signed', false);
    _navigationService.navigateToReplacement('/');
  }
}
