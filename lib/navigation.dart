import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/pages/card_board_page.dart';
import 'package:flutter_bloc_exploration/pages/card_deal_page.dart';

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
  List<String> _pageList = [CardDealPage.pageName];

  void openBoardPage() {
    setState(() {
      _pageList = [CardBoardPage.pageName];
    });
  }

  void openDealPage() {
    setState(() {
      _pageList = [CardDealPage.pageName];
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
        case CardBoardPage.pageName:
          log.info('Adding ${CardBoardPage.pageName}');
          pages.add(CardBoardPage(callbacks: callbacks));
          break;
        case CardDealPage.pageName:
          log.info('Adding ${CardDealPage.pageName}');
          pages.add(CardDealPage(callbacks: callbacks));
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
