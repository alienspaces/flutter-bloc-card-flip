import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardDeckDealingAnimation extends StatelessWidget {
  final Size boardDimensions;
  final Size cardDimensions;
  final int cardNumber;
  final AnimationController controller;

  CardDeckDealingAnimation({
    Key? key,
    required this.boardDimensions,
    required this.cardDimensions,
    required this.cardNumber,
    required this.controller,
  }) : super(key: key);

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context) {
    final log = getLogger('CardDeckDealingAnimation');
    log.info('CardDeckDealingAnimation - _buildAnimation - card number $cardNumber');

    double cardStartLeft = boardDimensions.width / 3;
    double cardStartTop = boardDimensions.height - cardDimensions.height;
    double cardEndLeft = cardNumber * cardDimensions.width;
    double cardEndTop = 0;

    log.info('CardDeckDealingAnimation - _buildAnimation - cardStartLeft $cardStartLeft');
    log.info('CardDeckDealingAnimation - _buildAnimation - cardStartTop $cardStartTop');
    log.info('CardDeckDealingAnimation - _buildAnimation - cardEndLeft $cardEndLeft');
    log.info('CardDeckDealingAnimation - _buildAnimation - cardEndTop $cardEndTop');

    return PositionedTransition(
      rect: RelativeRectTween(
          begin: RelativeRect.fromSize(
            Rect.fromLTWH(cardStartLeft, cardStartTop, cardDimensions.width, cardDimensions.height),
            boardDimensions,
          ),
          end: RelativeRect.fromSize(
            Rect.fromLTWH(cardEndLeft, cardEndTop, cardDimensions.width, cardDimensions.height),
            boardDimensions,
          )).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      )),
      child: CardWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckDealingAnimation');
    log.fine('CardDeckDealingAnimation - build');

    return _buildAnimation(context);
  }
}

class CardDeckDealingWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardDeckDealingWidget({Key? key, required this.boardDimensions, required this.cardDimensions})
      : super(key: key);

  @override
  _CardDeckDealingWidgetState createState() => _CardDeckDealingWidgetState();
}

class _CardDeckDealingWidgetState extends State<CardDeckDealingWidget>
    with SingleTickerProviderStateMixin {
  // Animation controller is essentially an animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  // The current stack of widgets being displayed
  List<Widget> cardStack = [];

  Future<void> _animateDeckDealing(BuildContext context, CardDeckDealing state) async {
    Widget animatedCardWidget = CardDeckDealingAnimation(
      boardDimensions: widget.boardDimensions,
      cardDimensions: widget.cardDimensions,
      cardNumber: state.hand.length,
      controller: _controller,
    );

    List<Widget> cardDealingStack = [
      animatedCardWidget,
    ];

    try {
      setState(() {
        cardStack = cardDealingStack;
      });
      await _controller.forward().orCancel;
      setState(() {
        cardStack = [];
      });
      _controller.reset();
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckDealingWidget - build');
    log.fine('CardDeckDealingWidget - build- Building..');

    return BlocConsumer<CardDeckCubit, CardDeckState>(
      listenWhen: (previous, current) {
        log.fine('CardDeckDealingWidget - listenWhen');
        if (current is CardDeckDealing) {
          log.fine('CardDeckDealingWidget - listenWhen - true');
          return true;
        }
        return false;
      },
      listener: (context, state) {
        log.fine('CardDeckDealingWidget - listener');
        if (state is CardDeckDealing) {
          log.fine('CardDeckDealingWidget - listener - Start animation');
          _animateDeckDealing(context, state);
        }
      },
      buildWhen: (previous, current) {
        log.fine('CardDeckDealingWidget - buildWhen');
        return false;
      },
      builder: (BuildContext context, CardDeckState state) {
        log.fine('CardDeckDealingWidget - builder - Building..');

        return Stack(
          children: cardStack,
        );
      },
    );
  }
}
