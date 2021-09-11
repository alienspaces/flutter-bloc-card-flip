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
  void _shuffleDeck(BuildContext context) {
    final cardDeckCubit = BlocProvider.of<CardDeckCubit>(context);
    cardDeckCubit.shuffleDeck();
  }

  void _dealCard(BuildContext context) {
    final cardDeckCubit = BlocProvider.of<CardDeckCubit>(context);
    cardDeckCubit.dealCard();
  }

  _buildContent(BuildContext context, CardDeckState state) {
    final log = getLogger('CardDeckWidget');
    log.info('CardDeckWidget - _buildContent');

    if (state is CardDeckInitial) {
      log.info('CardDeckWidget - _buildContent - CardDeckInitial');
      return GestureDetector(
        onTap: () {
          log.info('CardDeckWidget - _buildContent - CardDeckInitial - TAP');
          _shuffleDeck(context);
        },
        child: CardWidget(),
      );
    }
    if (state is CardDeckShuffling) {
      log.info('CardDeckWidget - _buildContent - CardDeckShuffling');
      return GestureDetector(
        onTap: () => log.info('CardDeckWidget - _buildContent - CardDeckShuffling - TAP'),
        child: CardWidget(),
      );
    }
    if (state is CardDeckReady) {
      log.info('CardDeckWidget - _buildContent - CardDeckReady');
      return GestureDetector(
        onTap: () {
          log.info('CardDeckWidget - _buildContent - CardDeckReady - TAP');
          _dealCard(context);
        },
        child: CardWidget(),
      );
    }
    if (state is CardDeckDealing) {
      log.info('CardDeckWidget - _buildContent - CardDeckDealing');
      return GestureDetector(
        onTap: () => log.info('CardDeckWidget - _buildContent - CardDeckDealing - TAP'),
        child: CardWidget(),
      );
    }

    log.info('CardDeckWidget - _buildContent - Default');

    return GestureDetector(
      onTap: () => log.info('CardDeckWidget - _buildContent - Default - TAP'),
      child: CardWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckWidget');
    log.info('CardDeckWidget- Building..');

    return BlocConsumer<CardDeckCubit, CardDeckState>(
      listenWhen: (previousState, state) {
        log.info('CardDeckWidget - Listen when called');
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
