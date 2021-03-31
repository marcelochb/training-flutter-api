import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pocket/src/components/atoms/button/button_widget.dart';
import 'package:pocket/src/components/atoms/input/input_widget.dart';
import 'package:pocket/src/components/atoms/linkButton/linkButton_widget.dart';
import 'package:pocket/src/pages/signIn/signIn_controller.dart';
import 'package:pocket/src/theme/color_theme.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final passwordField = FocusNode();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignInController>(context);
    return Scaffold(
      body: Container(
        color: ColorTheme.instance.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200, child: Image.asset('assets/images/logo.png')),
              Observer(builder: (_) {
                return InputWidget(
                    label: 'E-mail',
                    onChanged: controller.user.changeEmail,
                    autoFocus: true,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(passwordField);
                    });
              }),
              Observer(builder: (_) {
                return InputWidget(
                  label: 'Password',
                  isSecurityText: true,
                  onChanged: controller.user.changePassword,
                  focusNode: passwordField,
                );
              }),
              SizedBox(height: 30),
              ButtonWidget(
                label: 'Entrar',
                onPress: () async {
                  await controller.signIn();
                },
              ),
              SizedBox(height: 10),
              LinkButtonWidget(
                label: 'Ainda não tem conta? Cadastre-se.',
                onPress: () => Navigator.pushNamed(context, '/SignUp'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
