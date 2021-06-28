part of 'card_cubit.dart';

@immutable
abstract class CardState extends Equatable {
  const CardState();
}

class CardInitial extends CardState {
  const CardInitial();

  @override
  List<Object> get props => [];
}

class CardFlipping extends CardState {
  const CardFlipping();

  @override
  List<Object> get props => [];
}

class CardFlipped extends CardState {
  final CardModel card;
  const CardFlipped(this.card);

  @override
  List<Object> get props => [card];
}

class CardError extends CardState {
  final String message;
  const CardError(this.message);

  @override
  List<Object> get props => [message];
}
