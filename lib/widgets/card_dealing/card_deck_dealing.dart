import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardDeckDealingWidget extends StatefulWidget {
  final Size cardDimensions;

  CardDeckDealingWidget({Key? key, required this.cardDimensions}) : super(key: key);

  @override
  _CardDeckDealingWidgetState createState() => _CardDeckDealingWidgetState();
}

class _CardDeckDealingWidgetState extends State<CardDeckDealingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckDealingWidget - build');
    log.info('Building..');

    return Container(
      width: widget.cardDimensions.width,
      height: widget.cardDimensions.height,
      child: CardWidget(),
    );
  }
}
