import 'package:flutter/material.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_board.dart';
import 'package:vector_math/vector_math.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_container.dart';

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
        child: FlipCardBoardWidget(),
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
