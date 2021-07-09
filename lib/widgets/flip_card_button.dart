import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';

class FlipCardButtonWidget extends StatelessWidget {
  final Vector2 dimensions;
  const FlipCardButtonWidget({Key? key, required this.dimensions}) : super(key: key);

  void flipCard(BuildContext context) {
    final log = getLogger('FlipCardButtonWidget - flipCard');
    log.info('Pressed flip');
    final cardCubit = BlocProvider.of<CardCubit>(context);
    cardCubit.flipCard();
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('FlipCardButtonWidget');

    log.info('Card button width = ${dimensions.x}');
    log.info('Card button height = ${dimensions.y}');

    return Container(
      width: dimensions.x,
      height: dimensions.y,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: ElevatedButton(
        onPressed: () => flipCard(context),
        child: Text('Flip It!'),
      ),
    );
  }
}
