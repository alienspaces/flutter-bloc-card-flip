import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/pages/card_flipping_page.dart';
import 'package:flutter_bloc_exploration/pages/card_dealing_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

typedef NavigationCallback = void Function();

class NavigationCallbacks {
  final NavigationCallback openBoardPage;
  final NavigationCallback openDealPage;
  NavigationCallbacks({required this.openBoardPage, required this.openDealPage});
}

class _NavigationState extends State<Navigation> {
  List<String> _pageList = [CardDealingPage.pageName];

  void openBoardPage() {
    setState(() {
      _pageList = [CardFlippingPage.pageName];
    });
  }

  void openDealPage() {
    setState(() {
      _pageList = [CardDealingPage.pageName];
    });
  }

  List<Page<dynamic>> _pages(BuildContext context) {
    final log = getLogger('Navigation - _pages');
    log.info('Building pages..');

    List<Page<dynamic>> pages = [];

    NavigationCallbacks callbacks = NavigationCallbacks(
      openBoardPage: openBoardPage,
      openDealPage: openDealPage,
    );

    _pageList.forEach((pageName) {
      switch (pageName) {
        case CardFlippingPage.pageName:
          log.info('Adding ${CardFlippingPage.pageName}');
          pages.add(CardFlippingPage(callbacks: callbacks));
          break;
        case CardDealingPage.pageName:
          log.info('Adding ${CardDealingPage.pageName}');
          pages.add(CardDealingPage(callbacks: callbacks));
          break;
        default:
        //
      }
    });
    return pages;
  }

  bool _onPopPage(Route<dynamic> route, dynamic result, BuildContext context) {
    final log = getLogger('Navigation - _onPopPage');
    log.info('Page name ${route.settings.name}');

    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('Navigation - build');
    log.info('Building..');
    return Navigator(
      key: navigatorKey,
      pages: _pages(context),
      onPopPage: (route, result) => _onPopPage(route, result, context),
    );
  }
}
