import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocket/src/components/organisms/cardList/cardlist_controller.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItm_widget.dart';
import 'package:pocket/src/theme/color_theme.dart';

import '../../../repositories/card_repository.dart';

class CardListWidget extends StatefulWidget {
  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  final cardListController = CardListController();
  final ScrollController _scrollController = new ScrollController();

  loadData() async {
    try {
      await cardListController.getCards();
    } catch (e) {}
  }

  @override
  void initState() {
    this.loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        this.loadData();
      }
    });
    super.initState();
  }

  disposed() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (cardListController.isLoading)
        return SpinKitRotatingCircle(
          color: ColorTheme.instance.element,
          size: 50.0,
        );
      return Stack(
        children: [
          ListView.builder(
              itemCount: cardListController.cards.length,
              controller: _scrollController,
              addAutomaticKeepAlives: false,
              dragStartBehavior: DragStartBehavior.down,
              itemBuilder: (context, index) {
                return CardListItemWidget(
                  item: cardListController.cards[index],
                );
              }),
          if (cardListController.isLoadingCardListItem)
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SpinKitHourGlass(
                  color: ColorTheme.instance.background,
                  size: 50.0,
                ),
              ],
            )),
        ],
      );
    });
  }
}
