import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';

class FlipCardButtonWidget extends StatelessWidget {
  const FlipCardButtonWidget({
    Key? key,
  }) : super(key: key);

  void flipCard(BuildContext context) {
    final log = getLogger('FlipCardButtonWidget - flipCard');
    log.info('Pressed flip');
    final cardCubit = BlocProvider.of<CardCubit>(context);
    cardCubit.flipCard();
  }

  @override
  Widget build(BuildContext context) {
    // final log = getLogger('FlipCardButtonWidget');

    // log.info('Card button width = ${dimensions.x}');
    // log.info('Card button height = ${dimensions.y}');

    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: ElevatedButton(
        onPressed: () => flipCard(context),
        child: Text('Flip It!'),
      ),
    );
  }
}
