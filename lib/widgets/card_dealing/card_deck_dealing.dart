import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardDeckDealingAnimation extends StatelessWidget {
  final Size boardDimensions;
  final Size cardDimensions;
  final AnimationController controller;
  final Animation<double> position;

  CardDeckDealingAnimation({
    Key? key,
    required this.boardDimensions,
    required this.cardDimensions,
    required this.controller,
  })  : position = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        ),
        super(key: key);

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    final log = getLogger('CardDeckDealingAnimation');
    log.info('CardDeckDealingAnimation - _buildAnimation - position value ${position.value}');

    return Positioned(
      bottom: 0,
      left: (position.value * cardDimensions.width) + (boardDimensions.width / 3),
      width: cardDimensions.width,
      height: cardDimensions.height,
      child: child!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckDealingAnimation');
    log.fine('CardDeckDealingAnimation - build');

    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
      child: Container(
        child: CardWidget(),
      ),
    );
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
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  // The current stack of widgets being displayed
  List<Widget> cardStack = [];

  Future<void> _animateDeckDealing() async {
    Widget animatedCardWidget = CardDeckDealingAnimation(
      boardDimensions: widget.boardDimensions,
      cardDimensions: widget.cardDimensions,
      controller: _controller,
    );
    Widget cardWidget = Positioned(
      bottom: 0,
      left: widget.boardDimensions.width / 3,
      width: widget.cardDimensions.width,
      height: widget.cardDimensions.height,
      child: CardWidget(),
    );

    List<Widget> cardOutStack = [
      cardWidget,
      animatedCardWidget,
    ];

    List<Widget> cardInStack = [
      animatedCardWidget,
      cardWidget,
    ];

    try {
      for (var count = 0; count < 5; count++) {
        setState(() {
          cardStack = cardOutStack;
        });
        await _controller.forward().orCancel;
        setState(() {
          cardStack = cardInStack;
        });
        await _controller.reverse().orCancel;
      }
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
          _animateDeckDealing();
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
