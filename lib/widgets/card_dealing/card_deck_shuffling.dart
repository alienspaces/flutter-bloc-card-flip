import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardDeckShufflingAnimation extends StatelessWidget {
  final Size boardDimensions;
  final Size cardDimensions;
  final AnimationController controller;
  final Animation<double> position;

  CardDeckShufflingAnimation({
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
    final log = getLogger('CardDeckShufflingAnimation');
    log.info('CardDeckShufflingAnimation - _buildAnimation - position value ${position.value}');

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
    final log = getLogger('CardDeckShufflingAnimation');
    log.fine('CardDeckShufflingAnimation - build');

    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
      child: Container(
        child: CardWidget(),
      ),
    );
  }
}

class CardDeckShufflingWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardDeckShufflingWidget({Key? key, required this.boardDimensions, required this.cardDimensions})
      : super(key: key);

  @override
  _CardDeckShufflingWidgetState createState() => _CardDeckShufflingWidgetState();
}

class _CardDeckShufflingWidgetState extends State<CardDeckShufflingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  List<Widget> cardStack = [];

  @override
  void initState() {
    final log = getLogger('CardDeckShufflingWidget');
    log.fine('CardDeckShufflingWidget - initState');

    _controller.addListener(() {
      log.fine('CardDeckShufflingWidget - controller - listening');
    });

    super.initState();
  }

  Future<void> _playAnimation() async {
    Widget animatedCardWidget = CardDeckShufflingAnimation(
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

    List<Widget> startShuffleStack = [
      cardWidget,
      animatedCardWidget,
    ];

    List<Widget> endtShuffleStack = [
      animatedCardWidget,
      cardWidget,
    ];

    try {
      for (var count = 0; count < 10; count++) {
        setState(() {
          cardStack = startShuffleStack;
        });
        await _controller.forward().orCancel;
        setState(() {
          cardStack = endtShuffleStack;
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
    final log = getLogger('CardDeckShufflingWidget - build');
    log.fine('CardDeckShufflingWidget - build- Building..');

    return BlocConsumer<CardDeckCubit, CardDeckState>(
      listenWhen: (previous, current) {
        log.fine('CardDeckShufflingWidget - listenWhen');
        if (current is CardDeckShuffling) {
          log.fine('CardDeckShufflingWidget - listenWhen - true');
          return true;
        }
        return false;
      },
      listener: (context, state) {
        log.fine('CardDeckShufflingWidget - listener');
        if (state is CardDeckShuffling) {
          log.fine('CardDeckShufflingWidget - listener - Start animation');
          _playAnimation();
        }
      },
      buildWhen: (previous, current) {
        log.fine('CardDeckShufflingWidget - buildWhen');
        return false;
      },
      builder: (BuildContext context, CardDeckState state) {
        log.fine('CardDeckShufflingWidget - builder - Building..');

        return Stack(
          children: cardStack,
        );
      },
    );
  }
}
