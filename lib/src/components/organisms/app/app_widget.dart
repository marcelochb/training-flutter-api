import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket/locator.dart';
import 'package:pocket/src/models/user_model.dart';
import 'package:pocket/src/pages/card/detail/cardDetailPage_widget.dart';
import 'package:pocket/src/pages/card/list/cardListPage_widget.dart';
import 'package:pocket/src/pages/signIn/signIn_controller.dart';
import 'package:pocket/src/pages/signIn/signIn_widget.dart';
import 'package:pocket/src/pages/signUp/signUp_controller.dart';
import 'package:pocket/src/pages/signUp/signUp_widget.dart';
import 'package:pocket/src/pages/splash/splash_widget.dart';
import 'package:pocket/src/services/navigator_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SignInController>(
          create: (_) => SignInController(),
        ),
        Provider<SignUpController>(
          create: (_) => SignUpController(),
        ),
        Provider<UserModel>(
          create: (_) => UserModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/SignIn': (context) => SignInPage(),
          '/CardList': (context) => CardListPage(),
          '/CardDetail': (context) => CardDetailPage(),
          '/SignUp': (context) => SignUpPage(),
        },
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
