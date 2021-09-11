import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card.dart';

class CardDeckShufflingAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> position;
  final Size cardDimensions;

  CardDeckShufflingAnimation({Key? key, required this.controller, required this.cardDimensions})
      : position = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.100,
              curve: Curves.ease,
            ),
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
      left: position.value,
      width: cardDimensions.width,
      height: cardDimensions.height,
      child: child!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckShufflingAnimation');
    log.info('CardDeckShufflingAnimation - build');

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
  final Size cardDimensions;

  CardDeckShufflingWidget({Key? key, required this.cardDimensions}) : super(key: key);

  @override
  _CardDeckShufflingWidgetState createState() => _CardDeckShufflingWidgetState();
}

class _CardDeckShufflingWidgetState extends State<CardDeckShufflingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  @override
  void initState() {
    final log = getLogger('CardDeckShufflingWidget');
    log.info('CardDeckShufflingWidget - initState');

    _controller.addListener(() {
      log.info('CardDeckShufflingWidget - controller - listening');
    });

    super.initState();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
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
    log.info('CardDeckShufflingWidget - build- Building..');

    return BlocConsumer<CardDeckCubit, CardDeckState>(
      listenWhen: (previous, current) {
        log.info('CardDeckShufflingWidget - listenWhen');
        if (current is CardDeckShuffling) {
          log.info('CardDeckShufflingWidget - listenWhen - true');
          return true;
        }
        return false;
      },
      listener: (context, state) {
        log.info('CardDeckShufflingWidget - listener');
        if (state is CardDeckShuffling) {
          log.info('CardDeckShufflingWidget - listener - Start animation');
          _playAnimation();
        }
      },
      buildWhen: (previous, current) {
        log.info('CardDeckShufflingWidget - buildWhen');
        return false;
      },
      builder: (BuildContext context, CardDeckState state) {
        log.info('CardDeckShufflingWidget - builder - Building..');

        return CardDeckShufflingAnimation(
          controller: _controller,
          cardDimensions: widget.cardDimensions,
        );
      },
    );
  }
}
