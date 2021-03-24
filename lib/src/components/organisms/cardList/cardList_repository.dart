import 'package:dio/dio.dart';
import 'package:pocket/src/components/molecules/cardListItem/cardListItem_model.dart';

class CardRepository {
  final dio = Dio();
  final url = 'https://api.magicthegathering.io/v1/cards';

  Future<List<CardListItemModel>> fetchCards() async {
    final response = await dio.get(url);
    final list = response.data['cards'] as List;

    List<CardListItemModel> cards = [];
    for (var json in list) {
      final card = CardListItemModel.fromJson(json);
      cards.add(card);
    }

    return cards;
  }
}
