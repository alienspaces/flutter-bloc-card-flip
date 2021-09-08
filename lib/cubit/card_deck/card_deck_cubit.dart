import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/data/model/card.dart';

part 'card_deck_state.dart';

// CardDeckCubit manages a list of cards in the deck
class CardDeckCubit extends Cubit<CardDeckState> {
  final CardRepository _cardRepository;
  final int cardCount;
  List<CardModel> deck = [];

  CardDeckCubit(this._cardRepository, this.cardCount) : super(CardDeckInitial());

  Future<void> shuffleDeck() async {
    final log = getLogger('CardDeckCubit - shuffleDeck');

    log.info('Emitting card deck shuffling');
    emit(CardDeckShuffling());

    for (var i = 0; i < this.cardCount; i++) {
      this.deck.add(_cardRepository.create());
    }

    log.info('Emitting card deck ready');
    emit(CardDeckReady(deck: this.deck));
  }

  Future<void> dealCard() async {
    final log = getLogger('CardCubit - dealCard');

    if (this.deck.length == 0) {
      log.info('Deck is empty, cannot deal more cards');
      return;
    }

    CardModel card = this.deck.removeLast();

    log.info('Emitting card deck dealing ${this.deck.length}');
    emit(CardDeckDealing(deck: this.deck, card: card));

    log.info('Emitting card deck ready');
    emit(CardDeckReady(deck: this.deck));
  }
}
