import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_shuffling.dart';

// The card board lays out a board of cards
class CardDeckShufflingContainerWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardDeckShufflingContainerWidget({required this.boardDimensions, required this.cardDimensions});

  @override
  _CardDeckShufflingContainerWidgetState createState() => _CardDeckShufflingContainerWidgetState();
}

class _CardDeckShufflingContainerWidgetState extends State<CardDeckShufflingContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckShufflingContainerWidget');
    log.info('CardDeckShufflingContainerWidget - Building..');

    return CardDeckShufflingWidget(
      boardDimensions: widget.boardDimensions,
      cardDimensions: widget.cardDimensions,
    );
  }
}
