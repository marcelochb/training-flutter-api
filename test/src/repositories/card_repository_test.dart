import 'package:flutter_test/flutter_test.dart';
import 'package:pocket/src/components/organisms/cardList/cardList_repository.dart';

void main() {
  final repository = CardRepository();
  test('To get card list', () async {
    final teste = await repository.fetchCards();
    print(teste[0]);
  });
}
