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

  void _onTap(BuildContext context, CardState state) {
    final log = getLogger('FlipCardButtonWidget - flipCard');
    log.info('Pressed flip >$state<');
    if (state is CardUnflipped || state is CardInitial) {
      final cardCubit = BlocProvider.of<CardCubit>(context);
      cardCubit.flipCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('FlipCardWidget - build');

    return BlocConsumer<CardCubit, CardState>(
      listenWhen: (previousState, state) {
        log.info('Listen when called');
        if (state is CardFlipped || state is CardUnflipped) {
          controller!.toggleCard();
        }
        return true;
      },
      listener: (context, state) => _onChange,
      builder: (BuildContext context, CardState state) {
        return Container(
          color: Colors.red,
          child: GestureDetector(
            onTap: () => _onTap(context, state),
            child: FlipCard(
              flipOnTouch: false,
              front: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: getCardBackImage(),
                    ),
                  ),
                ],
              ),
              back: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: getCardFrontImage(),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      right: 10,
                      bottom: 4,
                      child: Text(
                        state is CardFlipped
                            ? '${state.card.cardNumber}'
                            : state is CardUnflipped
                                ? '${state.card.cardNumber}'
                                : '',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              controller: controller,
            ),
          ),
        );
      },
    );
  }
}
