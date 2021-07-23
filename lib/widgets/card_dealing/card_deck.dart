import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardDeckWidget extends StatefulWidget {
  const CardDeckWidget({Key? key}) : super(key: key);

  @override
  _CardDeckWidgetState createState() => _CardDeckWidgetState();
}

class _CardDeckWidgetState extends State<CardDeckWidget> {
  _buildContent(BuildContext context, CardDeckState state) {
    if (state is CardDeckInitial) {
      return CardWidget();
    }
    return GestureDetector(
      onTap: () => null,
      child: Container(
        color: Colors.orange,
        child: Text('Card Deck'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckWidget - build');
    log.info('Building..');

    return BlocConsumer<CardDeckCubit, CardDeckState>(
      listenWhen: (previousState, state) {
        log.info('Listen when called');
        return true;
      },
      listener: (context, state) => null,
      builder: (BuildContext context, CardDeckState state) {
        return Container(
          child: MouseRegion(
            cursor: state is CardDeckReady || state is CardDeckInitial
                ? SystemMouseCursors.click
                : SystemMouseCursors.forbidden,
            child: _buildContent(context, state),
          ),
        );
      },
    );
  }
}
