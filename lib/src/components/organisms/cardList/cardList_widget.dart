import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItem_model.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItm_widget.dart';

import 'cardList_repository.dart';

class CardList extends StatefulWidget {
  CardList({Key key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
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
    return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return CardListItem(
            item: cards[index],
          );
        });
  }
}
