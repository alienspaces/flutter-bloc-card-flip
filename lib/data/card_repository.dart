import 'dart:math';

import 'model/card.dart';

abstract class CardRepository {
  /// Throws [NetworkException].
  CardModel create();
}

class FakeCardRepository implements CardRepository {
  @override
  CardModel create() {
    final random = Random();
    var card = CardModel(
      cardNumber: random.nextInt(100),
    );
    return card;
  }
}

class NetworkException implements Exception {}
