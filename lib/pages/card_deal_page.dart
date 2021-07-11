import 'package:flutter/material.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_board.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';

// Card search page is child of provider
class CardDealPage extends StatefulWidget {
  @override
  _CardDealPageState createState() => _CardDealPageState();
}

class _CardDealPageState extends State<CardDealPage> {
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
        child: FlipCardBoardWidget(),
      ),
    );
  }
}
