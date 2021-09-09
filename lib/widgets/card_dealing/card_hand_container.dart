import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';

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
    final log = getLogger('CardHandContainerWidget - build');
    log.info('Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
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
