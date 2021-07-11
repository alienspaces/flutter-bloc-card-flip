import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/widgets/card_deal/card_deal.dart';
import 'package:flutter_bloc_exploration/logger.dart';

class CardDealPage extends Page {
  static const String pageName = 'CardDealPage';
  CardDealPage({LocalKey key = const ValueKey(CardDealPage.pageName), name = CardDealPage.pageName})
      : super(key: key, name: name);

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return CardDealScreen();
      },
    );
  }
}

// Card search page is child of provider
class CardDealScreen extends StatefulWidget {
  static String pageName = 'CardDeal';

  @override
  _CardDealScreenState createState() => _CardDealScreenState();
}

class _CardDealScreenState extends State<CardDealScreen> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDealPage - build');
    log.info('Building..');

    return Scaffold(
      appBar: AppBar(
        title: Text("Card Flip App"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: CardDealWidget(),
      ),
    );
  }
}
