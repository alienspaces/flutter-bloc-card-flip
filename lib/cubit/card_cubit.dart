import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/data/model/card.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  final CardRepository _cardRepository;
  // late final CardModel card;
  CardModel? card;
  bool cardFlipped = false;

  CardCubit(this._cardRepository) : super(CardInitial()) {
    this.card = _cardRepository.create();
  }

  Future<void> flipCard() async {
    final log = getLogger('CardCubit - flipCard');
    try {
      log.info('Emitting card flipping');
      emit(CardFlipping(card!));
      log.info('Emitted card flipping');
      if (cardFlipped) {
        log.info('Emitting card flipped');
        emit(CardUnflipped(card!));
        log.info('Emitted card flipped');
        cardFlipped = false;
      } else {
        log.info('Fetching card..');
        // Change card
        card = _cardRepository.create();
        log.info('Emitting card flipped');
        emit(CardFlipped(card!));
        log.info('Emitted card flipped');
        cardFlipped = true;
      }
    } on NetworkException {
      emit(CardError("Couldn't fetch card"));
    }
  }
}
