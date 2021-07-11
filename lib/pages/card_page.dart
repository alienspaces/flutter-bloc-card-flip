import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/card.dart';

// Card search page is child of provider
class CardSearchPage extends StatefulWidget {
  @override
  _CardSearchPageState createState() => _CardSearchPageState();
}

class _CardSearchPageState extends State<CardSearchPage> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardSearchPage - build');
    log.info('Building..');

    return Scaffold(
      appBar: AppBar(
        title: Text("Card Flipper"),
      ),
      body: Container(
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
                    CardWidget(cardDimensions: Vector2(cardWidth, cardHeight)),
                    CardWidget(cardDimensions: Vector2(cardWidth, cardHeight)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardWidget(cardDimensions: Vector2(cardWidth, cardHeight)),
                    CardWidget(cardDimensions: Vector2(cardWidth, cardHeight)),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// Container width and height are subsequently calculated
// from the resulting card width and height
// double containerWidth = constraints.maxWidth;
// double containerHeight = constraints.maxHeight;
// Vector2 cardDimensions = Vector2(0, 0);
// // Constrained primarily by height
// void calculateDimensions() {
//   if (containerWidth > containerHeight) {
//     log.info('Constrained by height');
//     cardHeight = containerHeight / cardsDown;
//     cardWidth = (cardHeight * 5) / 2;
//   } else
//   // Constrained primarily width
//   if (containerHeight > containerWidth) {
//     log.info('Constrained by width');
//     cardWidth = containerWidth / cardsAcross;
//     cardHeight = (cardWidth * 5) / 3;
//   }
//   cardDimensions = Vector2(cardWidth, cardHeight);
// }
// calculateDimensions();
// log.info('Before adjust card width ${cardDimensions.x}');
// log.info('Before adjust card height ${cardDimensions.y}');
// if (cardDimensions.x * cardsAcross > constraints.maxWidth) {
//   log.info('Card x dimensions will extend beyond available spaces');
//   cardDimensions.y -=
//       ((cardDimensions.x * cardsAcross) - constraints.maxWidth) / cardsDown;
//   cardDimensions.x = constraints.maxWidth / cardsAcross;
// } else if (cardDimensions.y * cardsDown > constraints.maxHeight) {
//   log.info('Card y dimensions will extend beyond available spaces');
//   cardDimensions.x -=
//       ((cardDimensions.y * cardsDown) - constraints.maxHeight) / cardsAcross;
//   cardDimensions.y = constraints.maxHeight / cardsDown;
// }
// containerWidth = cardDimensions.x * cardsAcross;
// containerHeight = cardDimensions.y * cardsDown;
