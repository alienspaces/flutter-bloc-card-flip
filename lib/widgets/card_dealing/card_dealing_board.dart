import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
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
    log.info('CardDealingBoardWidget - Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        log.info('CardDealingBoardWidget - Constraints container width ${constraints.maxWidth}');
        log.info('CardDealingBoardWidget - Constraints container height ${constraints.maxHeight}');

        var padding = MediaQuery.of(context).padding;
        double containerWidth = constraints.maxWidth - padding.left - padding.right;
        double containerHeight = constraints.maxHeight - padding.top - padding.bottom;

        log.info('CardDealingBoardWidget - Container width $containerWidth');
        log.info('CardDealingBoardWidget - Container height $containerHeight');

        // Size this container according to the number of cards we want
        // to lay out within the available space.
        int cardsAcross = 3;
        int cardsDown = 3;

        log.info('CardDealingBoardWidget - Cards across $cardsAcross');
        log.info('CardDealingBoardWidget - Cards down $cardsDown');

        // Card containers have an aspect ratio of 4:7 to fit a button that
        // is given 15% of the available vertical space.
        double cardWidth = (constraints.maxWidth / cardsAcross).floorToDouble();
        double cardHeight = ((cardWidth / 4) * 7).floorToDouble();

        log.info('CardDealingBoardWidget - After initial card width $cardWidth');
        log.info('CardDealingBoardWidget - After initial card height $cardHeight');

        if (cardHeight * cardsDown > constraints.maxHeight) {
          cardHeight = (constraints.maxHeight / cardsDown).floorToDouble();
          cardWidth = ((cardHeight / 7) * 4).floorToDouble();
        }

        log.info('CardDealingBoardWidget - After adjust card width $cardWidth');
        log.info('CardDealingBoardWidget - After adjust card height $cardHeight');

        containerWidth = cardWidth * cardsAcross;
        containerHeight = cardHeight * cardsDown;

        log.info('CardDealingBoardWidget - Container width $containerWidth');
        log.info('CardDealingBoardWidget - Container height $containerHeight');

        // Board dimensions are passed to child widgets
        Size boardDimensions = Size(containerWidth, containerHeight);

        // Card dimenions that are passed to child widgets
        Size cardDimensions = Size(cardWidth, cardHeight);

        Widget _buildContent() {
          log.info('CardDealingBoardWidget - _buildContent()');

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

        return BlocProvider(
          create: (context) => CardDeckCubit(LocalCardRepository(), 10),
          child: _buildContent(),
        );
      }),
    );
  }
}
