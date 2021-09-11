import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_hand.dart';

// The card board lays out a board of cards
class CardHandContainerWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardHandContainerWidget({required this.boardDimensions, required this.cardDimensions});

  @override
  _CardHandContainerWidgetState createState() => _CardHandContainerWidgetState();
}

class _CardHandContainerWidgetState extends State<CardHandContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardHandWidget - build');
    log.info('CardHandContainerWidget- Building..');

    return CardHandWidget(
      boardDimensions: widget.boardDimensions,
      cardDimensions: widget.cardDimensions,
    );
  }
}
