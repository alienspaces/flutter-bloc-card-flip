import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/header.dart';
import 'package:flutter_bloc_exploration/navigation.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_dealing_board.dart';
import 'package:flutter_bloc_exploration/logger.dart';

class CardDealingPage extends Page {
  static const String pageName = 'CardDealingPage';
  final NavigationCallbacks callbacks;

  CardDealingPage({
    LocalKey key = const ValueKey(CardDealingPage.pageName),
    name = CardDealingPage.pageName,
    required this.callbacks,
  }) : super(key: key, name: name);

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return CardDealScreen(
          callbacks: callbacks,
        );
      },
    );
  }
}

// Card search page is child of provider
class CardDealScreen extends StatefulWidget {
  final NavigationCallbacks callbacks;
  static String pageName = 'CardDeal';

  CardDealScreen({
    Key? key,
    required this.callbacks,
  }) : super(key: key);

  @override
  _CardDealScreenState createState() => _CardDealScreenState();
}

class _CardDealScreenState extends State<CardDealScreen> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDealingPage - build');
    log.info('Building..');

    return Scaffold(
      appBar: header(context, widget.callbacks),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: CardDealingBoardWidget(),
      ),
    );
  }
}
