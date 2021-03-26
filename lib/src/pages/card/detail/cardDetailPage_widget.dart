import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocket/src/components/molecules/cardInfo/cardInfo_widget.dart';
import 'package:pocket/src/components/molecules/foreignNamesListItem/foreignNamesListItem_widget.dart';
import 'package:pocket/src/models/card_model.dart';
import 'package:pocket/src/repositories/card_repository.dart';
import 'package:pocket/src/theme/color_theme.dart';

class CardDetailPage extends StatefulWidget {
  CardDetailPage({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  ModelOfCard card = ModelOfCard();
  final cardRepository = CardRepository();
  bool isLoading = true;

  loadData() async {
    try {
      ModelOfCard _card = await cardRepository.fetchCardById(widget.id);
      setState(() {
        card = _card;
        isLoading = false;
      });
    } catch (e) {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.instance.element,
          title: Text('Detalhes'),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Container(
              color: ColorTheme.instance.element,
            ),
            if (isLoading)
              SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
              )
            else
              ListView(children: [
                Column(children: [
                  CardInfoWidget(
                    item: card,
                    isBackgroundColorWhite: false,
                  ),
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: card.foreignNames.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ForeignNameListItemWidget(
                            item: card.foreignNames[index],
                            isBackgroundColorWhite: true,
                          );
                        }),
                  ),
                ]),
              ]),
          ],
        ));
  }
}
