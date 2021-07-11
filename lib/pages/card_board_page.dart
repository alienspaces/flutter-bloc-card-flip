import 'package:flutter/material.dart';
import 'package:flutter_bloc_exploration/navigation.dart';

// Application packages
import 'package:flutter_bloc_exploration/widgets/card_board/card_board.dart';
import 'package:flutter_bloc_exploration/logger.dart';

class CardBoardPage extends Page {
  static const String pageName = 'CardBoardPage';
  final NavigationCallbacks callbacks;

  CardBoardPage({
    LocalKey key = const ValueKey(CardBoardPage.pageName),
    name = CardBoardPage.pageName,
    required this.callbacks,
  }) : super(key: key, name: name);

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return CardBoardScreen(
          callbacks: callbacks,
        );
      },
    );
  }
}

// Card board
class CardBoardScreen extends StatefulWidget {
  final NavigationCallbacks callbacks;

  CardBoardScreen({
    Key? key,
    required this.callbacks,
  }) : super(key: key);

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
        title: Text(
          "Card Flip App",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        actions: [
          ElevatedButton(
            onPressed: widget.callbacks.openBoardPage,
            child: Text(
              'Open Board',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: widget.callbacks.openDealPage,
            child: Text(
              'Open Deal',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: CardBoardWidget(),
      ),
    );
  }
}
