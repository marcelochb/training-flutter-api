import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItem_model.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({Key key, this.item}) : super(key: key);
  final CardListItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text('${item.name}'),
      ),
    );
  }
}
