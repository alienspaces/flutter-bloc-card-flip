import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/widgets/card_board/card_board.dart';
import 'package:flutter_bloc_exploration/logger.dart';

class CardBoardPage extends Page {
  static const String pageName = 'CardBoardPage';
  CardBoardPage(
      {LocalKey key = const ValueKey(CardBoardPage.pageName), name = CardBoardPage.pageName})
      : super(key: key, name: name);

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return CardBoardScreen();
      },
    );
  }
}

// Card board
class CardBoardScreen extends StatefulWidget {
  @override
  _CardBoardScreenState createState() => _CardBoardScreenState();
}

class _CardBoardScreenState extends State<CardBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardBoardPage - build');
    log.info('Building..');

    return Scaffold(
      appBar: AppBar(
        title: Text("Card Flip App"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: CardBoardWidget(),
      ),
    );
  }
}
