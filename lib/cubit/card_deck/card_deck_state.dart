part of 'card_deck_cubit.dart';

@immutable
abstract class CardDeckState extends Equatable {
  const CardDeckState();
}

class CardDeckInitial extends CardDeckState {
  const CardDeckInitial();

  @override
  List<Object> get props => [];
}

class CardDeckShuffling extends CardDeckState {
  const CardDeckShuffling();

  @override
  List<Object> get props => [];
}

class CardDeckDealing extends CardDeckState {
  final List<CardModel> deck;
  final CardModel card;
  const CardDeckDealing({required this.deck, required this.card});

  @override
  List<Object> get props => [deck, card];
}

class CardDeckReady extends CardDeckState {
  final List<CardModel> deck;
  const CardDeckReady({required this.deck});

  @override
  List<Object> get props => [deck];
}
