import 'package:flip_card/flip_card_controller.dart';
import 'package:flip_card/flip_card.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';

class FlippableCardWidget extends StatefulWidget {
  FlippableCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FlippableCardWidgetState createState() => _FlippableCardWidgetState();
}

class _FlippableCardWidgetState extends State<FlippableCardWidget> {
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

  // void _onChange(BuildContext context, CardState state) {
  //   final log = getLogger('FlippableCardWidget - _onChange');
  //   log.info('Changed!');
  // }

  // void _onTap(BuildContext context, CardState state) {
  //   final log = getLogger('FlipCardButtonWidget - flipCard');
  //   log.info('Pressed flip >$state<');
  //   if (state is CardUnflipped || state is CardInitial) {
  //     final cardCubit = BlocProvider.of<CardCubit>(context);
  //     cardCubit.flipCard();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('FlippableCardWidget - build');
    log.info('FlippableCardWidget - Building..');

    // return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    //   Size cardDimensions = Size(constraints.maxWidth, constraints.maxHeight);

    //   log.info('Card width ${cardDimensions.width} height ${cardDimensions.height}');

    return Container(
      // width: cardDimensions.width,
      // height: cardDimensions.height,
      child: MouseRegion(
        child: GestureDetector(
          onTap: () => null,
          child: FlipCard(
            flipOnTouch: false,
            front: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
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
                      '',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ],
            ),
            controller: controller,
          ),
        ),
      ),
    );
    // });
  }
}
