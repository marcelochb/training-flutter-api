import 'package:mobx/mobx.dart';
part 'user_model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {
  static _UserModelBase instance = UserModel();

  @observable
  String name;

  @observable
  String email;

  @observable
  String password;

  @action
  changeEmail(String value) => email = value;

  @action
  changePassword(String value) => password = value;

  @action
  changeName(String value) => name = value;
}
