import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocket/src/models/card_model.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItm_widget.dart';
import 'package:pocket/src/theme/color_theme.dart';

import '../../../repositories/card_repository.dart';

class CardListWidget extends StatefulWidget {
  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  List<ModelOfCard> cards = [];
  final cardRepository = CardRepository();
  bool isLoading = true;

  loadData() async {
    try {
      List<ModelOfCard> _cards = await cardRepository.fetchCards();
      setState(() {
        cards = _cards;
        isLoading = false;
      });
    } catch (e) {
      print('error do widget $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading)
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
