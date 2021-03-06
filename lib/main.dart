import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/theme.dart';
import 'package:flutter_bloc_exploration/navigation.dart';

void main() {
  // Initialise logger
  initLogger();

  // Run application
  runApp(CardFlipApp());
}

class CardFlipApp extends StatelessWidget {
  final log = getLogger('CardFlipApp');

  @override
  Widget build(BuildContext context) {
    log.info('Building..');
    return MaterialApp(
      title: 'Flutter BloC Card Flip',
      theme: getTheme(context),
      home: Navigation(),
    );
  }
}
