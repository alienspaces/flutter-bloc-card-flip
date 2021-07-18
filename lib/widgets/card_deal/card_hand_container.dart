import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';

// The card board lays out a board of cards
class CardHandWidget extends StatefulWidget {
  @override
  _CardHandWidgetState createState() => _CardHandWidgetState();
}

class _CardHandWidgetState extends State<CardHandWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardHandWidget - build');
    log.info('Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        log.info('Constraints container width ${constraints.maxWidth}');
        log.info('Constraints container height ${constraints.maxHeight}');

        double containerWidth = constraints.maxWidth;
        double containerHeight = constraints.maxHeight / 2;

        log.info('Container width $containerWidth');
        log.info('Container height $containerHeight');

        Widget _buildContent() {
          return Container(
            child: Text('Card hand'),
          );
        }

        return Container(
          child: _buildContent(),
        );
      }),
    );
  }
}
