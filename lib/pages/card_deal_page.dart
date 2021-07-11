import 'package:flutter/material.dart';
import 'package:flutter_bloc_exploration/navigation.dart';

// Application packages
import 'package:flutter_bloc_exploration/widgets/card_deal/card_deal.dart';
import 'package:flutter_bloc_exploration/logger.dart';

class CardDealPage extends Page {
  static const String pageName = 'CardDealPage';
  final NavigationCallbacks callbacks;

  CardDealPage(
      {LocalKey key = const ValueKey(CardDealPage.pageName),
      name = CardDealPage.pageName,
      required this.callbacks})
      : super(key: key, name: name);

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
    final log = getLogger('CardDealPage - build');
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
        child: CardDealWidget(),
      ),
    );
  }
}
