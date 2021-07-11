import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';

class CardButtonWidget extends StatelessWidget {
  const CardButtonWidget({
    Key? key,
  }) : super(key: key);

  void flipCard(BuildContext context) {
    final log = getLogger('CardButtonWidget - flipCard');
    log.info('Pressed flip');
    final cardCubit = BlocProvider.of<CardCubit>(context);
    cardCubit.flipCard();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardCubit, CardState>(
      listener: (context, state) => null,
      builder: (BuildContext context, CardState state) {
        String label = '';
        if (state is CardInitial || state is CardUnflipped) {
          label = 'Flip It!';
        } else {
          label = 'Unflip it!';
        }

        return Container(
          child: ElevatedButton(
            onPressed: () => flipCard(context),
            child: Text(label),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
              onPrimary: Theme.of(context).colorScheme.onSecondary,
              onSurface: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        );
      },
    );
  }
}
