import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardHandWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  const CardHandWidget({
    Key? key,
    required this.boardDimensions,
    required this.cardDimensions,
  }) : super(key: key);

  @override
  _CardHandWidgetState createState() => _CardHandWidgetState();
}

class _CardHandWidgetState extends State<CardHandWidget> {
  List<Widget> cardStack = [];

  _buildCardHand(BuildContext context, CardDeckState state) {
    final log = getLogger('CardHandWidget');
    log.info('CardHandWidget - _buildCardHand');

    int cardCount = 0;
    if (state is CardDeckReady) {
      cardCount = state.hand.length;
    }
    if (state is CardDeckDealing) {
      cardCount = state.hand.length;
    }

    List<Widget> newCardStack = [];
    for (var cardNumber = 0; cardNumber < cardCount; cardNumber++) {
      newCardStack.add(
        Positioned(
          top: 0,
          left: cardNumber * widget.cardDimensions.width,
          width: widget.cardDimensions.width,
          height: widget.cardDimensions.height,
          child: CardWidget(),
        ),
      );
    }

    log.info('CardHandWidget - _buildCardHand - Cards in hand ${newCardStack.length}');

    setState(() {
      cardStack = newCardStack;
    });
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
      listener: (context, state) {
        log.fine('CardHandWidget - listener');
        if (state is CardDeckDealing || state is CardDeckReady) {
          log.fine('CardHandWidget - listener - dealing or ready');
          _buildCardHand(context, state);
        }
      },
      builder: (BuildContext context, CardDeckState state) {
        return Stack(
          children: cardStack,
        );
      },
    );
  }
}
