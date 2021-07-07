import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/widgets/card.dart';

// Card search page is child of provider
class CardSearchPage extends StatefulWidget {
  @override
  _CardSearchPageState createState() => _CardSearchPageState();
}

class _CardSearchPageState extends State<CardSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Flipper"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardWidget(),
            CardWidget(),
          ],
        ),
      ),
    );
  }
}
