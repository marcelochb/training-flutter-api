import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/pages/card/detail/cardDetailPage_widget.dart';
import 'package:pocket/src/pages/card/list/cardListPage_widget.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => CardListPage(title: 'Pocket'),
        '/CardDetail': (context) => CardDetailPage()
      },
    );
  }
}
