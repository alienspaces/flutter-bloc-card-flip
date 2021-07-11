import 'package:flutter/material.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_board.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';

// Card search page is child of provider
class CardFlipPage extends StatefulWidget {
  @override
  _CardFlipPageState createState() => _CardFlipPageState();
}

class _CardFlipPageState extends State<CardFlipPage> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardFlipPage - build');
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
