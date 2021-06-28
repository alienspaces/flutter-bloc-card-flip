// TODO: Test whether equatable is going to work here.
class CardModel {
  final int cardNumber;

  CardModel({
    required this.cardNumber,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CardModel && o.cardNumber == cardNumber;
  }

  @override
  int get hashCode => cardNumber.hashCode;
}
