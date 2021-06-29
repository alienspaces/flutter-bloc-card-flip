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

  CardCubit(this._cardRepository) : super(CardInitial());

  Future<void> flipCard() async {
    final log = getLogger('CardCubit - flipCard');
    try {
      log.info('Emitting card flipping');
      emit(CardFlipping());
      log.info('Emitted card flipping');
      log.info('Fetching card..');
      final card = await _cardRepository.fetchCard();
      log.info('Emitting card flipped');
      emit(CardFlipped(card));
      log.info('Emitted card flipped');
    } on NetworkException {
      emit(CardError("Couldn't fetch card"));
    }
  }
}
