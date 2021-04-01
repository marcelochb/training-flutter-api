import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket/locator.dart';
import 'package:pocket/src/models/user_model.dart';
import 'package:pocket/src/services/navigator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'signUp_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final NavigationService _navigationService = locator<NavigationService>();
  Future<SharedPreferences> _localStorage = SharedPreferences.getInstance();
  CollectionReference _users = Firestore.instance.collection('users');
  final user = UserModel();

  Future<AuthResult> _createUserInAuthFirebase() {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
  }

  void _createUserToDatabaseFirebase(AuthResult signUpResponse) {
    _users
        .document(signUpResponse.user.uid)
        .setData({
          'name': user.name,
          'email': user.email,
          'uid': signUpResponse.user.uid
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void _persistDataAtLocalStorage(IdTokenResult tokenResponse) async {
    final SharedPreferences localStorage = await _localStorage;
    localStorage.setBool('signed', true);
    localStorage.setString('email', user.email);
    localStorage.setString('name', user.name);
    localStorage.setString('token', tokenResponse.token);
  }

  void _navigateToCardlistPage() {
    _navigationService.navigateToReplacement('/CardList');
  }

  @action
  signUp() async {
    try {
      final signUpResponse = await _createUserInAuthFirebase();

      _createUserToDatabaseFirebase(signUpResponse);

      final tokenResponse = await signUpResponse.user.getIdToken();

      _persistDataAtLocalStorage(tokenResponse);

      _navigateToCardlistPage();
    } catch (e) {
      print('error $e');
    }
  }
}
