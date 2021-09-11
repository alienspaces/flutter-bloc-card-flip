import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/header.dart';
import 'package:flutter_bloc_exploration/navigation.dart';
import 'package:flutter_bloc_exploration/widgets/card_flipping/card_flipping_board.dart';
import 'package:flutter_bloc_exploration/logger.dart';

class CardFlippingPage extends Page {
  static const String pageName = 'CardFlippingPage';
  final NavigationCallbacks callbacks;

  CardFlippingPage({
    LocalKey key = const ValueKey(CardFlippingPage.pageName),
    name = CardFlippingPage.pageName,
    required this.callbacks,
  }) : super(key: key, name: name);

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return CardFlippingScreen(
          callbacks: callbacks,
        );
      },
    );
  }
}

class CardFlippingScreen extends StatefulWidget {
  final NavigationCallbacks callbacks;

  CardFlippingScreen({
    Key? key,
    required this.callbacks,
  }) : super(key: key);

  @override
  _CardFlippingScreenState createState() => _CardFlippingScreenState();
}

class _CardFlippingScreenState extends State<CardFlippingScreen> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardFlippingPage - build');
    log.info('Building..');

    return Scaffold(
      appBar: header(context, widget.callbacks),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: CardFlippingBoardWidget(),
      ),
    );
  }
}
