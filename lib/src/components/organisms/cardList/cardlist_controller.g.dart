// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardListController on _CardListControllerBase, Store {
  final _$cardsAtom = Atom(name: '_CardListControllerBase.cards');

  @override
  ObservableList<ModelOfCard> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<ModelOfCard> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CardListControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadingCardListItemAtom =
      Atom(name: '_CardListControllerBase.isLoadingCardListItem');

  @override
  bool get isLoadingCardListItem {
    _$isLoadingCardListItemAtom.reportRead();
    return super.isLoadingCardListItem;
  }

  @override
  set isLoadingCardListItem(bool value) {
    _$isLoadingCardListItemAtom.reportWrite(value, super.isLoadingCardListItem,
        () {
      super.isLoadingCardListItem = value;
    });
  }

  final _$getCardsAsyncAction = AsyncAction('_CardListControllerBase.getCards');

  @override
  Future getCards() {
    return _$getCardsAsyncAction.run(() => super.getCards());
  }

  final _$_CardListControllerBaseActionController =
      ActionController(name: '_CardListControllerBase');

  @override
  dynamic changeLoading() {
    final _$actionInfo = _$_CardListControllerBaseActionController.startAction(
        name: '_CardListControllerBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_CardListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cards: ${cards},
isLoading: ${isLoading},
isLoadingCardListItem: ${isLoadingCardListItem}
    ''';
  }
}
