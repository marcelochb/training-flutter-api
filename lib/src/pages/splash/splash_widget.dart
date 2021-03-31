import 'package:flutter/cupertino.dart';
import 'package:pocket/locator.dart';
import 'package:pocket/src/models/user_model.dart';
import 'package:pocket/src/services/navigator_service.dart';
import 'package:pocket/src/theme/color_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  final UserModel user;

  const SplashPage({Key key, this.user}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  Future<SharedPreferences> _localStorage = SharedPreferences.getInstance();

  loadData() async {
    final SharedPreferences localStorage = await _localStorage;
    final userSigned = localStorage.getBool('signed');

    if (userSigned)
      _navigationService.navigateToReplacement('/CardList');
    else
      _navigationService.navigateToReplacement('/SignIn');
  }

  @override
  void initState() {
    // TODO: implement initState
    this.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.instance.background,
      child: Center(
        child: Container(
          width: 400,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
