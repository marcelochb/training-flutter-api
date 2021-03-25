import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocket/src/components/molecules/cardInfo/cardInfo_widget.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItem_model.dart';
import 'package:pocket/src/repositories/card_repository.dart';
import 'package:pocket/src/theme/color_theme.dart';

class CardDetailPage extends StatefulWidget {
  CardDetailPage({Key key, this.id}) : super(key: key);
  final String id;

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  CardListItemModel card = CardListItemModel();
  final cardRepository = CardRepository();

  loadData() async {
    CardListItemModel _card = await cardRepository.fetchCardById(widget.id);
    setState(() {
      card = _card;
    });
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
      body: Stack(children: [
        Container(
          color: ColorTheme.instance.element,
        ),
        if (card.name == '')
          SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          )
        else
          CardInfoWidget(
            item: card,
            isBackgroundColorWhite: false,
          ),
      ]),
    );
  }
}
