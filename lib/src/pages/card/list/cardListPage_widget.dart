import 'package:flutter/material.dart';
import 'package:pocket/src/components/organisms/cardList/cardList_widget.dart';
import 'package:pocket/src/theme/color_theme.dart';

class CardListPage extends StatefulWidget {
  CardListPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.instance.background,
        title: Text(
          widget.title,
          style: TextStyle(color: ColorTheme.instance.text),
        ),
        leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/logo.png')),
        leadingWidth: 100,
      ),
      body: CardListWidget(),
    );
  }
}
