import 'package:mobx/mobx.dart';
import 'package:pocket/src/models/card_model.dart';
import 'package:pocket/src/repositories/card_repository.dart';
part 'cardlist_controller.g.dart';

class CardListController = _CardListControllerBase with _$CardListController;

abstract class _CardListControllerBase with Store {
  final cardRepository = CardRepository();

  @observable
  ObservableList<ModelOfCard> cards = <ModelOfCard>[].asObservable();

  int _currentCardListPage = 1;

  @observable
  bool isLoading = true;

  @observable
  bool isLoadingCardListItem = false;

  @action
  changeLoading() => isLoading = !isLoading;

  @action
  getCards() async {
    if (_currentCardListPage > 1) isLoadingCardListItem = true;

    List<ModelOfCard> _cardListFormApi =
        await cardRepository.fetchCards(initialPage: _currentCardListPage);
    _currentCardListPage++;
    ObservableList<ModelOfCard> _cardListAsObservable =
        _cardListFormApi.asObservable();
    for (var item in _cardListAsObservable) {
      cards.add(item);
    }
    isLoading = false;
    isLoadingCardListItem = false;
  }
}
