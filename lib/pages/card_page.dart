import 'package:flutter/material.dart';

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
          log.info('Constraints width ${constraints.maxWidth}');
          log.info('Constraints height ${constraints.maxHeight}');

          // Size this container according to the number of cards we want
          // to lay out within the available space.
          int cards = 4;
          int cardsAcross = cards ~/ 2;
          int cardsDown = cards ~/ cardsAcross;

          // Card width and height will be 2/5 and 3/5 respectively
          double cardWidth = 0;
          double cardHeight = 0;

          // Container width and height are subsequently calculated
          // from the resulting card width and height
          double pageWidth = 0;
          double pageHeight = 0;

          // Constrained primarily by height
          if (constraints.maxWidth > constraints.maxHeight) {
            log.info('Constrained by height');
            cardHeight = constraints.maxHeight / cardsDown;
            cardWidth = (cardHeight * 5) / 2;

            pageWidth = cardWidth * cardsAcross;
            pageHeight = cardHeight * cardsDown;
          } else
          // Constrained primarily width
          if (constraints.maxHeight > constraints.maxWidth) {
            log.info('Constrained by width');
            cardWidth = constraints.maxWidth / cardsAcross;
            cardHeight = (cardWidth * 5) / 3;

            pageWidth = cardWidth * cardsAcross;
            pageHeight = cardHeight * cardsDown;
          }

          log.info('Card width $cardWidth');
          log.info('Card height $cardHeight');

          log.info('Page width $pageWidth');
          log.info('Page height $pageHeight');

          return Container(
            width: pageWidth,
            height: pageHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardWidget(),
                    CardWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardWidget(),
                    CardWidget(),
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
