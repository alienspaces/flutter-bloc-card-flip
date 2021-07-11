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

class _NavigationState extends State<Navigation> {
  // Navigator pages
  List<String> _pageList = [CardBoardPage.pageName];

  // Navigator pages
  List<Page<dynamic>> _pages(BuildContext context) {
    final log = getLogger('Navigation - _pages');
    log.info('Building pages..');

    List<Page<dynamic>> pages = [];

    _pageList.forEach((pageName) {
      switch (pageName) {
        case CardBoardPage.pageName:
          log.info('Adding ${CardBoardPage.pageName}');
          pages.add(CardBoardPage());
          break;
        case CardDealPage.pageName:
          log.info('Adding ${CardDealPage.pageName}');
          pages.add(CardDealPage());
          break;
        default:
        //
      }
    });
    return pages;
  }

  // Handle specific pages being popped
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
