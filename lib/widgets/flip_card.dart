import 'package:flip_card/flip_card_controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';

class FlipCardWidget extends StatefulWidget {
  FlipCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  FlipCardController? controller;

  @override
  void initState() {
    controller = FlipCardController();
    super.initState();
  }

  // getCardFrontImage returns the asset image for the puzzle card
  Image getCardFrontImage() {
    return Image.asset(
      'assets/images/flipped.png',
      fit: BoxFit.fill,
    );
  }

  // getCardBackImage returns the asset image for the puzzle card back
  Image getCardBackImage() {
    return Image.asset(
      'assets/images/unflipped.png',
      fit: BoxFit.fill,
    );
  }

  void _onChange(BuildContext context, CardState state) {
    final log = getLogger('FlipCardWidget - _onChange');
    log.info('Changed!');
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('FlipCardWidget - build');
    log.info('Building..');

    return BlocConsumer<CardCubit, CardState>(
      listenWhen: (previousState, state) {
        log.info('Listen when called');
        if (state is CardFlipping) {
          controller!.toggleCard();
        }
        return true;
      },
      listener: (context, state) => _onChange,
      builder: (BuildContext context, CardState state) {
        return Container(
          child: FlipCard(
            flipOnTouch: false,
            front: Stack(
              children: <Widget>[
                Container(
                  child: Text(state is CardFlipped ? '${state.card.cardNumber}' : ''),
                ),
                Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: getCardBackImage()),
                ),
              ],
            ),
            back: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)), child: getCardFrontImage()),
            ),
            controller: controller,
          ),
        );
      },
    );
  }
}
