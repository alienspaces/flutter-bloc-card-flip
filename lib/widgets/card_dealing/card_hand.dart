import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardHandWidget extends StatefulWidget {
  const CardHandWidget({Key? key}) : super(key: key);

  @override
  _CardHandWidgetState createState() => _CardHandWidgetState();
}

class _CardHandWidgetState extends State<CardHandWidget> {
  void _shuffleDeck(BuildContext context) {
    final cardDeckCubit = BlocProvider.of<CardDeckCubit>(context);
    cardDeckCubit.shuffleDeck();
  }

  void _dealCard(BuildContext context) {
    final cardDeckCubit = BlocProvider.of<CardDeckCubit>(context);
    cardDeckCubit.dealCard();
  }

  _buildContent(BuildContext context, CardDeckState state) {
    final log = getLogger('CardHandWidget');
    log.info('CardHandWidget - _buildContent');

    if (state is CardDeckInitial) {
      log.info('CardHandWidget - _buildContent - CardDeckInitial');
      return GestureDetector(
        onTap: () => log.info('CardHandWidget - _buildContent - CardDeckInitial - TAP'),
        child: CardWidget(),
      );
    }
    if (state is CardDeckShuffling) {
      log.info('CardHandWidget - _buildContent - CardDeckShuffling');
      return GestureDetector(
        onTap: () => log.info('CardHandWidget - _buildContent - CardDeckShuffling - TAP'),
        child: CardWidget(),
      );
    }
    if (state is CardDeckReady) {
      log.info('CardHandWidget - _buildContent - CardDeckReady');
      return GestureDetector(
        onTap: () => log.info('CardHandWidget - _buildContent - CardDeckReady - TAP'),
        child: CardWidget(),
      );
    }
    if (state is CardDeckDealing) {
      log.info('CardHandWidget - _buildContent - CardDeckDealing');
      return GestureDetector(
        onTap: () => log.info('CardHandWidget - _buildContent - CardDeckDealing - TAP'),
        child: CardWidget(),
      );
    }

    log.info('CardHandWidget - _buildContent - Default');

    return GestureDetector(
      onTap: () => log.info('CardHandWidget - _buildContent - Default - TAP'),
      child: CardWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardHandWidget');
    log.info('CardHandWidget- Building..');

    return BlocConsumer<CardDeckCubit, CardDeckState>(
      listenWhen: (previousState, state) {
        log.info('CardHandWidget - Listen when called');
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
