import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/theme/color_theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key key, this.label, this.onPress}) : super(key: key);
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorTheme.instance.element),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
          onPressed: onPress,
          child: Container(
            width: double.infinity,
            height: 50,
            child: Text(
              label,
            ),
            alignment: Alignment.center,
          )),
    );
  }
}
