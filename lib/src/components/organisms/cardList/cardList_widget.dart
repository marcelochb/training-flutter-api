import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItem_model.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItm_widget.dart';
import 'package:pocket/src/theme/color_theme.dart';

import '../../../repositories/card_repository.dart';

class CardListWidget extends StatefulWidget {
  CardListWidget({Key key}) : super(key: key);

  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  List<CardListItemModel> cards = [];
  final cardRepository = CardRepository();

  loadData() async {
    List<CardListItemModel> _cards = await cardRepository.fetchCards();
    setState(() {
      cards = _cards;
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (cards.length == 0)
      return SpinKitRotatingCircle(
        color: ColorTheme.instance.element,
        size: 50.0,
      );
    return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return CardListItemWidget(
            item: cards[index],
          );
        });
  }
}
