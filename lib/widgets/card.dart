import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/size.dart';
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

    double containerWidth = displayWidth(context) / 2.1;
    double containerHeight = displayHeight(context) / 2.4;
    Vector2 cardDims = Vector2(containerWidth, (containerHeight / 4) * 3);
    Vector2 cardButtonDims = Vector2(containerWidth, containerHeight / 8);

    log.info('Card width = $containerWidth');
    log.info('Card height = $containerHeight');

    return BlocProvider(
      create: (context) => CardCubit(FakeCardRepository()),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlipCardWidget(dimensions: cardDims),
              FlipCardButtonWidget(dimensions: cardButtonDims),
            ],
          ),
        ),
      ),
    );
  }
}
