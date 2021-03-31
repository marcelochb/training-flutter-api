import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pocket/src/components/organisms/cardList/cardList_widget.dart';
import 'package:pocket/src/pages/signIn/signIn_controller.dart';
import 'package:pocket/src/theme/color_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardListPage extends StatefulWidget {
  @override
  _CardListPageState createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  @override
  Future<SharedPreferences> _localStorage = SharedPreferences.getInstance();
  String userName = '';

  loadData() async {
    final SharedPreferences localStorage = await _localStorage;
    final userName = localStorage.getString('name') ?? '';
    setState(() {
      this.userName = userName;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.loadData();
    super.initState();
  }

  Widget build(BuildContext context) {
    final controller = Provider.of<SignInController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.instance.background,
        title: Observer(builder: (_) {
          return Text(
            userName,
            style: TextStyle(color: ColorTheme.instance.text),
          );
        }),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  controller.signOut();
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
        leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/images/logo.png')),
        leadingWidth: 100,
      ),
      body: CardListWidget(),
    );
  }
}
