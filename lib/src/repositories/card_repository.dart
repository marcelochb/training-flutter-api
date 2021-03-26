import 'package:dio/dio.dart';
import 'package:pocket/src/models/card_model.dart';

class CardRepository {
  final dio = Dio();
  final url = 'https://api.magicthegathering.io/v1/cards';

  Future<List<ModelOfCard>> fetchCards() async {
    List<ModelOfCard> cards = [];
    try {
      final response = await dio.get(url);
      final list = response.data['cards'] as List;
      for (var json in list) {
        final card = ModelOfCard.fromJson(json);
        cards.add(card);
      }
    } catch (e) {
      print('erro api $e');
      throw Exception('Problemas para recuperar os dados');
    }

    return cards;
  }

  Future<ModelOfCard> fetchCardById(String id) async {
    ModelOfCard card;
    try {
      final response = await dio.get('$url/$id');
      card = ModelOfCard.fromJson(response.data['card']);
    } catch (e) {
      print('Error api $e');
    }
    return card;
  }
}
