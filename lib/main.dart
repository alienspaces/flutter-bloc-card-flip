import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/pages/card_page.dart';

void main() {
  // Initialise logger
  initLogger();

  // Run application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final log = getLogger('MyApp');

  @override
  Widget build(BuildContext context) {
    log.info('Building..');
    return MaterialApp(
      title: 'Material App',
      home: CardSearchPage(),
    );
  }
}
