import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck.dart';

// The card board lays out a board of cards
class CardDeckContainerWidget extends StatefulWidget {
  @override
  _CardDeckContainerWidgetState createState() => _CardDeckContainerWidgetState();
}

class _CardDeckContainerWidgetState extends State<CardDeckContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckWidget - build');
    log.info('Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          log.info('Constraints container width ${constraints.maxWidth}');
          log.info('Constraints container height ${constraints.maxHeight}');

          double containerWidth = constraints.maxWidth;
          double containerHeight = constraints.maxHeight / 2;

          log.info('Container width $containerWidth');
          log.info('Container height $containerHeight');

          Widget _buildContent() {
            return CardDeckWidget();
          }

          return BlocProvider(
            create: (context) => CardDeckCubit(LocalCardRepository(), 10),
            child: Container(
              child: _buildContent(),
            ),
          );
        },
      ),
    );
  }
}
