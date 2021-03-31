import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/components/atoms/button/button_widget.dart';
import 'package:pocket/src/components/atoms/input/input_widget.dart';
import 'package:pocket/src/components/atoms/linkButton/linkButton_widget.dart';
import 'package:pocket/src/pages/signUp/signUp_controller.dart';
import 'package:pocket/src/theme/color_theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignUpController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro',
          // style: TextStyle(color: ColorTheme.instance.element),
        ),
        backgroundColor: ColorTheme.instance.background,
        elevation: 0.0,
      ),
      body: Container(
        color: ColorTheme.instance.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputWidget(
                label: 'Nome',
                onChanged: controller.user.changeName,
              ),
              InputWidget(
                label: 'E-mail',
                onChanged: controller.user.changeEmail,
              ),
              InputWidget(
                label: 'Senha',
                isSecurityText: true,
                onChanged: controller.user.changePassword,
              ),
              SizedBox(height: 25),
              ButtonWidget(
                label: 'Salvar',
                onPress: controller.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
