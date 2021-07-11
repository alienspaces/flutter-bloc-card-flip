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
