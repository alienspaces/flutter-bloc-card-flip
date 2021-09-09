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
    log.info('_buildContent');

    if (state is CardDeckInitial) {
      log.info('_buildContent - CardDeckInitial');
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // ElevatedButton(
        //   onPressed: () => _shuffleDeck(context),
        //   child: Text('Shuffle'),
        //   style: ElevatedButton.styleFrom(
        //     primary: Theme.of(context).colorScheme.secondary,
        //     onPrimary: Theme.of(context).colorScheme.onSecondary,
        //     onSurface: Theme.of(context).colorScheme.onSecondary,
        //   ),
        // ),
        Expanded(child: CardWidget()),
      ]);
    }
    // TODO: Animate card deck shuffling
    if (state is CardDeckShuffling) {
      log.info('_buildContent - CardDeckShuffling');
      return CardWidget();
    }
    if (state is CardDeckReady) {
      log.info('_buildContent - CardDeckReady');
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        // ElevatedButton(
        //   onPressed: () => _dealCard(context),
        //   child: Text('Deal'),
        //   style: ElevatedButton.styleFrom(
        //     primary: Theme.of(context).colorScheme.secondary,
        //     onPrimary: Theme.of(context).colorScheme.onSecondary,
        //     onSurface: Theme.of(context).colorScheme.onSecondary,
        //   ),
        // ),
        CardWidget()
      ]);
    }
    // TODO: Animate card dealing
    if (state is CardDeckDealing) {
      log.info('_buildContent - CardDeckDealing');
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [CardWidget()]);
    }

    log.info('_buildContent - Default');

    return GestureDetector(
      onTap: () => null,
      child: Container(
        child: Text('Card Deck'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckWidget');
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
