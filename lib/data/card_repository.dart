import 'dart:math';

import 'model/card.dart';

abstract class CardRepository {
  /// Throws [NetworkException].
  Future<CardModel> fetchCard();
}

class FakeCardRepository implements CardRepository {
  @override
  Future<CardModel> fetchCard() {
    final random = Random();
    var card = CardModel(
      cardNumber: random.nextInt(100),
    );
    return Future.value(card);
  }
}

class NetworkException implements Exception {}
