import 'dart:math';

import 'model/card.dart';

abstract class CardRepository {
  /// Throws [NetworkException].
  Future<CardModel> fetchCard();
}

class FakeCardRepository implements CardRepository {
  @override
  Future<CardModel> fetchCard() {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Return "fetched" card
        return CardModel(
          cardNumber: random.nextInt(100),
        );
      },
    );
  }
}

class NetworkException implements Exception {}
