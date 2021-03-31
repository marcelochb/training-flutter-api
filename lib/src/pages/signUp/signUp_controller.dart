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

  @action
  signUp() async {
    try {
      final signUpResponse = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password);

      _users
          .document(signUpResponse.user.uid)
          .setData({
            'name': user.name,
            'email': user.email,
            'uid': signUpResponse.user.uid
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      final tokenResponse = await signUpResponse.user.getIdToken();

      final SharedPreferences localStorage = await _localStorage;
      localStorage.setBool('signed', true);
      localStorage.setString('email', user.email);
      localStorage.setString('name', user.name);
      localStorage.setString('token', tokenResponse.token);
      _navigationService.navigateToReplacement('/CardList');
    } catch (e) {
      print('error $e');
    }
  }
}
