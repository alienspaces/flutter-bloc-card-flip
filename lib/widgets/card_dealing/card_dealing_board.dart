import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_container.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_hand_container.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_shuffling_container.dart';
// import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_dealing_container.dart';

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

        var padding = MediaQuery.of(context).padding;
        double containerWidth = constraints.maxWidth - padding.left - padding.right;
        double containerHeight = constraints.maxHeight - padding.top - padding.bottom;

        log.info('Container width $containerWidth');
        log.info('Container height $containerHeight');

        // Size this container according to the number of cards we want
        // to lay out within the available space.
        int cardsAcross = 3;
        int cardsDown = 3;

        log.info('Cards across $cardsAcross');
        log.info('Cards down $cardsDown');

        // Card containers have an aspect ratio of 4:7 to fit a button that
        // is given 15% of the available vertical space.
        double cardWidth = (constraints.maxWidth / cardsAcross).floorToDouble();
        double cardHeight = ((cardWidth / 4) * 7).floorToDouble();

        log.info('After initial card width $cardWidth');
        log.info('After initial card height $cardHeight');

        if (cardHeight * cardsDown > constraints.maxHeight) {
          cardHeight = (constraints.maxHeight / cardsDown).floorToDouble();
          cardWidth = ((cardHeight / 7) * 4).floorToDouble();
        }

        log.info('After adjust card width $cardWidth');
        log.info('After adjust card height $cardHeight');

        containerWidth = cardWidth * cardsAcross;
        containerHeight = cardHeight * cardsDown;

        log.info('Container width $containerWidth');
        log.info('Container height $containerHeight');

        // Board dimensions are passed to child widgets
        Size boardDimensions = Size(containerWidth, containerHeight);

        // Card dimenions that are passed to child widgets
        Size cardDimensions = Size(cardWidth, cardHeight);

        Widget _buildContent() {
          return Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow, width: 3)),
            child: Stack(
              children: [
                Container(
                  child: CardHandContainerWidget(
                    boardDimensions: boardDimensions,
                    cardDimensions: cardDimensions,
                  ),
                ),
                Container(
                  child: CardDeckContainerWidget(
                    boardDimensions: boardDimensions,
                    cardDimensions: cardDimensions,
                  ),
                ),
                Container(
                  child: CardDeckShufflingContainerWidget(
                    boardDimensions: boardDimensions,
                    cardDimensions: cardDimensions,
                  ),
                ),
                // Positioned(
                //   top: 0,
                //   left: 0,
                //   child: Container(
                //     alignment: Alignment.bottomCenter,
                //     child: CardDeckDealingContainerWidget(
                //       boardDimensions: boardDimensions,
                //       cardDimensions: cardDimensions,
                //     ),
                //   ),
                // )
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
