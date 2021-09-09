import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardDeckShufflingWidget extends StatefulWidget {
  final Size cardDimensions;

  CardDeckShufflingWidget({Key? key, required this.cardDimensions}) : super(key: key);

  @override
  _CardDeckShufflingWidgetState createState() => _CardDeckShufflingWidgetState();
}

class _CardDeckShufflingWidgetState extends State<CardDeckShufflingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckShufflingWidget - build');
    log.info('Building..');

    return Container(
      width: widget.cardDimensions.width,
      height: widget.cardDimensions.height,
      child: CardWidget(),
    );
  }
}
