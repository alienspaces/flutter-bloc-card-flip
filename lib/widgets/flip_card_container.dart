import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_button.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';

class FlipCardContainer extends StatefulWidget {
  final vector.Vector2 cardDimensions;
  const FlipCardContainer({Key? key, required this.cardDimensions}) : super(key: key);

  @override
  _FlipCardContainerState createState() => _FlipCardContainerState();
}

class _FlipCardContainerState extends State<FlipCardContainer> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('FlipCardContainer');

    double cardHeight = (widget.cardDimensions.y * (85 / 100)).floorToDouble();
    double buttonHeight = (widget.cardDimensions.y - cardHeight).floorToDouble();

    log.info('Dimensions width >${widget.cardDimensions.x}<');
    log.info(
      'Provided height >${widget.cardDimensions.y}< Adjusted height card >$cardHeight< button >$buttonHeight<',
    );

    return BlocProvider(
      create: (context) => CardCubit(FakeCardRepository()),
      child: Container(
        width: widget.cardDimensions.x,
        height: widget.cardDimensions.y,
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.greenAccent,
              height: cardHeight,
              width: widget.cardDimensions.x,
              child: FlipCardWidget(),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.blueGrey,
              height: buttonHeight,
              width: widget.cardDimensions.x,
              child: FlipCardButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
