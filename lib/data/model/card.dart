import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  final int cardNumber;

  CardModel({
    required this.cardNumber,
  });

  @override
  List<Object> get props => [cardNumber];
}
