import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_dealing.dart';

// The card board lays out a board of cards
class CardDeckDealingContainerWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardDeckDealingContainerWidget({required this.boardDimensions, required this.cardDimensions});

  @override
  _CardDeckDealingContainerWidgetState createState() => _CardDeckDealingContainerWidgetState();
}

class _CardDeckDealingContainerWidgetState extends State<CardDeckDealingContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckWidget - build');
    log.info('Building..');

    return CardDeckDealingWidget(
      boardDimensions: widget.boardDimensions,
      cardDimensions: widget.cardDimensions,
    );
  }
}
