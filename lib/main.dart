import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/pages/card_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final log = getLogger('MyApp');

  @override
  Widget build(BuildContext context) {
    log.info('Building..');
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => CardCubit(FakeCardRepository()),
        // Card search page as child of provider
        child: CardSearchPage(),
      ),
    );
  }
}
