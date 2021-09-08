import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_container.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_dealing.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_shuffling.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_hand_container.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

// The card board lays out a board of cards
class CardDealingBoardWidget extends StatefulWidget {
  @override
  _CardDealingBoardWidgetState createState() => _CardDealingBoardWidgetState();
}

class _CardDealingBoardWidgetState extends State<CardDealingBoardWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDealingBoardWidget - build');
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

        // TODO: Probably need to determine card size here and pass it
        // down to children so we are recalculating it all the time.
        Widget _buildContent() {
          return Container(
            width: containerWidth,
            height: containerHeight,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    alignment: Alignment.topCenter,
                    width: containerWidth,
                    height: containerHeight / 2,
                    child: CardHandContainerWidget(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    alignment: Alignment.bottomCenter,
                    width: containerWidth,
                    height: containerHeight / 2,
                    child: CardDeckContainerWidget(),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    width: containerWidth,
                    height: containerHeight,
                    alignment: Alignment.bottomCenter,
                    child: CardDeckShufflingWidget(),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    width: containerWidth,
                    height: containerHeight,
                    alignment: Alignment.bottomCenter,
                    child: CardDeckDealingWidget(),
                  ),
                )
              ],
            ),
          );
        }

        return Container(
          child: _buildContent(),
        );
      }),
    );
  }
}
