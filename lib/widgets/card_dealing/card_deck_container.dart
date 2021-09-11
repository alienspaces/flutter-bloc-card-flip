import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck.dart';

// The card board lays out a board of cards
class CardDeckContainerWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardDeckContainerWidget({required this.boardDimensions, required this.cardDimensions});

  @override
  _CardDeckContainerWidgetState createState() => _CardDeckContainerWidgetState();
}

class _CardDeckContainerWidgetState extends State<CardDeckContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckWidget - build');
    log.info('CardDeckContainerWidget- Building..');

    Widget _buildContent() {
      log.info(
        'CardDeckContainerWidget- Board width ${widget.boardDimensions.width} height ${widget.boardDimensions.height}',
      );
      log.info(
        'CardDeckContainerWidget- Card width ${widget.cardDimensions.width} height ${widget.cardDimensions.height}',
      );
      return Container(
        child: CardDeckWidget(),
      );
    }

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: widget.boardDimensions.width / 3,
          width: widget.cardDimensions.width,
          height: widget.cardDimensions.height,
          child: _buildContent(),
        ),
      ],
    );
  }
}
