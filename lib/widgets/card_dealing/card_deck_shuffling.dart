import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
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
    return Positioned(
      bottom: 0,
      left: position.value,
      width: cardDimensions.width,
      height: cardDimensions.height,
      child: Container(
        child: CardDeckShufflingWidget(cardDimensions: cardDimensions),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
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
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
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
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckShufflingWidget - build');
    log.info('Building..');

    return Container(
      width: widget.cardDimensions.width,
      height: widget.cardDimensions.height,
      child: CardWidget(),
    );
  }
}
