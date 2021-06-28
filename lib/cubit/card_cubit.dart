import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/data/model/card.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  final CardRepository _cardRepository;

  CardCubit(this._cardRepository) : super(CardInitial());

  Future<void> getCard() async {
    try {
      emit(CardFlipping());
      final card = await _cardRepository.fetchCard();
      emit(CardFlipped(card));
    } on NetworkException {
      emit(CardError("Couldn't fetch card"));
    }
  }
}
