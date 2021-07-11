import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_container.dart';

// Card search page is child of provider
class FlipCardBoardWidget extends StatefulWidget {
  @override
  _FlipCardBoardWidgetState createState() => _FlipCardBoardWidgetState();
}

class _FlipCardBoardWidgetState extends State<FlipCardBoardWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('FlipCardBoardWidget - build');
    log.info('Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        log.info('Constraints container width ${constraints.maxWidth}');
        log.info('Constraints container height ${constraints.maxHeight}');

        // Size this container according to the number of cards we want
        // to lay out within the available space.
        int cards = 4;
        int cardsAcross = cards ~/ 2;
        int cardsDown = cards ~/ cardsAcross;

        log.info('Cards across $cardsAcross');
        log.info('Cards down $cardsDown');

        // Card width and height will be 2/5 and 3/5 respectively
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

        return Container(
          width: containerWidth,
          height: containerHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlipCardContainer(cardDimensions: Vector2(cardWidth, cardHeight)),
                  FlipCardContainer(cardDimensions: Vector2(cardWidth, cardHeight)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlipCardContainer(cardDimensions: Vector2(cardWidth, cardHeight)),
                  FlipCardContainer(cardDimensions: Vector2(cardWidth, cardHeight)),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
