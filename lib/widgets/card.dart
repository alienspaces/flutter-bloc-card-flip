import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_button.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardWidget');

    return BlocProvider(
      create: (context) => CardCubit(FakeCardRepository()),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          log.info('Constraints width ${constraints.maxWidth}');
          log.info('Constraints height ${constraints.maxHeight}');

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlipCardWidget(),
                FlipCardButtonWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
