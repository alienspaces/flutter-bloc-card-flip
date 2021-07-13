import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card_board/card_container.dart';

// The card board lays out a board of cards
class CardBoardWidget extends StatefulWidget {
  @override
  _CardBoardWidgetState createState() => _CardBoardWidgetState();
}

class _CardBoardWidgetState extends State<CardBoardWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardBoardWidget - build');
    log.info('Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        log.info('Constraints container width ${constraints.maxWidth}');
        log.info('Constraints container height ${constraints.maxHeight}');

        // Size this container according to the number of cards we want
        // to lay out within the available space.
        int cardsAcross = 3;
        int cardsDown = 2;

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

        double containerWidth = cardWidth * cardsAcross;
        double containerHeight = cardHeight * cardsDown;

        log.info('Container width $containerWidth');
        log.info('Container height $containerHeight');

        Widget _buildContent() {
          List<Widget> _columnWidgets = [];
          for (var currRow = 0; currRow < cardsDown; currRow++) {
            List<Widget> _rowWidgets = [];
            for (var currCol = 0; currCol < cardsAcross; currCol++) {
              _rowWidgets.add(CardContainer(cardDimensions: Vector2(cardWidth, cardHeight)));
            }
            _columnWidgets.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _rowWidgets,
            ));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _columnWidgets,
          );
        }

        return Container(
          width: containerWidth,
          height: containerHeight,
          child: _buildContent(),
        );
      }),
    );
  }
}
