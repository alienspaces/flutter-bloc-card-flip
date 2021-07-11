import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';

// The card board lays out a board of cards
class CardDealWidget extends StatefulWidget {
  @override
  _CardDealWidgetState createState() => _CardDealWidgetState();
}

class _CardDealWidgetState extends State<CardDealWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDealWidget - build');
    log.info('Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        log.info('Constraints container width ${constraints.maxWidth}');
        log.info('Constraints container height ${constraints.maxHeight}');

        double containerWidth = constraints.maxWidth;
        double containerHeight = constraints.maxHeight;

        log.info('Container width $containerWidth');
        log.info('Container height $containerHeight');

        Widget _buildBoard() {
          return Container(
            child: Text('Dealer'),
          );
        }

        return Container(
          width: containerWidth,
          height: containerHeight,
          child: _buildBoard(),
        );
      }),
    );
  }
}
